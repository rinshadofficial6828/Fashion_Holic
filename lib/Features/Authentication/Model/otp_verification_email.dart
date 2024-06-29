class EmailModel {
  String email;

  EmailModel({required this.email,});

  // Add toJson method to convert the model to a Map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
