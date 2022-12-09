import 'package:bmi_app/views/home_bmi_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeBmiUI(), 
      theme: ThemeData(
        //fontFamily: ?????,
      ),
    ),
  );
}