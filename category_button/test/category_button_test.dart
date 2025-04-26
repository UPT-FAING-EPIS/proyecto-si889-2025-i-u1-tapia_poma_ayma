import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:category_button/category_button.dart';

void main() {
  testWidgets('CategoryButton renders correctly', (WidgetTester tester) async {
    // Construimos el widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CategoryButton(
            category: 'Test Category',
            onTap: () {},
          ),
        ),
      ),
    );

    // Verificamos si el texto 'Test Category' aparece en pantalla
    expect(find.text('Test Category'), findsOneWidget);

    // Verificamos si el ícono de categoría aparece
    expect(find.byIcon(Icons.category), findsOneWidget);
  });

  testWidgets('CategoryButton triggers onTap', (WidgetTester tester) async {
    // Creamos una variable para comprobar si se llamó a onTap
    bool tapped = false;

    // Construimos el widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CategoryButton(
            category: 'Test Category',
            onTap: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    // Simulamos un tap en el botón
    await tester.tap(find.byType(CategoryButton));

    // Hacemos que el widget se reconstruya
    await tester.pump();

    // Verificamos si el tap fue detectado
    expect(tapped, isTrue);
  });
}
