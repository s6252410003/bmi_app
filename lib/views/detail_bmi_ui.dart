import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailBmiUI extends StatefulWidget {
  double? bmi;

  DetailBmiUI({super.key,required this.bmi});

  @override
  State<DetailBmiUI> createState() => _DetailBmiUIState();
}

class _DetailBmiUIState extends State<DetailBmiUI> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        //backgroundColor: Color(0xFF00FF00),
        title: Text(
          'BMI APP (ผล)',
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.12,
            ),
            Image.network(
              'https://www.cdc.gov/healthyweight/images/assessing/bmi-adult-fb-600x315.jpg',
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.12,
            ),
            Text(
              'ค่า BMI ของคุณ คือ',
              style: GoogleFonts.kanit(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            Text(
              widget.bmi!.toStringAsFixed(2),
              style: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.width * 0.2,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
