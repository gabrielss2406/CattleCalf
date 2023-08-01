class Image{
  final int? idImage;
  final String image;

  const Image({
    required this.idImage,
    required this.image
  });

  Map<String, dynamic> toMap() {
    return {
      'idImage': idImage,
      'image': image
    };
  }

  @override
  String toString() {
    return 'Image{idImage: $idImage, image: $image}';
  }
}