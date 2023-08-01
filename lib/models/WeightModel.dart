class Weight{
  final int? idWeight;
  final double weight;
  final String date;

  const Weight({
    required this.idWeight,
    required this.weight,
    required this.date
  });

  Map<String, dynamic> toMap() {
    return {
      'idWeight': idWeight,
      'annotation': weight,
      'date': date
    };
  }

  @override
  String toString() {
    return 'Weight{idWeight: $idWeight, weight: $weight, date: $date}';
  }
}