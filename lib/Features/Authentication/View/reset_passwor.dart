import 'package:fashion_app/Common/app_string.dart';
import 'package:fashion_app/Common/custom_app_bar.dart';
import 'package:fashion_app/Common/custom_button.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Authentication/Model/reset_password_model.dart';
import 'package:fashion_app/Features/Authentication/ViewModel/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPassScreen extends StatefulWidget {
   final String email;
  const ResetPassScreen({super.key, required this.email,});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
 TextEditingController passwordController = TextEditingController();
 TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showText = true;
  bool showText1 = true;
  final String required = "This Field is Required";
  @override
  Widget build(BuildContext context) {
    final resetpasswordViewModel = Provider.of<AuthViewModel>(context,listen: false);
    return Scaffold(
      backgroundColor: Kcolors.bgColor,
      appBar: customAppBarAuth(context,false,""),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.only(left: 20,right: 20),
          child: Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(height: 50,),
              Center(
                child: Text("Reset Password",style: getFonts(20, Colors.black),
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
                      "Put New Password",style: getFonts(12, Colors.black38),textAlign:TextAlign.center,)),
                      SizedBox(height: 20,),
                       TextFormField(
                  controller: passwordController,
                  obscureText: showText,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return required;
                    } else {
                      if (value.length < 6) {
                        return AppStrings.password;
                      } else {
                        return null;
                      }
                    }
                  },
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showText = !showText;
                          });
                        },
                        child: showText
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      hintText: "New Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(height: 12,),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: showText1,
                  validator: (value) {
                    if(passwordController.text != confirmPasswordController.text){
                      return "Password Must be same";
                    }
                    if (value!.isEmpty) {
                      return required;
                    } else {
                      if (value.length < 6) {
                        return AppStrings.password;
                      } else {
                        return null;
                      }
                    }
                  },
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showText1 = !showText1;
                          });
                        },
                        child: showText
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      hintText: "New Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                ],
              ),
              SizedBox(height: 20,),
              
              SizedBox(height: 16,),
              customButton("Verify", () {
                print(widget.email);
              if(_formKey.currentState!.validate()){
                resetpasswordViewModel.passwordReset(ResetPasswordModel(email: widget.email, newPassword: passwordController.text, confirmPassword: confirmPasswordController.text), context);
              }
              }, context)
            ],),
          ),
        ),
      ),
    );
  }
}