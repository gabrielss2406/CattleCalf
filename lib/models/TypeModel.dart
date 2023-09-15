class Type{
  final int? idType;
  final String name;

  const Type({
    required this.idType,
    required this.name
  });

  static List<Map<String, dynamic>> convertTypeListToJSONList(
      List<Type> typeList) {
    return typeList.map((type) => type.toJson()).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'idType': idType,
      'name': name
    };
  }

  @override
  String toString() {
    return 'Type{idType: $idType, name: $name}';
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