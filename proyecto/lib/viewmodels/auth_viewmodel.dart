import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import '../services/local_database_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final LocalDatabaseService localDbService = LocalDatabaseService();

  User? _user;
  User? get user => _user;

  bool _loading = false;
  bool get loading => _loading;

  // Datos locales del usuario (JSON)
  Map<String, dynamic> _localUserData = {};
  Map<String, dynamic> get localUserData => _localUserData;

  // Carga la información del usuario desde el JSON
  Future<void> loadLocalUserData() async {
    if (_user != null) {
      _localUserData = await localDbService.getUserInfoLocally(_user!.uid);
      notifyListeners();
    }
  }

  // Registro de usuario
  Future<void> register({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      // Registro con Firebase
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Obtener el UID
      final uid = userCredential.user?.uid;
      if (uid != null) {
        // Guardar datos extra en el JSON local
        await localDbService.saveUserInfoLocally(
          uid: uid,
          nombreCompleto: fullName,
          email: email,
          telefono: phone,
        );

        // Actualizar estado
        _user = userCredential.user;
        await loadLocalUserData(); // Cargar datos locales después de registrar
      }
    } catch (e) {
      throw e;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // Inicio de sesión
  Future<void> login(String email, String password) async {
    _loading = true;
    notifyListeners();
    try {
      _user = await _authService.signInWithEmail(email, password);
      await loadLocalUserData(); // Cargar datos locales al iniciar sesión
    } catch (e) {
      rethrow;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // Cerrar sesión
  Future<void> logout() async {
    await _authService.signOut();
    _user = null;
    _localUserData = {};
    notifyListeners();
  }

  // Actualiza solo los datos locales (JSON)
  Future<void> updateLocalUserData({
    required String fullName,
    required String phone,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      if (_user != null) {
        await localDbService.updateUserInfoLocally(
          uid: _user!.uid,
          nombreCompleto: fullName,
          telefono: phone,
        );
        await loadLocalUserData(); // Recargar datos locales después de la actualización
      }
    } catch (e) {
      throw Exception('Error al actualizar datos locales: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // Escucha los cambios en la sesión
  Stream<User?> get authState => _authService.authStateChanges;

  // Métodos de autenticación social (implementarlos de forma similar si se requiere)
  Future<void> loginWithGoogle() async {
    // Implementación que incluya la carga de datos locales al final
  }

  Future<void> loginWithFacebook() async {
    // Implementación que incluya la carga de datos locales al final
  }
}
