import 'package:email_validator/email_validator.dart';
import 'package:fashion_app/Common/app_string.dart';
import 'package:fashion_app/Common/custom_app_bar.dart';
import 'package:fashion_app/Common/custom_button.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/text_field_decoration.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Authentication/Model/otp_verification_email.dart';
import 'package:fashion_app/Features/Authentication/ViewModel/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailVerificationScreen extends StatefulWidget {

  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final String resetPass = "Reset Password";
  final String emailRegestered = "Enter registerd email";
  final String verify = "Verify";
  TextEditingController emailController = TextEditingController();
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailViewModel = Provider.of<AuthViewModel>(context,listen: true);
    return Scaffold(
      backgroundColor: Kcolors.bgColor,
      appBar: customAppBarAuth(context,false,""),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.only(left: 16,right: 16),
          child: Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(height: 50,),
              Center(
                child: Text(resetPass,style: getFonts(16, Colors.black),
                ),
              ),
              SizedBox(height: 12,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      AppStrings.emailVerify,style: getFonts(12, Colors.black38),textAlign:TextAlign.center,)),
                ],
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: emailController,
                validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Invalid email format';
                        }
                        return null; // Return null if the input is valid
                      },
                decoration: textFormDecoration(Icon(Icons.email),emailRegestered ),
              ),
              SizedBox(height: 16,),
              Padding(padding: EdgeInsets.only(left: 12,right: 12),
              child: customButton(verify, () { 
              if(_formKey.currentState!.validate()){
            
                emailViewModel.emailVericationResetpass(EmailModel(email: emailController.text), context, emailController.text);
                
              }
              }, context),)
            ],),
          ),
        ),
      ),
    );
  }
}