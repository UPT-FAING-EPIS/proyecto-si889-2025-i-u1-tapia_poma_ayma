import 'package:flutter/material.dart';
import '../../../viewmodels/json_table.dart';
import '../../../viewmodels/user_balance_viewmodel.dart';
import '../../../viewmodels/category_filter_viewmodel.dart';
import '../../filtered_purchases_screen.dart';
import '../../../widgets/category_button.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final InvoiceViewModel _invoiceViewModel = InvoiceViewModel();
  final UserBalanceViewModel _balanceViewModel = UserBalanceViewModel();
  bool isLoading = true;
  String? errorMessage;
  List<Map<String, dynamic>> allPurchases = [];

  final List<String> categories = [
    'Alimentos',
    'Transporte',
    'Entretenimiento',
    'Salud',
    'Educación',
    'Hogar',
    'Otros',
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await _invoiceViewModel.loadAndProcessData();
      final totalSpent = _invoiceViewModel.getTotalSum();
      allPurchases = _invoiceViewModel.allPurchases;

      await _balanceViewModel.loadBalance();
      _balanceViewModel.setTotalSpent(totalSpent);
    } catch (e) {
      setState(() {
        errorMessage = 'Error al cargar los datos: ${e.toString()}';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _navigateToFilteredPurchases(String category) {
    final filterViewModel = CategoryFilterViewModel(allPurchases);
    final filteredPurchases = filterViewModel.filterByCategory(category);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => FilteredPurchasesScreen(
              category: category,
              filteredPurchases: filteredPurchases,
            ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 34.0, bottom: 16.0),
      child: Row(
        children: [
          const Icon(Icons.pie_chart, color: Colors.green, size: 28),
          const SizedBox(width: 8),
          Text(
            'Gastos por Categorías',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCards() {
    return Column(
      children: [
        buildInfoCard(
          icon: Icons.account_balance_wallet,
          label: 'Saldo Total',
          value: '\$${_balanceViewModel.getBalance().toStringAsFixed(2)}',
          color: Colors.green,
        ),
        buildInfoCard(
          icon: Icons.trending_down,
          label: 'Gasto Total',
          value: '\$${_invoiceViewModel.getTotalSum().toStringAsFixed(2)}',
          color: Colors.red,
        ),
        buildInfoCard(
          icon: Icons.attach_money,
          label: 'Dinero Restante',
          value: '\$${_balanceViewModel.remainingBalance.toStringAsFixed(2)}',
          color: _balanceViewModel.isInPositive ? Colors.green : Colors.red,
        ),
      ],
    );
  }

  Widget _buildCategoryGrid() {
    return Expanded(
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (context, index) {
          return CategoryButton(
            category: categories[index],
            onTap: () => _navigateToFilteredPurchases(categories[index]),
          );
        },
      ),
    );
  }

  Widget buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : errorMessage != null
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _loadData,
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              )
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    _buildInfoCards(),
                    const SizedBox(height: 24),
                    _buildCategoryGrid(),
                  ],
                ),
              ),
    );
  }
}
