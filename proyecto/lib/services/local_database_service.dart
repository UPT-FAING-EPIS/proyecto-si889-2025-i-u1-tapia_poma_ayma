import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalDatabaseService {
  // Obtiene la ruta local para guardar el archivo JSON
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Obtiene el archivo en el que se guardarán los usuarios
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/users.json');
  }

  // Guarda un usuario en el archivo JSON
  Future<void> saveUserInfoLocally({
    required String uid,
    required String nombreCompleto,
    required String email,
    required String telefono,
  }) async {
    try {
      final file = await _localFile;
      Map<String, dynamic> data = {};

      if (await file.exists()) {
        final content = await file.readAsString();
        data = jsonDecode(content);
      }

      data['users'] ??= {};
      data['users'][uid] = {
        'uid': uid,
        'nombre completo': nombreCompleto,
        'email': email,
        'telefono': telefono,
        'transacciones': [],
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      };

      await file.writeAsString(jsonEncode(data));
    } catch (e) {
      throw Exception('Error al guardar usuario localmente: $e');
    }
  }

  // Obtiene la información de un usuario específico
  Future<Map<String, dynamic>> getUserInfoLocally(String uid) async {
    try {
      final file = await _localFile;

      if (!await file.exists()) {
        return {};
      }

      final content = await file.readAsString();
      final data = jsonDecode(content);

      if (data['users'] != null && data['users'][uid] != null) {
        return Map<String, dynamic>.from(data['users'][uid]);
      }

      return {};
    } catch (e) {
      throw Exception('Error al leer usuario local: $e');
    }
  }

  // Actualiza la información de un usuario existente
  Future<void> updateUserInfoLocally({
    required String uid,
    String? nombreCompleto,
    String? telefono,
  }) async {
    try {
      final file = await _localFile;

      if (!await file.exists()) {
        throw Exception('El archivo no existe');
      }

      final content = await file.readAsString();
      final data = jsonDecode(content);

      if (data['users'] == null || data['users'][uid] == null) {
        throw Exception('Usuario no encontrado');
      }

      if (nombreCompleto != null) {
        data['users'][uid]['nombre completo'] = nombreCompleto;
      }

      if (telefono != null) {
        data['users'][uid]['telefono'] = telefono;
      }

      // Actualiza la fecha de modificación
      data['users'][uid]['updated_at'] = DateTime.now().toIso8601String();

      await file.writeAsString(jsonEncode(data));
    } catch (e) {
      throw Exception('Error al actualizar usuario local: $e');
    }
  }

  // Elimina un usuario del archivo local
  Future<void> deleteUserLocally(String uid) async {
    try {
      final file = await _localFile;

      if (!await file.exists()) {
        return;
      }

      final content = await file.readAsString();
      final data = jsonDecode(content);

      if (data['users'] != null) {
        data['users'].remove(uid);
        await file.writeAsString(jsonEncode(data));
      }
    } catch (e) {
      throw Exception('Error al eliminar usuario local: $e');
    }
  }

  // Obtiene todos los usuarios (útil para debug)
  Future<Map<String, dynamic>> getAllUsers() async {
    try {
      final file = await _localFile;

      if (!await file.exists()) {
        return {};
      }

      final content = await file.readAsString();
      return jsonDecode(content);
    } catch (e) {
      throw Exception('Error al leer todos los usuarios: $e');
    }
  }

  // Limpia todos los datos locales (para testing o logout)
  Future<void> clearAllLocalData() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      throw Exception('Error al limpiar datos locales: $e');
    }
  }

  Future<void> readUsers() async {
    try {
      final file = await _localFile;

      if (await file.exists()) {
        String content = await file.readAsString();
        Map<String, dynamic> users = jsonDecode(content);
        print('Usuarios almacenados:');
        print(users);
      } else {
        print('El archivo no existe.');
      }
    } catch (e) {
      print('Error al leer el archivo JSON: $e');
    }
  }
}
