import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fashion_app/Custom/urls.dart';
import 'package:fashion_app/Features/Authentication/Model/email_verification_model.dart';
import 'package:fashion_app/Features/Authentication/Model/login_model.dart';
import 'package:fashion_app/Features/Authentication/Model/login_response.dart';
import 'package:fashion_app/Features/Authentication/Model/otp_verification_email.dart';
import 'package:fashion_app/Features/Authentication/Model/otp_verification_model.dart';
import 'package:fashion_app/Features/Authentication/Model/register_model.dart';
import 'package:fashion_app/Features/Authentication/Model/register_otp_response.dart';
import 'package:fashion_app/Features/Authentication/Model/register_response_model.dart';
import 'package:fashion_app/Features/Authentication/Model/reset_password_model.dart';

class AuthRepository {
  Future<LoginResponse?> login({required LoginModel? loginModel}) async {
    try {
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  var data = loginModel?.toJson();
  var dio = Dio();
  var response = await dio.request(
    '${Urls.baseUrl}/login/',
    options: Options(
      method: 'POST',
      headers: headers,
    ),
    data: data,
  );

  if (response.statusCode == 200) {
    return LoginResponse.fromJson(response.data);
  } else {
  }
} catch (e) {
  print("Error: $e");
}
  }

 //!Register
 Future<RegisterResponseModel?> register({required RegisterModel registerModel}) async {
   try {
  var data = FormData.fromMap(registerModel.toMap());

  var dio = Dio();
  var response = await dio.request(
    '${Urls.baseUrl}/register/',  // Make sure to include the protocol (http or https)
    options: Options(
      method: 'POST',
    ),
    data: data,
  );

  if (response.statusCode == 200) {
    print(response.data);
    return RegisterResponseModel.fromJson(response.data);
  } else {
    print(response.statusMessage);
  }
} catch (e) {
  print('Error ---------------------------------->: $e');
  print(registerModel.toMap());
}
 }

 //!otp
 Future<OTPResponse?> otpVerification({required OtpVerificationModel otpVerificationModel}) async {
  try {
    var data = FormData.fromMap(otpVerificationModel.toMap());

    var dio = Dio();
    var response = await dio.request(
      '${Urls.baseUrl}/verify-otp/',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
     return  OTPResponse.fromJson(response.data);
    } else if (response.statusCode == 400) {
      print(json.encode(response.data));
    } else if (response.statusCode == 404) {
      // Handle 404 error here
      print('Error 404: Resource not found');
      print(json.encode(response.data)); // You can print or handle the response data
    } else {
      print(response.statusMessage);
    }
  } catch (e) {
    print('Error: $e');
  }
}

//!forgotPassword
Future<EmailVerificationModel?> forgotPasswordEmailvarification({required EmailModel? email}) async {
    try {
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  var data = email?.toJson();
  var dio = Dio();
  var response = await dio.request(
    '${Urls.baseUrl}/password-reset/',
    options: Options(
      method: 'POST',
      headers: headers,
    ),
    data: data,
  );

  if (response.statusCode == 200) {
    return EmailVerificationModel.fromJson(response.data);
  } else {
  }
} catch (e) {
  print("Error: $e");
}
  }

  //!resetpassw verify Otp
  Future<EmailVerificationModel?> emailOtpVerification({required OtpVerificationModel otpModel}) async {
    try {
var data = FormData.fromMap(otpModel.toMap());

var dio = Dio();
var response = await dio.request(
  '${Urls.baseUrl}/otp-verification/',
  options: Options(
    method: 'POST',
  ),
  data: data,
);

if (response.statusCode == 200) {
  return EmailVerificationModel.fromJson(response.data);
  
}
else {
  print(response.statusMessage);
}
} catch (e) {
  print("Error: $e");
}
  }

  //!resetPassword
   Future<EmailVerificationModel?> resetPassword({required ResetPasswordModel resetPasswordModel}) async {
    try {
 var data = FormData.fromMap(resetPasswordModel.toMap());
 var dio = Dio();
var response = await dio.request(
  '${Urls.baseUrl}/change-password/',
  options: Options(
    method: 'POST',
  ),
  data: data,
);

if (response.statusCode == 200) {
  return EmailVerificationModel.fromJson(response.data);
  
}
else {
  print(response.statusMessage);
}
} catch (e) {
  print("Error: $e");
}
  }


}