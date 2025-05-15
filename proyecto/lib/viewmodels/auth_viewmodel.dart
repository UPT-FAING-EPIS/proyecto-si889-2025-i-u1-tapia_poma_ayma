import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  User? _user;
  User? get user => _user;

  bool _loading = false;
  bool get loading => _loading;

  // Datos del usuario desde Firestore
  Map<String, dynamic> _userData = {};
  Map<String, dynamic> get userData => _userData;

  // Carga la información del usuario desde Firestore
  Future<void> loadUserData() async {
    if (_user != null) {
      _userData = await _firestoreService.getUserInfo(_user!.uid);
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
      // Registro con Firebase Auth
      final userCredential = await _authService.signUpWithEmail(
        email,
        password,
      );

      if (userCredential != null) {
        // Guardar datos adicionales en Firestore
        await _firestoreService.saveUserInfo(
          uid: userCredential.uid,
          nombreCompleto: fullName,
          email: email,
          telefono: phone,
        );

        // Actualizar estado
        _user = userCredential;
        await loadUserData();
      }
    } catch (e) {
      throw e;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // Inicio de sesión con email y contraseña
  Future<void> login(String email, String password) async {
    _loading = true;
    notifyListeners();
    try {
      _user = await _authService.signInWithEmail(email, password);
      await loadUserData();
    } catch (e) {
      rethrow;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // Inicio de sesión con Google
  Future<void> loginWithGoogle() async {
    _loading = true;
    notifyListeners();
    try {
      _user = await _authService.signInWithGoogle();

      if (_user != null) {
        // Verificar si es un usuario nuevo o existente
        final userDoc = await _firestoreService.getUserInfo(_user!.uid);

        if (userDoc.isEmpty) {
          // Usuario nuevo - guardar datos en Firestore
          await _firestoreService.saveUserInfo(
            uid: _user!.uid,
            nombreCompleto: _user!.displayName ?? 'Usuario Google',
            email: _user!.email ?? '',
            telefono: _user!.phoneNumber ?? '',
          );
        }

        await loadUserData();
      }
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
    _userData = {};
    notifyListeners();
  }

  // Actualizar datos del usuario en Firestore
  Future<void> updateUserProfile({
    required String fullName,
    required String phone,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      if (_user != null) {
        await _firestoreService.updateUserInfo(
          uid: _user!.uid,
          nombreCompleto: fullName,
          telefono: phone,
        );
        await loadUserData();
      }
    } catch (e) {
      throw Exception('Error al actualizar perfil: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // Escucha los cambios en la sesión
  Stream<User?> get authState => _authService.authStateChanges;
}
