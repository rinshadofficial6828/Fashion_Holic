import 'package:fashion_app/Common/font.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 2,
            child: Icon(Icons.arrow_back,)),
        title: Text("Profile",style: getFonts(16, Colors.black),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.black12,
                maxRadius: 70,
                child: Icon(Icons.person,
                  size: 70,
                color: Colors.grey,)),
              Positioned(
                bottom: 10,
                right: 10,
                child: InkWell(
                  onTap: (){},
                    child: FaIcon(FontAwesomeIcons.solidPenToSquare)),)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
