import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/invoice_viewmodel.dart';

class TextInvoiceScreen extends StatelessWidget {
  const TextInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Accede al InvoiceViewModel desde el contexto
    final invoiceViewModel = Provider.of<InvoiceViewModel>(context);
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            // Título con ícono
            Row(
              children: [
                const Icon(Icons.receipt_long, color: Colors.green, size: 28),
                const SizedBox(width: 8),
                Text(
                  'Factura por Texto',
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
              'Ingresa la factura en formato de texto:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Caja de texto dentro de un Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _controller,
                  maxLines: 10,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Ejemplo:\nManzana 1.50\nDetergente 3.75\n...',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Botón
            SizedBox(
              width: double.infinity,
              child: invoiceViewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton.icon(
                      onPressed: () async {
                        final inputText = _controller.text.trim();

                        if (inputText.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('El campo de factura no puede estar vacío.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        // Llamar al método para procesar la factura
                        await invoiceViewModel.processTextInvoice(inputText);

                        final message = invoiceViewModel.lastError ??
                            'Factura procesada correctamente.';
                        final color = invoiceViewModel.lastError != null ? Colors.red : Colors.green;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(message), backgroundColor: color),
                        );
                      },
                      icon: const Icon(Icons.upload_rounded),
                      label: const Text('Procesar Factura'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
