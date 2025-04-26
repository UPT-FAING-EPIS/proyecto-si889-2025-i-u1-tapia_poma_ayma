import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/routes/go_router.dart';
import 'viewmodels/auth_viewmodel.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
      ),
    );
  }
}
