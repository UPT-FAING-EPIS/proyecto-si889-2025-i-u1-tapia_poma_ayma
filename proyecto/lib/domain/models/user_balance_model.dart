// lib/data/models/user_balance_model.dart

class UserBalance {
  final String userId;
  final double balance;

  UserBalance({
    required this.userId,
    required this.balance,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'balance': balance,
      };

  factory UserBalance.fromJson(Map<String, dynamic> json) => UserBalance(
        userId: json['userId'],
        balance: (json['balance'] as num).toDouble(),
      );
}
