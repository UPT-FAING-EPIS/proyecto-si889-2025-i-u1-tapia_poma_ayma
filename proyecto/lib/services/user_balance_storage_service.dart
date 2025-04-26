// lib/data/services/user_balance_storage_service.dart

import 'dart:convert';
import 'dart:io';
import 'package:idea1/domain/models/user_balance_model.dart';
import 'package:path_provider/path_provider.dart';

class UserBalanceStorageService {
  static Future<void> save(UserBalance userBalance) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/user_balance.json';
      final file = File(filePath);
      final jsonContent = jsonEncode(userBalance.toJson());
      await file.writeAsString(jsonContent);
    } catch (e) {
      print('Error al guardar el balance: $e');
    }
  }

  static Future<UserBalance?> load() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/user_balance.json';
      final file = File(filePath);

      if (await file.exists()) {
        final content = await file.readAsString();
        final jsonData = jsonDecode(content);
        return UserBalance.fromJson(jsonData);
      }
    } catch (e) {
      print('Error al cargar el balance: $e');
    }
    return null;
  }
}
