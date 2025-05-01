import 'package:flutter/material.dart';
import 'package:idea1/view/screens/home/balance_summary_screen_categoris.dart';
import 'package:idea1/view/screens/home/invoice_scanner_screen.dart';
import 'package:idea1/view/screens/home/text_invoice_screen.dart';
import 'package:idea1/view/screens/home/user_balance_screen.dart';
import '../../screens/home/profile_screen.dart';
import 'package:idea1/view/screens/home/balance_summary_screen.dart';

// import 'json_viewer_screen.dart';
// import 'category_summary_screen.dart';
// import 'purchase_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const InvoiceScannerScreen(
      apiKey: "AIzaSyAPwGfQo9eI2KubbXhabdH8ESDRR4s5Llo",
    ),
    const TextInvoiceScreen(),
    const UserBalanceScreen(),
    const BalanceSummaryScreen(),
    const CategoriesScreen(),
    const ProfileScreen(),
  ];

  void _onCameraPressed() {
    setState(() {
      _currentIndex = 0; // índice de la cámara (Escáner)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _onCameraPressed,
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.camera_alt, color: Colors.teal),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFE0FFF0),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavIcon(Icons.text_fields, 1),
              _buildNavIcon(Icons.account_balance_wallet, 2),
              const SizedBox(width: 40), // espacio para FAB
              _buildNavIcon(Icons.account_balance, 3),
              _buildNavIcon(Icons.category, 4),
              _buildNavIcon(Icons.person, 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: _currentIndex == index ? Colors.black : Colors.black54,
      ),
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
