import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nike_app/TabPages/Collections.dart';
import 'package:nike_app/TabPages/Kids.dart';
import 'package:nike_app/TabPages/Popular.dart';
import 'package:nike_app/TabPages/Women.dart';

import '../TabPages/Mens.dart';

class Shopping_Page extends StatefulWidget {
  const Shopping_Page({Key? key}) : super(key: key);

  @override
  State<Shopping_Page> createState() => _Shopping_PageState();
}

class _Shopping_PageState extends State<Shopping_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: Container(
            child: Column(children: <Widget>[
              Container(
                width: double.infinity,
                height: 180,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color:HexColor('#045256'),borderRadius: BorderRadius.circular(15)),
                child: ReuseAbleRow(),
              ),

              // Tab barView
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                  indicator: BoxDecoration(color: HexColor('#045256') ,borderRadius: BorderRadius.circular(50)),
                  tabs: [
                    Text('Popular'),
                    Text('Men'),
                    Text('Women'),
                    Text('Kids'),
                    Text('Collections'),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              // Tab barView to show our Lists of data
              Expanded(
                child: TabBarView(children: [
                  Popular_Page(),
                  MensShoes_Page(),
                  WomenShoes_Page(),
                  KidsShoes_Page(),
                  Collections_Page(),
                ],),
              ),

            ],),
          ),
        ),
      ),
    );
  }
}

// Top Card Designing
class ReuseAbleRow extends StatelessWidget {
  const ReuseAbleRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            SizedBox(height: 15,),
            Text('New Release',style: TextStyle(color: Colors.white),),
            SizedBox(height: 15,),
            Text('Nike Air',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
            Text('Max plus',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
            SizedBox(height: 20,),
            Container(
              width: 90,
              height: 30,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
              child: Center(child: Text('Shop Now',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),)),
            ),
          ],),
        ),
        SizedBox(
          height: 240,
          width: 214,
          child: Image.asset('assets/images/info3.png',fit: BoxFit.cover,alignment: Alignment.bottomLeft,),
        ),
      ],),
    );
  }
}