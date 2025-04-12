import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../../viewmodels/auth_viewmodel.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final authViewModel = context.read<AuthViewModel>();
    // Inicializamos con los valores actuales del JSON
    _nameController = TextEditingController(
      text: authViewModel.localUserData['nombre completo'] ?? '',
    );
    _phoneController = TextEditingController(
      text: authViewModel.localUserData['telefono'] ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    final authViewModel = context.read<AuthViewModel>();
    final scaffold = ScaffoldMessenger.of(context);

    try {
      // Actualizar SOLO el JSON local
      await authViewModel.updateLocalUserData(
        fullName: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
      );

      if (mounted) {
        scaffold.showSnackBar(
          const SnackBar(content: Text('Cambios guardados exitosamente')),
        );
        context.pop(); // Regresar a la pantalla anterior
      }
    } catch (e) {
      scaffold.showSnackBar(
        SnackBar(content: Text('Error al guardar: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();
    final localData = authViewModel.localUserData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        backgroundColor: const Color(0xFF00C49A),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => _saveChanges(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Campo de solo lectura (UID del JSON)
              _buildReadOnlyField(
                'ID de Usuario',
                localData['uid'] ?? 'No disponible',
                Icons.fingerprint,
              ),

              const SizedBox(height: 20),

              // Campo de solo lectura (Email del JSON)
              _buildReadOnlyField(
                'Correo Electrónico',
                localData['email'] ?? 'No disponible',
                Icons.email,
              ),

              const SizedBox(height: 30),

              // Campo editable (Nombre completo)
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre Completo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su nombre';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Campo editable (Teléfono)
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su teléfono';
                  }
                  if (!RegExp(r'^[0-9]{9}$').hasMatch(value)) {
                    return 'Debe tener 9 dígitos';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // Botón de guardar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      authViewModel.loading
                          ? null
                          : () => _saveChanges(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C49A),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child:
                      authViewModel.loading
                          ? const CircularProgressIndicator()
                          : const Text('GUARDAR CAMBIOS'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 12),
              Text(value),
            ],
          ),
        ),
      ],
    );
  }
}
