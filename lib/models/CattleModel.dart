// ignore_for_file: non_constant_identifier_names

class Cattle{
  final int? idCattle;
  final String breed;
  final String birthDate;
  final String cattle_idCattle_sire;
  final String cattle_idCattle_dam;
  final String weight_idWeight;
  final String image_idImage;
  final String annotation_idAnnotation;

  const Cattle({
    required this.idCattle,
    required this.breed,
    required this.birthDate,
    required this.cattle_idCattle_sire,
    required this.cattle_idCattle_dam,
    required this.weight_idWeight,
    required this.image_idImage,
    required this.annotation_idAnnotation
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
}