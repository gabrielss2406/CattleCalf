// ignore_for_file: non_constant_identifier_names

class Cattle{
  final int? idCattle;
  final String breed;
  final String birthDate;
  final int? cattle_idCattle_sire;
  final int? cattle_idCattle_dam;
  final String? weight_idWeight;
  final String? image_idImage;
  final String? annotation_idAnnotation;

  const Cattle({
    required this.idCattle,
    required this.breed,
    required this.birthDate,
    this.cattle_idCattle_sire,
    this.cattle_idCattle_dam,
    this.weight_idWeight,
    this.image_idImage,
    this.annotation_idAnnotation
  });

  Map<String, dynamic> toMap() {
    return {
      'idCattle': idCattle,
      'annotation': breed,
      'birthDate': birthDate,
      'cattle_idCattle_sire': cattle_idCattle_sire,
      'cattle_idCattle_dam': cattle_idCattle_dam,
      'weight_idWeight': weight_idWeight,
      'image_idImage': image_idImage,
      'annotation_idAnnotation': annotation_idAnnotation
    };
  }

  @override
  String toString() {
    return 'Cattle{idCattle: $idCattle, breed: $breed, birthDate: $birthDate}';
  }

  factory Cattle.fromJson(Map<String, dynamic> json) {
    return Cattle(
      idCattle: json['idCattle'],
      breed: json['breed'],
      birthDate: json['birthDate'],
      cattle_idCattle_sire: json['cattle_idCattle_sire'],
      cattle_idCattle_dam: json['cattle_idCattle_dam'],
      weight_idWeight: json['weight_idWeight'],
      image_idImage: json['image_idImage'],
      annotation_idAnnotation: json['annotation_idAnnotation'],
    );
  }

  static List<Cattle> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => Cattle.fromJson(json)).toList();
  }
}