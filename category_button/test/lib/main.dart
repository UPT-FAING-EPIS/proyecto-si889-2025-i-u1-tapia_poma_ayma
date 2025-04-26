import 'package:flutter/material.dart';
import 'package:category_button/category_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Category Button Example')),
        body: Center(
          child: CategoryButton(
            category: 'Compras',
            onTap: () {
              print('Botón presionado');
            },
          ),
        ),
      ),
    );
  }
}
