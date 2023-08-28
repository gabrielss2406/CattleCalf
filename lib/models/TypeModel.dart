class Type{
  final int? idType;
  final String? name;

  const Type({
    required this.idType,
    required this.name
  });

  Map<String, dynamic> toMap() {
    return {
      'idType': idType,
      'name': name
    };
  }

  @override
  String toString() {
    return 'Image{idType: $idType, name: $name}';
  }

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      idType: json['idType'],
      name: json['name'],
    );
  }

  static List<Type> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => Type.fromJson(json)).toList();
  }
}