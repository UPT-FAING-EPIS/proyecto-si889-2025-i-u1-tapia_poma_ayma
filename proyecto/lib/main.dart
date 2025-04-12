import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:idea1/services/local_database_service.dart';
import 'package:idea1/view/home_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'viewmodels/auth_viewmodel.dart';
import 'core/routes/go_router.dart'; // ✅ tu nuevo archivo con GoRouter

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  LocalDatabaseService().readUsers(); // Llamar para leer y mostrar los datos
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Gestión Financiera',
        routerConfig: router,
      ),
    );
  }
}

class InvoiceAnalyzerApp extends StatelessWidget {
  const InvoiceAnalyzerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factura Analyzer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light, // Cambiado a modo claro
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(), // Cambia la pantalla inicial a HomeScreen
    );
  }
}
