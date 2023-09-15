class Weight {
  final int? idWeighing;
  final double weight;
  final String date;

  const Weight(
      {required this.idWeighing, required this.weight, required this.date});

  static List<Map<String, dynamic>> convertWeightListToJSONList(
      List<Weight> weightList) {
    return weightList.map((weight) => weight.toJson()).toList();
  }

  @override
  String toString() {
    return 'Weight{idWeighing: $idWeighing, weight: $weight, date: $date}';
  }

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      idWeighing: json['idWeighing'],
      weight: double.parse(json['weight'].toString()),
      date: json['date'],
    );
  }

  static List<Weight> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => Weight.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "idWeighing": idWeighing,
      "weight": weight,
      "date": date,
    };
  }
}
