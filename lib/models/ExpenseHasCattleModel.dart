class ExpenseHasCattle{
  final int expense_idExpense;
  final int cattle_idCattle;

  const ExpenseHasCattle({
    required this.expense_idExpense,
    required this.cattle_idCattle
  });

  Map<String, dynamic> toMap() {
    return {
      'expense_idExpense': expense_idExpense,
      'annotation': cattle_idCattle
    };
  }

  @override
  String toString() {
    return 'User{expense_idExpense: $expense_idExpense, cattle_idCattle: $cattle_idCattle}';
  }
}