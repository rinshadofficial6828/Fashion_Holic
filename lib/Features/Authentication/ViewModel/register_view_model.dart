import 'package:fashion_app/BottomBar/bottom_nav_bar.dart';
import 'package:fashion_app/Common/alerts.dart';
import 'package:fashion_app/Features/Authentication/Model/login_model.dart';
import 'package:fashion_app/Features/Authentication/Model/otp_verification_email.dart';
import 'package:fashion_app/Features/Authentication/Model/otp_verification_model.dart';
import 'package:fashion_app/Features/Authentication/Model/register_model.dart';
import 'package:fashion_app/Features/Authentication/Model/reset_password_model.dart';
import 'package:fashion_app/Features/Authentication/Repository/auth_repo.dart';
import 'package:fashion_app/Features/Authentication/View/otp_screen.dart';
import 'package:fashion_app/Features/Authentication/View/reset_passwor.dart';
import 'package:fashion_app/Features/Authentication/View/sign.dart';
import 'package:fashion_app/Hive/shared_preference.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  AuthRepository authrepo = AuthRepository();
  bool isloading = false;
  //!login
  loginUser({required LoginModel? loginModel, required BuildContext context}) async {
    loadingPopUpLogin(context);
    await authrepo.login(loginModel: loginModel).then((value) {
      if (value?.status == true) {
        closeLoadingPopUp(context);
        isloading = false;
        storeToken(value?.token ?? "");
        print(value?.id ??0);
        storeUser(value?.id ?? 0);
        Navigator.pushReplacement(context ,MaterialPageRoute(builder: (context)=> MyHomePage()));
        showFlushBar(context, "Login Success", Colors.green);
        print(value?.message);
      } else {
        closeLoadingPopUp(context);
        showFlushBar(context, "User Not Found", Colors.red);
        print(value?.message);
      }
    });
    notifyListeners();
  }
  
  //!register
  TextEditingController registerEmailController = TextEditingController();

  registerUser({required RegisterModel registerModel,required BuildContext context}) async {
    loadingPopUpLogin(context);
    await authrepo.register(registerModel: registerModel).then((value) {
      if(value?.status == true){
        closeLoadingPopUp(context);
        Navigator.push(context,MaterialPageRoute(builder: (context)=>OtpScreen(email: registerEmailController.text, fromSignIn: false,)));
        showFlushBar(context, "Otp Sent Sucessfully", Colors.green);
      print("sucesss");
      }else{
      closeLoadingPopUp(context);
        print("print error");
        showFlushBar(context, value?.message ?? "email is alredy Exist", Colors.red);
      }
    });
  }

  //!otp registration 
  otpRegister(OtpVerificationModel otpVerificationModel,BuildContext context) async {
    loadingPopUpLogin(context);
    await authrepo.otpVerification(otpVerificationModel:otpVerificationModel ).then((value) => {
      if(value?.status == true){
        closeLoadingPopUp(context),
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInScreen()), (Route route)=>false),
        showFlushBar(context, "Registerd Success", Colors.green)
      }else{
        closeLoadingPopUp(context),
        print("error")
      }
    });
    notifyListeners();
  }

  //!forgot pass emailVerification 
  emailVericationResetpass(EmailModel? email,BuildContext context,String emailtext) async {
   loadingPopUpLogin(context);
    await authrepo.forgotPasswordEmailvarification(email:email).then((value) {
      if(value?.status == true){
        closeLoadingPopUp(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OtpScreen(email: emailtext, fromSignIn: true)));
      showFlushBar(context, "Otp Sent Sucessfully", Colors.green);
      }else{
        closeLoadingPopUp(context);
        showFlushBar(context, "Enter a registerd Email", Colors.red);
      }
    });
    notifyListeners();
  }
  
  //otp
  otpverificationForgotPass(OtpVerificationModel otpModel,BuildContext context,String email) async {
    loadingPopUpLogin(context);
    await authrepo.emailOtpVerification(otpModel:otpModel ).then((value){
      if(value?.status == true){
        closeLoadingPopUp(context);
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>ResetPassScreen(email:email ,)));
        showFlushBar(context, "Otp Sent Sucessfully", Colors.green);
      }else{
        closeLoadingPopUp(context);
       showFlushBar(context, "Something went wrong", Colors.red);
      }
    });
    notifyListeners();
  }
  //password reset
  passwordReset(ResetPasswordModel resetPasswordModel,BuildContext context)async{
    loadingPopUpLogin(context);
    await authrepo.resetPassword(resetPasswordModel: resetPasswordModel).then((value){
      if(value?.status != null){
        closeLoadingPopUp(context);
        Navigator.pop(context);
        showFlushBar(context, "Password changed Sucess", Colors.green);
      }else{
        closeLoadingPopUp(context);
        showFlushBar(context, "Unable to change Password", Colors.red);
      }
    });
    notifyListeners();
  }

  homeLogin({required LoginModel? loginModel, required BuildContext context}) async {
    loadingPopUpLogin(context);
    await authrepo.login(loginModel: loginModel).then((value) {
      if (value?.status == true) {
        closeLoadingPopUp(context);
        isloading = false;
        storeToken(value?.token ?? "");
        print(value?.id ??0);
        storeUser(value?.id ?? 0);
        Navigator.pop(context);
        showFlushBar(context, "Login Success", Colors.green);
        print(value?.message);
      } else {
        closeLoadingPopUp(context);
        showFlushBar(context, "User Not Found", Colors.red);
        print(value?.message);
      }
    });
    notifyListeners();
  }
}
