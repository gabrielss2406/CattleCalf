class SimpleObject{
  final int id;
  final String name;
  final double value;

  const SimpleObject({
    required this.id,
    required this.name,
    required this.value
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'value': value
    };
  }
}