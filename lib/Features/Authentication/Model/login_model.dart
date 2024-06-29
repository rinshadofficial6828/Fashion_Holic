class LoginModel {
  late String email;
  late String password;

  LoginModel({required this.email, required this.password});

  // Add toJson method to convert the model to a Map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
