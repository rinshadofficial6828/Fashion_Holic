import 'package:fashion_app/Common/alerts.dart';
import 'package:fashion_app/Common/bottomSheet.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Cart/View/cart.dart';
import 'package:fashion_app/Features/Profile/View/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String userName = 'Username';

  List<String> head = [
    'My Order',
    'Whishlist',
    'Cart',
    'Edit Profile',
    'Chat with us',
    'Privacy Policy',
    'Log Out'
  ];

  String?token;
  int?id;

  Future<void>checkLogin () async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');
  id = prefs.getInt('userId');
  if(token == null && id == null){
    notLoginPopUp(context);
  }
  }

  List<Icon> symbol = [
    Icon(
      Icons.shopping_bag_outlined,
      color: Colors.white,
    ),
    Icon(
      Icons.favorite_border,
      color: Colors.white,
    ),
     Icon(
      Icons.shopping_cart,
      color: Colors.white,
    ),
    Icon(
      Icons.person_2_outlined,
      color: Colors.white,
    ),
    Icon(
      Icons.chat_bubble_outline,
      color: Colors.white,
    ),
    Icon(
      Icons.privacy_tip_outlined,
      color: Colors.white,
    ),
    Icon(
      Icons.logout,
      color: Colors.white,
    ),
  ];
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 2),
            child: Center(
              child: CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  )),
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(
              userName,
              style: normalUse(20, Colors.black),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                      spreadRadius: -20,
                      offset: Offset(-1, -15))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 30,
                  top: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if(token !=null && id !=null){
                              switch (index) {
                                case 6:
                                  showAlertPopUp(context);
                                  break;
                                  case 2:
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
                                  case 3:
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileEdit()));
                                default:
                                  break;
                              }
                              }else{
                                checkLogin();
                              }
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  maxRadius: 17,
                                  backgroundColor: Kcolors.btnColor,
                                  child: symbol[index],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Text(head[index],
                                      style: headUse(16, Colors.black)),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Divider(
                              color: Colors.brown,
                              thickness: 0,
                            ),
                          );
                        },
                        itemCount: head.length)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          )
        ]),
      ),
    );
  }
}
