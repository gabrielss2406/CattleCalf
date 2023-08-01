class User{
  final String cpf;
  final String name;
  final String password;
  final String email;
  final String phone;
  final String? address_idAddress;

  const User({
    required this.cpf,
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.address_idAddress
  });

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'annotation': name,
      'password': password,
      'email': email,
      'phone': phone,
      'address_idAddress': address_idAddress
    };
  }

  @override
  String toString() {
    return 'User{cpf: $cpf, name: $name, password: $password}';
  }
}