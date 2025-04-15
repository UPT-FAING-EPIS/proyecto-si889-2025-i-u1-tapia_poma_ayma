import 'package:flutter/material.dart';
import '../viewmodels/json_table.dart';
import '../viewmodels/user_balance_viewmodel.dart';

class BalanceSummaryScreen extends StatefulWidget {
  const BalanceSummaryScreen({super.key});

  @override
  State<BalanceSummaryScreen> createState() => _BalanceSummaryScreenState();
}

class _BalanceSummaryScreenState extends State<BalanceSummaryScreen> {
  final InvoiceViewModel _invoiceViewModel = InvoiceViewModel();
  final UserBalanceViewModel _balanceViewModel = UserBalanceViewModel();
  bool isLoading = true;
  String? errorMessage;
  double totalSpent = 0.0;
  double availableBalance = 0.0;
  List<Map<String, dynamic>> transactions = [];

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
      totalSpent = _invoiceViewModel.getTotalSum();

      await _balanceViewModel.loadBalance();
      availableBalance = _balanceViewModel.getBalance();

      transactions = _invoiceViewModel.allPurchases;
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
                Text(label,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700])),
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
      body: isLoading
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
                      // Título
                      Padding(
                        padding: const EdgeInsets.only(top: 34.0, bottom: 16.0),
                        child: Row(
                          children: [
                            const Icon(Icons.account_balance, color: Colors.green, size: 28),
                            const SizedBox(width: 8),
                            Text(
                              'Resumen de Balance',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Tarjetas de saldo/gasto/restante
                      buildInfoCard(
                        icon: Icons.account_balance_wallet,
                        label: 'Saldo Total',
                        value: '\$${availableBalance.toStringAsFixed(2)}',
                        color: Colors.green,
                      ),
                      buildInfoCard(
                        icon: Icons.trending_down,
                        label: 'Gasto Total',
                        value: '\$${totalSpent.toStringAsFixed(2)}',
                        color: Colors.red,
                      ),
                      buildInfoCard(
                        icon: Icons.attach_money,
                        label: 'Dinero Restante',
                        value: '\$${(availableBalance - totalSpent).toStringAsFixed(2)}',
                        color: (availableBalance - totalSpent) >= 0
                            ? Colors.green
                            : Colors.red,
                      ),

                      const SizedBox(height: 24),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.history, color: Colors.blue.shade700, size: 24),
                              const SizedBox(width: 8),
                              Text(
                                'Últimas Transacciones',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),

                      const SizedBox(height: 8),
                      Expanded(
                        child: ListView.builder(
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = transactions[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                leading: const Icon(Icons.shopping_cart, color: Colors.blue),
                                title: Text(
                                  '${transaction['producto']}: \$${transaction['precio'].toStringAsFixed(2)}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  'Categoría: ${transaction['categoria']}\nFecha: ${transaction['fecha']}',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
