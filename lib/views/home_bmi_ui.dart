import 'package:bmi_app/views/detail_bmi_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBmiUI extends StatefulWidget {
  const HomeBmiUI({super.key});

  @override
  State<HomeBmiUI> createState() => _HomeBmiUIState();
}

class _HomeBmiUIState extends State<HomeBmiUI> {
  TextEditingController weightCtrl = TextEditingController(text: '');
  TextEditingController heightCtrl = TextEditingController(text: '');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        //backgroundColor: Color(0xFF00FF00),
        title: Text(
          'BMI APP',
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Image.asset(
                'assets/images/bmi.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Text(
                'ป้อนน้ำหนัก (กิโลกรัม)',
                style: GoogleFonts.kanit(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TextField(
                  controller: weightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Text(
                'ป้อนส่วนสูง (เมตร)',
                style: GoogleFonts.kanit(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TextField(
                  controller: heightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              ElevatedButton(
                onPressed: () {
                  //กดปุ่มคำนวณจะตรวจสอบว่าป้อนน้ำหนักส่้วนสูงหรือยัง ถ้ายังแสดง alert เตือน
                  if(weightCtrl.text.length == 0){
                    //แสดง Alert
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'คำเตือน',
                          ),
                          content: Text(
                            'ป้อนน้ำหนักด้วย',
                            style: GoogleFonts.kanit(),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text(
                                'ตกลง',
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }else if(heightCtrl.text.length == 0){
                    //แสดง Alert
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'คำเตือน',
                          ),
                          content: Text(
                            'ป้อนส่วนสูงด้วย',
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text(
                                'ตกลง',
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }else{
                    //คำนวณ
                    double w = double.parse(weightCtrl.text);
                    double h = double.parse(heightCtrl.text);
                    double bmi = w / (h * h);
                    //ส่งไปแสดงผลที่หน้า DetailBmiUI
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailBmiUI(bmi: bmi,),
                      ),
                    );
                  }
                },
                child: Text(
                  'คำนวณ BMI',
                  style: GoogleFonts.kanit(),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.width * 0.13,
                  ),
                  backgroundColor: Colors.green,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              ElevatedButton(
                onPressed: () {
                  weightCtrl.text = '';
                  heightCtrl.text = '';
                },
                child: Text(
                  'ยกเลิก',
                  style: GoogleFonts.kanit(),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.width * 0.13,
                  ),
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
