class RegisterModel {
  late String name;
  late String email;
  late String password;
  late String password2;
  late String mobile;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.password2,
    required this.mobile,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password2': password2,
      'mobile': mobile,
    };
  }
}
