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

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      idWeight: json['idWeight'],
      weight: json['weight'],
      date: json['date'],
    );
  }

  static List<Weight> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => Weight.fromJson(json)).toList();
  }
}