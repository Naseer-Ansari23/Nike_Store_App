import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../SignUp/SignIn.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({Key? key}) : super(key: key);

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {

  String des= 'Flutter Software Engineer and Google Developer Expert for Flutter & Dart with years of '
              'Experience as a consultant for multiple companies in England  USA and Asia. ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(children: [
          Stack(children: [
            Container(
              height: 235,
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset('assets/images/back.jpg',fit: BoxFit.cover,),
                ),
              ],)
            ),
            Positioned(
              top: 130,
              left: 135,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                child: ClipOval(
                  child: Image.asset('assets/images/pro1.jpg',fit: BoxFit.cover,
                  width: 100,
                  height: 100,)
                ),
              )
            )
          ],),
          SizedBox(height: 5,),
          Text('Naseer Ahmad',style: GoogleFonts.lora(fontSize: 22,fontWeight: FontWeight.bold),),
          SizedBox(height: 3,),
          Text('Flutter Software Engineer',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/instagram.png'),
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/google.png'),
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/apple.png'),
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/git.png'),
            ),
          ],),
          SizedBox(height: 25,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            width: double.infinity,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text('About',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              SizedBox(height: 10,),
              Text(des,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
            ],),
          ),

          SizedBox(height: 20,),
          ElevatedButton(
            child: Text('Content Us',style: GoogleFonts.lora(fontSize: 18,fontWeight: FontWeight.w600),),
            style: ElevatedButton.styleFrom(minimumSize: Size(200, 40),primary: HexColor('#4C1E53'),
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
            onPressed: (){},
          ),

          SizedBox(height: 10,),

          ElevatedButton(
            child: Text('Log Out',style: GoogleFonts.lora(fontSize: 18,fontWeight: FontWeight.w600),),
            style: ElevatedButton.styleFrom(minimumSize: Size(200, 40),primary: HexColor('#7C9969'),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            onPressed: (){
              Get.defaultDialog(
                title: 'Warning',
                  titlePadding: EdgeInsets.symmetric(vertical: 12),
                middleText: 'Are you sure you want to Exit?',
                actions: [
                  ElevatedButton(
                    child: Text('Yes',style: GoogleFonts.lora(fontSize: 16,fontWeight: FontWeight.w600),),
                    style: ElevatedButton.styleFrom(minimumSize: Size(100, 40),primary: HexColor('#7C9969'),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    onPressed: (){
                      FirebaseAuth myAuth=FirebaseAuth.instance;
                      myAuth.signOut();
                      Get.to(()=> SignIn_Page());
                    },
                  ),
                  ElevatedButton(
                    child: Text('No',style: GoogleFonts.lora(fontSize: 16,fontWeight: FontWeight.w600),),
                    style: ElevatedButton.styleFrom(minimumSize: Size(100, 40),primary: HexColor('#7C9969'),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    onPressed: (){
                      Get.back();
                    },
                  )
                ]
              );

            },
          ),

        ],),
      )
    );
  }
}
