import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Agrega el paquete provider
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../viewmodels/invoice_viewmodel.dart';

class InvoiceScannerScreen extends StatelessWidget {
  final String apiKey;

  const InvoiceScannerScreen({super.key, required this.apiKey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InvoiceViewModel>(
      create: (context) => InvoiceViewModel(apiKey: apiKey),
      child: Scaffold(
        appBar: AppBar(title: const Text('Escanear Factura')),
        body: const InvoiceScannerBody(),
      ),
    );
  }
}

class InvoiceScannerBody extends StatelessWidget {
  const InvoiceScannerBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el ViewModel del contexto
    final viewModel = context.watch<InvoiceViewModel>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.document_scanner,
                    color: Colors.green,
                    size: 28,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Escanear Factura',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Botones de galería y cámara
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Galería'),
                    onPressed: () async {
                      await viewModel.pickAndAnalyzeImageFromGallery(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green.shade700,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: Colors.green.withOpacity(0.3),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Cámara'),
                    onPressed: () async {
                      await viewModel.captureAndAnalyzeImageFromCamera(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green.shade700,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: Colors.green.withOpacity(0.3),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Mostrar la imagen escaneada
            if (viewModel.currentImage != null)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.memory(
                    viewModel.currentImage!,
                    fit: BoxFit.contain,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
              ),

            // Mostrar mensaje de error
            if (viewModel.lastError != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  viewModel.lastError!,
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            const SizedBox(height: 10),

            // Mostrar resultados del análisis
            if (viewModel.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (viewModel.messages.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Text(
                  'Resultados del análisis:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

            Expanded(
              child: ListView.builder(
                itemCount: viewModel.messages.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: MarkdownBody(
                        data: viewModel.messages[index],
                        styleSheet: MarkdownStyleSheet(
                          p: const TextStyle(fontSize: 15),
                          strong: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                        ),
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
