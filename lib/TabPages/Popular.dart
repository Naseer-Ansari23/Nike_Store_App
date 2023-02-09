import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Pages/Detail_Page.dart';

class Popular_Page extends StatefulWidget {
  const Popular_Page({Key? key}) : super(key: key);

  @override
  State<Popular_Page> createState() => _Popular_PageState();
}

class _Popular_PageState extends State<Popular_Page> {

  CollectionReference reference= FirebaseFirestore.instance.collection('popular');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: StreamBuilder(
            stream: reference.snapshots(),
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasData){

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    DocumentSnapshot documentSnapshot= snapshot.data!.docs[index];
                    return CardItemWidget(
                      image: documentSnapshot['image'].toString(),
                      name: documentSnapshot['name'].toString(),
                      category: documentSnapshot['category'].toString(),
                      price: documentSnapshot['price'].toString(),
                    );
                  },
                );

              }
              else{
                return Center(child: CircularProgressIndicator());
              }

            },
          ),
        ),
      ),
    );
  }
}


class CardItemWidget extends StatelessWidget {
  String image,name,category,price;
  CardItemWidget({Key? key,required this.image,required this.name,required this.category,required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 8),
      child: Card(
        color: HexColor('#98BFAA'),
        elevation: 12,
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: 250,
          child: Column(children: [
            SizedBox(
              width: 240,
              height: 170,
              child: Image.network(image,fit: BoxFit.fitWidth,),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
                Icon(Icons.favorite,color: Colors.red,)
              ],),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text(category,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              ],),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(children: [
                Icon(Icons.star,color: Colors.yellowAccent,size: 20,),
                Icon(Icons.star,color: Colors.yellowAccent,size: 20,),
                Icon(Icons.star,color: Colors.yellowAccent,size: 20,),
                Icon(Icons.star,color: Colors.yellowAccent,size: 20,),
                Icon(Icons.star_half,color: Colors.yellowAccent,size: 20,),
              ],),
            ),
            SizedBox(height: 14,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,children: [
                Text('\$${price}',style: GoogleFonts.lora(fontSize: 18,fontWeight: FontWeight.bold)),
                GestureDetector(
                  child: Container(
                    width: 50,
                    height: 90,
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),)),
                    child: Column(children: [
                      SizedBox(height: 10,),
                        Icon(Icons.add_circle_outlined,color: Colors.white,size:45,),
                      ],
                    ),
                  ),
                  onTap: (){
                    Get.to(()=> Detail_Page(image: image, name: name, category: category, price: price,));
                  },
                )
              ],),
            ),
          ],),
        ),
      ),
    );
  }
}

