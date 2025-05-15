import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Guardar información del usuario en Firestore
  Future<void> saveUserInfo({
    required String uid,
    required String nombreCompleto,
    required String email,
    required String telefono,
  }) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'nombreCompleto': nombreCompleto,
        'email': email,
        'telefono': telefono,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Error al guardar usuario en Firestore: $e');
    }
  }

  // Obtener información del usuario desde Firestore
  Future<Map<String, dynamic>> getUserInfo(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      return doc.data() as Map<String, dynamic>? ?? {};
    } catch (e) {
      throw Exception('Error al leer usuario de Firestore: $e');
    }
  }

  // Actualizar información del usuario en Firestore
  Future<void> updateUserInfo({
    required String uid,
    String? nombreCompleto,
    String? telefono,
  }) async {
    try {
      Map<String, dynamic> updateData = {
        'updatedAt': FieldValue.serverTimestamp(),
      };

      if (nombreCompleto != null) {
        updateData['nombreCompleto'] = nombreCompleto;
      }

      if (telefono != null) {
        updateData['telefono'] = telefono;
      }

      await _firestore.collection('users').doc(uid).update(updateData);
    } catch (e) {
      throw Exception('Error al actualizar usuario en Firestore: $e');
    }
  }
}
