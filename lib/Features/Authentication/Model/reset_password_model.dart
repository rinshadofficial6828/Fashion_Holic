class ResetPasswordModel {
  late String email;
  late String newPassword;
  late String confirmPassword;

  ResetPasswordModel({
   required this.email,
   required this.newPassword,
   required this.confirmPassword
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'new_password': newPassword,
      'confirm_new_password': confirmPassword,
    };
  }
}