import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../viewmodels/invoice_viewmodel.dart';

class InvoiceScannerScreen extends StatefulWidget {
  final String apiKey;
  final userId = 'Pedro Perez';

  const InvoiceScannerScreen({super.key, required this.apiKey});

  @override
  State<InvoiceScannerScreen> createState() => _InvoiceScannerScreenState();
}

class _InvoiceScannerScreenState extends State<InvoiceScannerScreen> {
  late final InvoiceViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = InvoiceViewModel(apiKey: widget.apiKey, userId: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    // 🟢 Título padding superior
    Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
      child: Row(
        children: [
          const Icon(Icons.document_scanner, color: Colors.green, size: 28),
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


              // Botones Galería y Cámara
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.photo_library),
                      label: const Text('Galería'),
                      onPressed: () async {
                        await _viewModel.pickAndAnalyzeImageFromGallery();
                        setState(() {});
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
                        await _viewModel.captureAndAnalyzeImageFromCamera();
                        setState(() {});
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

              // Imagen escaneada
              if (_viewModel.currentImage != null)
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.memory(
                      _viewModel.currentImage!,
                      fit: BoxFit.contain,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                ),

              if (_viewModel.lastError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    _viewModel.lastError!,
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              const SizedBox(height: 10),

              if (_viewModel.messages.isNotEmpty && !_viewModel.isLoading)
                const Padding(
                  padding: EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    'Resultados del análisis:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              Expanded(
                child: _viewModel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _viewModel.messages.isEmpty
                        ? const Center(
                            child: Text(
                              'Selecciona o captura una factura para analizar',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : ListView.builder(
                            itemCount: _viewModel.messages.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 3,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: MarkdownBody(
                                    data: _viewModel.messages[index],
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
      ),
    );
  }
}
