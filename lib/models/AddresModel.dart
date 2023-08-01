class Address{
  final int? idAddress;
  final String state;
  final String city;

  const Address({
    required this.idAddress,
    required this.state,
    required this.city
  });

  Map<String, dynamic> toMap() {
    return {
      'idAddress': idAddress,
      'annotation': state,
      'city': city
    };
  }

  @override
  String toString() {
    return 'Address{idAddress: $idAddress, state: $state, city: $city}';
  }
}