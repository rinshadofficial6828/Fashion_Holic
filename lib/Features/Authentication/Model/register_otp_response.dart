class OTPResponse {
  final String message;
  final bool status;

  OTPResponse({
    required this.message,
    required this.status,
  });

  factory OTPResponse.fromJson(Map<String, dynamic> json) {
    return OTPResponse(
      message: json['message'],
      status: json['status'],
    );
  }
}
