import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nike_app/Pages/Home_Page.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,colors: [HexColor('#60D3AA'),HexColor('#399564')])),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                SizedBox(height: 0,),
                Stack(children: [
                  Container(
                    width: double.infinity,
                    height: 570,
                    decoration: BoxDecoration(//color: Colors.greenAccent,
                        image: DecorationImage(alignment: Alignment.topRight,image: AssetImage('assets/images/star1.png'),fit: BoxFit.fitHeight)),
                  ),
                  Positioned(
                    child: SizedBox(
                      width: 140,
                      height: 200,
                      child: Image.asset('assets/images/logo.png',fit: BoxFit.cover,),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 130,
                    child: Text('Nike',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),),
                  )

                ],),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      Text('Start Your Journey', style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700),),
                      Text('With Nike',style:  TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700),),
                    ],),
                    GestureDetector(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
                        child: Icon(Icons.arrow_forward,color: Colors.white,size: 30,),
                      ),
                      onTap: (){
                        Get.to(()=> Home_Page());
                      },
                    )

                  ],),
                ),
              ],),
            ),
          ),
        ),
      ),
    );
  }
}
