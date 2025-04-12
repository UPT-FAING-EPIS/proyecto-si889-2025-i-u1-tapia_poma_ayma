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
  List<Map<String, dynamic>> transactions = []; // Lista de transacciones reales

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
      // Cargar datos de las facturas
      await _invoiceViewModel.loadAndProcessData();
      totalSpent = _invoiceViewModel.getTotalSum();

      // Cargar el balance del usuario
      await _balanceViewModel.loadBalance();
      availableBalance = _balanceViewModel.getBalance();

      // Obtener las transacciones reales desde allPurchases
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
                      const SizedBox(height: 16),
                      Text(
                        'Saldo Total: \$${availableBalance.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Gasto Total: \$${totalSpent.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Dinero Restante: \$${(availableBalance - totalSpent).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: (availableBalance - totalSpent) >= 0
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Últimas Transacciones',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
                              child: ListTile(
                                leading: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.blue,
                                ),
                                title: Text(
                                  '${transaction['producto']}: \$${transaction['precio'].toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
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