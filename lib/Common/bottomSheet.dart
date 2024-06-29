import 'package:email_validator/email_validator.dart';
import 'package:fashion_app/Common/alerts.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Features/Authentication/Model/login_model.dart';
import 'package:fashion_app/Features/Authentication/View/register_screen.dart';
import 'package:fashion_app/Features/Authentication/ViewModel/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotLoginPopup extends StatefulWidget {
  @override
  _NotLoginPopupState createState() => _NotLoginPopupState();
}

class _NotLoginPopupState extends State<NotLoginPopup> {
  bool showText = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text("No Login Detected", style: getFonts(15, Colors.black,)),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close, color: Colors.red,),
          ),
        ],
      ),
      content: Text("Please Continue To Login", style: getFonts(12, Colors.black,)),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customLogoutBtn("Ok", () {
              Navigator.pop(context);
              showBottomSheet(context);
            }),
            SizedBox(width: 12,),
            customLogoutBtn("Cancel", () {
              Navigator.pop(context);
            }),
          ],
        ),
      ],
    );
  }

  showBottomSheet(BuildContext context,) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final loginViewmodel = Provider.of<AuthViewModel>(context,listen: false);
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom:10 ),
                  child: Column(
                    children: <Widget>[
                      Text("Sign In To Continue",style: getFonts(15, Colors.black),),
                      SizedBox(height: 12,),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!EmailValidator.validate(value)) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Enter registered email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        controller: passwordController,
                        obscureText: !showText,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          } else {
                            if (value.length < 6) {
                              return "Password must be at least 6 characters long";
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
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 12,),
                      SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width *.8 ,
                        child: customLogoutBtn("Sign In", () { 
                          loginViewmodel.homeLogin(loginModel: LoginModel(email: emailController.text, password: passwordController.text), context: context);
                        }),
                      ),
                      SizedBox(height: 12,),
                       Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Dont have An Account?",style: getFonts(12, Colors.black),),SizedBox(width: 4,),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                        },
                        child: Text("Sign UP",style:styledFont(12, Colors.red,TextDecoration.none) ,))
                    ],),
                      
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

notLoginPopUp(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return NotLoginPopup();
    },
  );
}
