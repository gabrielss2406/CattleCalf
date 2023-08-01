class Expense{
  final int? idExpense;
  final String amount;
  final String date;
  final String type_idType;

  const Expense({
    required this.idExpense,
    required this.amount,
    required this.date,
    required this.type_idType
  });

  Map<String, dynamic> toMap() {
    return {
      'idExpense': idExpense,
      'annotation': amount,
      'date': date,
      'type_idType': type_idType
    };
  }

  @override
  String toString() {
    return 'User{idExpense: $idExpense, amount: $amount, date: $date}';
  }
}