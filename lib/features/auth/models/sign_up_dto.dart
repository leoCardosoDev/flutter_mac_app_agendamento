class SignUpDto {
  final String fullName;
  final String cpf;
  final String cellPhone;
  final String email;
  final String password;

  const SignUpDto({
    required this.fullName,
    required this.cpf,
    required this.cellPhone,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'document': cpf,
      'phone': cellPhone,
      'email': email,
      'password': password,
    };
  }
}
