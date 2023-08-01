class Type{
  final int? idType;
  final String type;

  const Type({
    required this.idType,
    required this.type
  });

  Map<String, dynamic> toMap() {
    return {
      'idType': idType,
      'type': type
    };
  }

  @override
  String toString() {
    return 'Image{idType: $idType, type: $type}';
  }
}