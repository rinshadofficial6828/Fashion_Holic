
import 'package:email_validator/email_validator.dart';
import 'package:fashion_app/Common/app_string.dart';
import 'package:fashion_app/Common/custom_app_bar.dart';
import 'package:fashion_app/Common/custom_button.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/text_field_decoration.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Authentication/Model/register_model.dart';
import 'package:fashion_app/Features/Authentication/View/sign.dart';
import 'package:fashion_app/Features/Authentication/ViewModel/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final String name = "Name";
  final String email = "Email";
  final String phone = "Phone";
  final String password = "Password";
  final String password1 = "Confirm Password";
  final String required = "This Field is Required";
  final String reEnterPass = "Re-Enter Password";
  final String signUP = "Sign Up";
  final String alreadyHaveAccount = "Already have Accound?";
  final String signIn = "Sign In";
  final String createAccount = "Create An Account";
  final String fillInformation = "Fill Your information";
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool showtext = true;
  bool showtext1 = true;
  @override
  Widget build(BuildContext context) {
    final registerViewmodel = Provider.of<AuthViewModel>(context,listen: true);
    return Scaffold(
      appBar: customAppBarAuth(context,false,""),
      backgroundColor: Kcolors.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        createAccount,
                        style: getFonts(20, Colors.black),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(fillInformation)
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Text(
                  name,
                  style: getFonts(12, Colors.black),
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: textFormDecoration(Icon(Icons.person), "Name"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return required;
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  email,
                  style: getFonts(12, Colors.black),
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller:registerViewmodel.registerEmailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Invalid email format';
                      }
                      return null; // Return null if the input is valid
                    },
                    decoration: textFormDecoration(Icon(Icons.email), email)),
                    SizedBox(height: 12,),
                    Text(
                  phone,
                  style: getFonts(12, Colors.black),
                ),
                SizedBox(
                  height: 6,
                ),
                    TextFormField(
                  controller:phoneNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This Field is Required';
                      } else  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Invalid phone number';
    }
                      return null; // Return null if the input is valid
                    },
                    decoration: textFormDecoration(Icon(Icons.phone), phone)),
                SizedBox(
                  height: 12,
                ),
                Text(
                  password,
                  style: getFonts(12, Colors.black),
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: showtext,
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
                            showtext = !showtext;
                          });
                        },
                        child: showtext
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      hintText: password,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  password1,
                  style: getFonts(12, Colors.black),
                ),
                SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return AppStrings.passwordConfirm;
                    }
                  },
                  obscureText: showtext1,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showtext1 = !showtext1;
                          });
                        },
                        child: showtext1
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      hintText: "Re-enter Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: customButton(signUP, () {
                      if (_formKey.currentState!.validate()) {
                        registerViewmodel.registerUser(
                          registerModel: 
                          RegisterModel(name: nameController.text,
                           email: registerViewmodel.registerEmailController.text,
                            password: passwordController.text,
                             password2: confirmPasswordController.text,
                              mobile:phoneNumberController.text ), context: context);
                      }
                    }, context)),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(alreadyHaveAccount,style: getFonts(12, Colors.black),),SizedBox(width: 4,),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                             builder: (context) => SignInScreen()), (Route route) => false);
                        },
                        child: Text(signIn,style:styledFont(12, Colors.red,TextDecoration.none) ,))
                    ],),
                    SizedBox(height: 12,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

