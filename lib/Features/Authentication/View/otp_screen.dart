import 'dart:async';

import 'package:fashion_app/Common/alerts.dart';
import 'package:fashion_app/Common/custom_app_bar.dart';
import 'package:fashion_app/Common/custom_button.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Authentication/Model/otp_verification_model.dart';
import 'package:fashion_app/Features/Authentication/ViewModel/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final bool fromSignIn;
  final String email;
  const OtpScreen({super.key, required this.email, required this.fromSignIn});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isTouchable = false;
  int timerSeconds = 30;
  Timer? timer;
  final String otpverification = "Otp Verification";
  final String verify = "Verify";
  String enteredOtp = "";
  @override
  void initState() {
    super.initState();
    startTimer();
  } 
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        timerSeconds--;
        if (timerSeconds == 0) {
          isTouchable = true;
          t.cancel();
        }
      });
    });
  }
  void resetTimer() {
    setState(() {
      showFlushBar(context, "OTP Sent Success",Colors.green);
      isTouchable = false;
      timerSeconds = 30;
      startTimer();
    });
  }
  
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final otpViewModel = Provider.of<AuthViewModel>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarAuth(context,false,""),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(left: 12,right: 12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text(otpverification,style: getFonts(20, Colors.black,),textAlign: TextAlign.center,),
              SizedBox(height: 4,),
              Text("Otp was Sent to ${widget.email}",style: getFonts(14, Colors.grey.shade500,),textAlign: TextAlign.center,),
              SizedBox(height: 16,),
              OTPTextField(
            length:widget.fromSignIn? 6 : 4,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 40,
            style: TextStyle(
              fontSize: 17
            ),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.box,
            onCompleted: (pin) {
              enteredOtp = pin;
            },
          ),
          SizedBox(height: 12,),
          Padding(padding: EdgeInsets.only(left: 12,right: 12),
          child: customButton(verify, () { 
            print(enteredOtp);
            if(enteredOtp.isNotEmpty){
             widget.fromSignIn ? 
            otpViewModel.otpverificationForgotPass(OtpVerificationModel(email: widget.email, otp: enteredOtp), context,widget.email):
            otpViewModel.otpRegister(OtpVerificationModel(email: widget.email, otp: enteredOtp), context);
            }
          }, context),
          ),
          SizedBox(height: 12,),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
                  onTap: isTouchable ? () => resetTimer() : null,
                  child: Row(
                    children: [
            Text(
              'Resend OTP ',
              style: getFonts(15, isTouchable? Kcolors.btnColor : Colors.grey)
            ),
            Text(timerSeconds != 0 ?"in ${timerSeconds}" : "",style: getFonts(12, Colors.green),)
                    ],
                  ),
                ),
          )
            ],
          ),
        ),
        ),
      ),
    );
  }
   @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}