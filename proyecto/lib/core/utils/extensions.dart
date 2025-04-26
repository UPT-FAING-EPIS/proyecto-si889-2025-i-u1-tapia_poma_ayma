extension CurrencyFormat on double {
  String toCurrency() => '\$${toStringAsFixed(2)}';
}
