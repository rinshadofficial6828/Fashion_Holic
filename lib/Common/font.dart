import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 TextStyle getFonts (double fontsize,Color color){
  return GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: fontsize ,color:color );
}
TextStyle styledFont (double fontsize,Color color, decoration){
  return GoogleFonts.robotoSlab(fontWeight: FontWeight.w600,fontSize: fontsize ,color:color,fontStyle: FontStyle.italic,decoration: decoration  );
}
TextStyle normalFonts (double fontsize,Color color,){
  return GoogleFonts.josefinSans(fontWeight: FontWeight.w600,fontSize: fontsize ,color:color,fontStyle: FontStyle.italic,);
}
TextStyle normalUse (double fontsize,Color color){
  return GoogleFonts.teko(fontWeight: FontWeight.w600,fontSize: fontsize ,color:color );
}
TextStyle headUse (double fontsize,Color color){
  return GoogleFonts.libreCaslonText(fontWeight: FontWeight.w600,fontSize: fontsize ,color:color );
}
TextStyle splashFont (double fontsize,Color color){
  return GoogleFonts.courgette(fontWeight: FontWeight.bold,fontSize: fontsize ,color:color );
}
TextStyle onboardingText (double fontsize,Color color){
  return GoogleFonts.ptSerif(fontWeight: FontWeight.bold,fontSize: fontsize ,color:color );
}