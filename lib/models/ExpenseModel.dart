class Expense{
  final int? idExpense;
  final double amount;
  final String date;
  final int type_idType;

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

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      idExpense: json['idExpense'],
      amount: json['amount'],
      date: json['date'],
      type_idType: json['type_idType'],
    );
  }

  static List<Expense> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => Expense.fromJson(json)).toList();
  }

  
}