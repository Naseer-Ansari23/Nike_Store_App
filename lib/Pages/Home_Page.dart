import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nike_app/BottomPages/profile.dart';
import 'package:nike_app/Pages/Ordering.dart';

import '../BottomPages/ShopingPage.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  var pageIndex=2;
  static List<Widget> _widgetOptions= <Widget>[
    Center(child: Text('Options 1')),
    Center(child: Text('Options 2')),
    Shopping_Page(),
    Ordering_page(),
    Profile_Page(),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            child: Column(children: [

              // the Page widget options
              Expanded(child: _widgetOptions.elementAt(pageIndex)),
              
            ],),
          ),

          // Bottom Navigation bar
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: HexColor('#045256'),
            buttonBackgroundColor: HexColor('#045256') ,
            index: pageIndex,
            items: [
              Icon(Icons.home,color: Colors.white,),
              Icon(Icons.search,color: Colors.white,),
              Icon(Icons.shopping_bag_outlined,color: Colors.white,),
              Icon(Icons.add_shopping_cart,color: Colors.white,),
              Icon(Icons.person,color: Colors.white,),
            ],
            onTap: (index){
              setState(() {
                pageIndex=index;
              });
            },
          ),

          // Bottom Navigation End

        ),
      ),
    );
  }
}


