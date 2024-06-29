import 'package:animate_do/animate_do.dart';
import 'package:fashion_app/BottomBar/bottom_nav_bar.dart';
import 'package:fashion_app/Common/app_string.dart';
import 'package:fashion_app/Common/custom_button.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Authentication/View/sign.dart';
import 'package:fashion_app/extention/path_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:no_internet_check/internet_connectivity/initialize_internet_checker.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key, key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool tapped = false;
  @override
  void initState() {
    super.initState();
    InternetChecker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FadeInDown(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('onboarding.png'.imagePath), // Replace 'background_image.jpg' with your image asset path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.width *1.1,),
                FadeInUp(
                  delay: Duration(milliseconds: 1000),
                  child: ClipPath(
                    clipper: OvalTopBorderClipper(),
                    child: Container(
                      height: MediaQuery.of(context).size.width *1.08,
                      color: Colors.white70,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('The',style: getFonts(19, Colors.black),),
                            SizedBox(width: 5,),
                            Text('Fashion App',style: getFonts(19, Kcolors.btnColor),),SizedBox(width: 5,),
                            Text('That',style: getFonts(19, Colors.black),),
                          ],
                        ),
                        Text('Makes You Look Your Best',style: onboardingText(19, Colors.black),),
                        SizedBox(height: 12,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: SizedBox(
                            child: Text(AppStrings.content,style: normalFonts(12,Colors.black))),
                        ),
                                      
                        SizedBox(height: 16,),
                        Padding(padding: EdgeInsets.only(left: 20,right: 20),
                          child:customButton("Let's Get Started", () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
                          }, context) ,),
                        SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Already have An Account ?",style: styledFont(12, Colors.black,null),),SizedBox(width: 5,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
                              },
                              child: Text("Sign In",style: styledFont(12, Kcolors.btnColor,TextDecoration.underline),)),SizedBox(width: 5,),
                          ],
                        )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
