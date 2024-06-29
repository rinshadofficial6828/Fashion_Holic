import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:flutter/material.dart';

customButton (String text, VoidCallback onTap,BuildContext context){
  return InkWell(
                    onTap: onTap,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Kcolors.btnColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          text,
                          style: getFonts(16, Kcolors.bgColor),
                        ),
                      )),
                    ),
                  );
}

addToCartButton (String text, VoidCallback onTap,BuildContext context){
  return InkWell(
                    onTap: onTap,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Kcolors.btnColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_bag,color: Colors.white,),
                            SizedBox(width: 4,),
                            Text(
                              text,
                              style: getFonts(14, Kcolors.bgColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
}

customButtonNew (String text, VoidCallback onTap,BuildContext context, double fontSizes){
  return InkWell(
                    onTap: onTap,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Kcolors.btnColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          text,
                          style: getFonts(fontSizes, Kcolors.bgColor),
                        ),
                      ),
                    ),
                  );
}