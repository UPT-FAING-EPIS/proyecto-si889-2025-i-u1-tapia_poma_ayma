
import 'package:idea1/domain/models/invoice_item_model.dart';

class InvoiceResponse {
  final List<InvoiceItem> purchases;
  final String rawResponse;

  InvoiceResponse({
    required this.purchases,
    required this.rawResponse,
  });

  factory InvoiceResponse.fromJson(Map<String, dynamic> json, String raw) {
    final purchases = (json['compras'] as List)
        .map((item) => InvoiceItem.fromJson(item))
        .toList();
    
    return InvoiceResponse(
      purchases: purchases,
      rawResponse: raw,
    );
  }
}