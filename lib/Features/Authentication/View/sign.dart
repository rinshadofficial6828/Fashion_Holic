import 'package:email_validator/email_validator.dart';
import 'package:fashion_app/Common/app_string.dart';
import 'package:fashion_app/Common/custom_button.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/text_field_decoration.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Authentication/Model/login_model.dart';
import 'package:fashion_app/Features/Authentication/View/email_verify.dart';
import 'package:fashion_app/Features/Authentication/View/register_screen.dart';
import 'package:fashion_app/Features/Authentication/ViewModel/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String email = "Email";
  final String password = "Password";
  final String required = "This Field is Required";
  bool showText = true;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    final signInViewModel = Provider.of<AuthViewModel>(context,listen: false);
  }
  @override

  Widget build(BuildContext context) {
    final signInViewModel = Provider.of<AuthViewModel>(context,listen: true);
    return Scaffold(
      body:
       SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height: 100,),
              // signInViewModel.isloading ? loadingPopUp(context, spinKits()) : SizedBox.shrink(),
              Center(child: Text("Sign In",style: getFonts(20, Colors.black),)),
              SizedBox(height: 12,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text("Please Sign In With your Account",style: getFonts(14, Colors.grey),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 20,),
              Text(
                  "Email",
                  style: getFonts(12, Colors.black),),
                  SizedBox(height: 6,),
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
                  decoration: textFormDecoration(Icon(Icons.email), "Enter registerd email"),
                ),
                SizedBox(height: 12,),
                Text(
                  "Password",
                  style: getFonts(12, Colors.black,),),
                  SizedBox(height: 6,),
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailVerificationScreen()));
                      },
                      child: Text("Forgot Password?",style: styledFont(12, Colors.black, TextDecoration.underline),textAlign: TextAlign.end,))),
                  SizedBox(height: 12,),
                  customButton("SignIn", () { 
              if (_formKey.currentState!.validate()) {
                signInViewModel.loginUser(
                  loginModel: LoginModel(email: emailController.text, password: passwordController.text),
                  context: context,
                );
                FocusScope.of(context).unfocus();
              }
            }, context),
            SizedBox(height: 16,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Don't Have An Account",style: styledFont(12, Colors.black,null),),
              SizedBox(width: 4,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                },
                child: Text("Sign Up",style: styledFont(12, Kcolors.btnColor,null),))
            ],)
              
            ],),
          ),
        ),
      )
    );
  }
}
