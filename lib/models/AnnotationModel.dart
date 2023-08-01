class Annotation{
  final int? idAnnotation;
  final String annotation;
  final String date;
  final String reminder;

  const Annotation({
    required this.idAnnotation,
    required this.annotation,
    required this.date,
    required this.reminder
  });

  Map<String, dynamic> toMap() {
    return {
      'idAnnotation': idAnnotation,
      'annotation': annotation,
      'date': date,
      'reminder': reminder
    };
  }

  @override
  String toString() {
    return 'Annotation{idAnnotation: $idAnnotation, annotation: $annotation, date: $date, reminder: $reminder}';
  }
}