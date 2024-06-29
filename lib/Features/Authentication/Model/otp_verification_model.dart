class OtpVerificationModel {
  final String email;
  final String otp;

  OtpVerificationModel({required this.email, required this.otp});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'otp': otp,
    };
  }
}
