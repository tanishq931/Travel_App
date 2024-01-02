import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle Style1({
  Color color=Colors.black,
  double size=20,
  bool bold=false
}){
  return GoogleFonts.poppins(
    textStyle: TextStyle(
          fontSize: size,
          fontWeight: bold?FontWeight.bold:FontWeight.normal,
          color: color
      )
  );
}

TextStyle title({
  Color color=Colors.black,
  double size=20,
  bool bold=false
}){
  return TextStyle(
    color: color,
    fontSize: size,
    fontFamily: 'Royal',
    fontWeight: bold?FontWeight.bold:FontWeight.normal
  );

}
