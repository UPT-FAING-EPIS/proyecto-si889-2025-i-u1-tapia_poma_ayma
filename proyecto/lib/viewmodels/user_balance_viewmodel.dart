
import 'package:idea1/domain/models/user_balance_model.dart';
import 'package:idea1/services/user_balance_storage_service.dart';

class UserBalanceViewModel {
  UserBalance? userBalance;

  // Carga el balance del usuario desde el servicio
  Future<void> loadBalance() async {
    userBalance = await UserBalanceStorageService.load();
    userBalance ??= UserBalance(userId: 'default_user', balance: 0.0);
  }

  // Guarda el balance del usuario usando el servicio
  Future<void> saveBalance() async {
    if (userBalance == null) {
      throw Exception('El balance no está inicializado.');
    }
    await UserBalanceStorageService.save(userBalance!);
  }

  // Obtiene el balance actual
  double getBalance() {
    return userBalance?.balance ?? 0.0;
  }

  // Agrega una cantidad al balance actual
  Future<void> addToBalance(double amount) async {
    if (userBalance == null) {
      throw Exception('El balance no está cargado.');
    }
    userBalance = UserBalance(
      userId: userBalance!.userId,
      balance: userBalance!.balance + amount,
    );
    await saveBalance();
  }

  // Reemplaza completamente el balance actual
  Future<void> replaceBalance(double newBalance) async {
    if (userBalance == null) {
      throw Exception('El balance no está cargado.');
    }
    userBalance = UserBalance(
      userId: userBalance!.userId,
      balance: newBalance,
    );
    await saveBalance();
  }
}
