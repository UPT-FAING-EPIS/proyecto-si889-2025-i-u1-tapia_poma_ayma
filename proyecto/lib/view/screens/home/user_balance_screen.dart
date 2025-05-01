import 'package:flutter/material.dart';
import '../../../viewmodels/user_balance_viewmodel.dart';

class UserBalanceScreen extends StatefulWidget {
  const UserBalanceScreen({super.key});

  @override
  State<UserBalanceScreen> createState() => _UserBalanceScreenState();
}

class _UserBalanceScreenState extends State<UserBalanceScreen> {
  final UserBalanceViewModel _viewModel = UserBalanceViewModel();
  final TextEditingController _balanceController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBalance();
  }

  Future<void> _loadBalance() async {
    setState(() {
      isLoading = true;
    });
    await _viewModel.loadBalance();
    setState(() {
      _balanceController.text = _viewModel.getBalance().toStringAsFixed(2);
      isLoading = false;
    });
  }

  Future<void> _addToBalance() async {
    final amount = double.tryParse(_balanceController.text);
    if (amount == null || amount <= 0) {
      _showError('Por favor, ingrese un monto válido mayor a 0.');
      return;
    }
    await _viewModel.addToBalance(amount);
    _showMessage('Monto agregado exitosamente');
    _loadBalance();
  }

  Future<void> _replaceBalance() async {
    final newBalance = double.tryParse(_balanceController.text);
    if (newBalance == null || newBalance < 0) {
      _showError('Por favor, ingrese un monto válido mayor o igual a 0.');
      return;
    }
    await _viewModel.replaceBalance(newBalance);
    _showMessage('Balance reemplazado exitosamente');
    _loadBalance();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showError(String error) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(error), backgroundColor: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título estilizado como en "Gastos por Categorías"
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        const Icon(
                          Icons.account_balance_wallet,
                          color: Colors.green,
                          size: 28,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Configurar Balance',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      'Monto actual:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 20,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.attach_money,
                              size: 28,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                controller: _balanceController,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontSize: 18),
                                decoration: const InputDecoration(
                                  labelText: 'Monto',
                                  prefixText: '\$',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _addToBalance,
                            icon: const Icon(Icons.add),
                            label: const Text('Agregar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _replaceBalance,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Reemplazar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
    );
  }
}
