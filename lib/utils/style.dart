import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

double large = 22;
double medium = 18;
double regular = 16;
double small = 14;

double titleSize = 25;



final lgFontStyleBold = GoogleFonts.poppins(fontSize: large, color: primaryColor, fontWeight: FontWeight.w700);
final lgfontStyleMedium = GoogleFonts.poppins(fontSize: large, color: primaryColor, fontWeight: FontWeight.w500);
final lgfontStyleRegular = GoogleFonts.poppins(fontSize: large, color: primaryColor, fontWeight: FontWeight.w400);
final lgfontStyleLight = GoogleFonts.poppins(fontSize: large, color: primaryColor, fontWeight: FontWeight.w400);


final mdFontStyleBold = GoogleFonts.poppins(fontSize: medium, color: primaryColor, fontWeight: FontWeight.w700);
final mdfontStyleMedium = GoogleFonts.poppins(fontSize: medium, color: primaryColor, fontWeight: FontWeight.w500);
final mdfontStyleRegular = GoogleFonts.poppins(fontSize: medium, color: primaryColor, fontWeight: FontWeight.w300);
final mdfontStyleLight = GoogleFonts.poppins(fontSize: medium, color: primaryColor, fontWeight: FontWeight.w100);


final reFontStyleBold = GoogleFonts.poppins(fontSize: regular, color: primaryColor, fontWeight: FontWeight.w700);
final refontStyleMedium = GoogleFonts.poppins(fontSize: regular, color: primaryColor, fontWeight: FontWeight.w500);
final refontStyleRegular = GoogleFonts.poppins(fontSize: regular, color: primaryColor, fontWeight: FontWeight.w300);
final refontStyleLight = GoogleFonts.poppins(fontSize: regular, color: primaryColor, fontWeight: FontWeight.w100);


final smFontStyleBold = GoogleFonts.poppins(fontSize: small, color: primaryColor, fontWeight: FontWeight.w700);
final smfontStyleMedium = GoogleFonts.poppins(fontSize: small, color: primaryColor, fontWeight: FontWeight.w500);
final smfontStyleRegular = GoogleFonts.poppins(fontSize: small, color: primaryColor, fontWeight: FontWeight.w300);
final smfontStyleLight = GoogleFonts.poppins(fontSize: small, color: primaryColor, fontWeight: FontWeight.w100);


double fSize({fontSize,mediaQueryWidth}){
  //print(((small / 430) * mediaQueryWidth).ceil().toString());
  return double.parse(((fontSize / 430) * mediaQueryWidth).ceil().toString());
}