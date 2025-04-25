// lib/data/models/user_balance_model.dart

class UserBalance {
  final String userId;
  final double balance;

  UserBalance({
    required this.userId,
    required this.balance,
  });

  /// Serializa el modelo a JSON
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'balance': balance,
      };

  /// Crea una instancia del modelo desde un JSON
  factory UserBalance.fromJson(Map<String, dynamic> json) => UserBalance(
        userId: json['userId'],
        balance: (json['balance'] as num).toDouble(),
      );

  /// Devuelve una copia del modelo con valores opcionalmente modificados
  UserBalance copyWith({
    String? userId,
    double? balance,
  }) {
    return UserBalance(
      userId: userId ?? this.userId,
      balance: balance ?? this.balance,
    );
  }
}
