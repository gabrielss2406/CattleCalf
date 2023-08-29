class Annotation {
  final int? idAnnotation;
  final String annotation;
  final String date;
  final String reminder;

  const Annotation({
    required this.idAnnotation,
    required this.annotation,
    required this.date,
    required this.reminder,
  });

  Map<String, dynamic> toMap() {
    return {
      'idAnnotation': idAnnotation,
      'annotation': annotation,
      'date': date,
      'reminder': reminder,
    };
  }

  @override
  String toString() {
    return 'Annotation{idAnnotation: $idAnnotation, annotation: $annotation, date: $date, reminder: $reminder}';
  }

  factory Annotation.fromJson(Map<String, dynamic> json) {
    return Annotation(
      idAnnotation: json['idAnnotation'],
      annotation: json['annotation'],
      date: json['date'],
      reminder: json['reminder'],
    );
  }

  static List<Annotation> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => Annotation.fromJson(json)).toList();
  }
}
