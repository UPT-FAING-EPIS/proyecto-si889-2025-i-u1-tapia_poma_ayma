import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:idea1/core/utils/formato_json.dart';
import 'package:idea1/viewmodels/auth_viewmodel.dart';
import 'package:idea1/viewmodels/image_picker_service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart'; // Importa el paquete para formatear fechas

class InvoiceViewModel extends ChangeNotifier {
  final GenerativeModel _model;
  late final ChatSession _chat;
  final ImagePickerService _imagePickerService = ImagePickerService();

  List<String> messages = [];
  bool isLoading = false;
  Uint8List? currentImage;
  String? lastError;

  InvoiceViewModel({required String apiKey})
    : _model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey) {
    _chat = _model.startChat();
  }

  // Método para obtener el UID dinámicamente
  String _getUserId(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();
    return authViewModel.user?.uid ??
        'unknown_user'; // Obtén el UID del usuario
  }

  // Método para analizar una imagen
  Future<void> analyzeImage(Uint8List imageBytes, BuildContext context) async {
    final userId = _getUserId(context); // Obtén el UID del usuario
    isLoading = true;
    messages.add("Analizando factura...");
    notifyListeners();

    try {
      final response = await _chat.sendMessage(
        Content.multi([
          TextPart(_getAnalysisPrompt(userId)), // Usa el UID dinámico
          DataPart('image/jpeg', imageBytes),
        ]),
      );

      if (response.text != null) {
        messages.add(response.text!);
        await FileUtils.saveResponseToJson(response.text!);
        notifyListeners();
      }
    } catch (e) {
      lastError = 'Error al analizar la imagen: ${e.toString()}';
      messages.add(lastError!);
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Método para procesar una factura en texto
  Future<void> processTextInvoice(
    String invoiceText,
    BuildContext context,
  ) async {
    final userId = _getUserId(context); // Obtén el UID del usuario
    try {
      isLoading = true;
      messages.add("Procesando factura de texto...");
      notifyListeners();

      final response = await _chat.sendMessage(
        Content.text(
          _getTextAnalysisPrompt(invoiceText, userId), // Usa el UID dinámico
        ),
      );

      if (response.text != null) {
        messages.add(response.text!);
        await FileUtils.saveResponseToJson(response.text!);
        notifyListeners();
      }
    } catch (e) {
      lastError = 'Error al procesar la factura de texto: ${e.toString()}';
      messages.add(lastError!);
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Método para seleccionar imagen de la galería
  Future<void> pickAndAnalyzeImageFromGallery(BuildContext context) async {
    try {
      lastError = null;
      final imageBytes = await _imagePickerService.pickImageFromGallery();
      if (imageBytes == null) return;

      currentImage = imageBytes;
      await analyzeImage(imageBytes, context);
    } catch (e) {
      lastError = 'Error al seleccionar imagen: ${e.toString()}';
      messages.add(lastError!);
      notifyListeners(); // Notificar a los oyentes de los cambios
    }
  }

  // Método para capturar imagen de la cámara
  Future<void> captureAndAnalyzeImageFromCamera(BuildContext context) async {
    try {
      lastError = null;
      final imageBytes = await _imagePickerService.captureImageFromCamera();
      if (imageBytes == null) return;

      currentImage = imageBytes;
      await analyzeImage(imageBytes, context);
    } catch (e) {
      lastError = 'Error al capturar imagen: ${e.toString()}';
      messages.add(lastError!);
      notifyListeners(); // Notificar a los oyentes de los cambios
    }
  }

  // Método para limpiar los datos
  void clearData() {
    messages.clear();
    currentImage = null;
    lastError = null;
    isLoading = false;
    notifyListeners(); // Notificar a los oyentes de los cambios
  }

  // Método para obtener la fecha actual en el formato deseado
  String _getCurrentDate() {
    final now = DateTime.now();
    return DateFormat('dd/MM/yyyy').format(now); // Formato: "día/mes/año"
  }

  // Prompts reutilizables
  String _getAnalysisPrompt(String userId) {
    final currentDate = _getCurrentDate(); // Obtén la fecha actual
    return """
      Solo extrae no des más conversación ni una entrada de diálogo solo dame a la categoría que pertenece
      (Categorías: Alimentos, Hogar, Ropa, Salud, Tecnología, Entretenimiento, Transporte, Mascotas, Otros:otros no pertenece a 
      ninguna de las otras categorías),el nombre del producto,el precio, el usuario(El nombre de usuario ya esta definodo) y la fecha.Que estén en un formato json.
      Si la fecha no se especifica, usa la fecha actual: $currentDate.
      Si lo que se entrega no es una factura, no respondas nada.
      Si la fecha está en el futuro reemplaza la fecha por la fecha actual: $currentDate.
      Si lo que se entrega no son datos como precios o productos, no respondas nada.
      No tomar en cuenta las horas, minutos y segundos de la fecha.
      Ejemplo de tipo de respuesta que quiero:
        {
          "compras": [
            {
              "categoria": "Alimentos",
              "producto": "Manzana",
              "precio": 1.50,
              "usuario": "$userId",
              "fecha": "$currentDate"
            }
          ]
        }
    """;
  }

  String _getTextAnalysisPrompt(String invoiceText, String userId) {
    final currentDate = _getCurrentDate(); // Obtén la fecha actual
    return """

      Solo extrae no des más conversación ni una entrada de diálogo solo dame a la categoría que pertenece
      (Categorías: Alimentos, Hogar, Ropa, Salud, Tecnología, Entretenimiento, Transporte, Mascotas, Otros:otros no pertenece a 
      ninguna de las otras categorías),el nombre del producto,el precio, el usuario(El nombre de usuario ya esta definodo) y la fecha.Que estén en un formato json.
      Si la fecha no se especifica, usa la fecha actual: $currentDate.
      Si lo que se entrega no son datos como precios o productos, no respondas nada.
      Si la fecha está en el futuro reemplaza la fecha por la fecha actual: $currentDate.
      No tomar en cuenta las horas, minutos y segundos de la fecha.
      Ejemplo de tipo de respuesta que quiero:
      {
        "compras": [
          {
            "categoria": "Alimentos",
            "producto": "Manzana",
            "precio": 1.50,
            "usuario": "$userId",
            "fecha": "$currentDate"
          }
        ]
      }
      
      Factura:
      $invoiceText
    """;
  }
}
