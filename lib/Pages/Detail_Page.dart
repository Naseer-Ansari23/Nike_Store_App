
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ndialog/ndialog.dart';

class Detail_Page extends StatelessWidget {

  String image; var name,price,category;
  Detail_Page({Key? key,required this.price,required this.category,required this.image,required this.name}) : super(key: key);

  final ProgressDialog progressDialog= ProgressDialog(Get.context!, title: Text('Ordering ?'), message: Text('wait your order in process?'));

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            child: Column(children: [
              TopContainerDesign(),
              SecondContainer(),
            ],),
          ),
        ),
      ),
    );
  }


  // Detail Page Design Functions start

  Widget TopContainerDesign(){
    return Container(
      height: 350,
      decoration: BoxDecoration(color: HexColor('#98BFAA'),borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20),)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            GestureDetector(
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
                child: Center(child: Icon(Icons.arrow_back),),
              ),
              onTap: (){
                Get.back();
              },
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
              child: Center(child: Icon(Icons.shopping_bag_outlined),),
            ),
          ],),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
           Text(name.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
           Text(category,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
          ],),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('price \$${price}',style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold)),
              SizedBox(
                width: 250,
                height: 210,
                child: Image.network(image,fit: BoxFit.fitWidth,alignment: Alignment.bottomLeft,),
              ),
            ],
          ),
        )
        
      ],),
    );

  }  // Detail Page Design Functions End


  // Second Container Design Functions start

  Widget SecondContainer(){

    final DatabaseReference reference= FirebaseDatabase.instance.ref('UserOrder');

    String desc=' Nike shoes provide excellent support – Nike shoes comes with a'
        ' herringbone pattern and a solid rubber, which adds to the comfort and support of users.'
    ;

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
          SizedBox(height: 15,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Text('Descriptions',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              Row(children: [
                Icon(Icons.star,color: Colors.amber,),
                Icon(Icons.star,color: Colors.amber,),
                Icon(Icons.star,color: Colors.amber,),
                Icon(Icons.star,color: Colors.amber,),
                Icon(Icons.star,color: Colors.amber,),
              ],)
            ],),
          SizedBox(height: 10,),
          Text(desc, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),

          SizedBox(height: 15,),
          Text('Select Color', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          SizedBox(height: 8,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(color: Colors.lightGreen,shape: BoxShape.circle),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(color: Colors.purpleAccent,shape: BoxShape.circle),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(color: Colors.indigo,shape: BoxShape.circle),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(color: Colors.black,shape: BoxShape.circle),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(color: Colors.purple,shape: BoxShape.circle),
            ),
          ],),

          SizedBox(height: 20,),
          Text('Select Size', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: HexColor('#9AB8BA'),borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('5', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: HexColor('#9AB8BA'),borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('5.5', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: HexColor('#9AB8BA'),borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('6', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: HexColor('#9AB8BA'),borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('6.5', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: HexColor('#9AB8BA'),borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('7', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: HexColor('#9AB8BA'),borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('7.5', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
            ),
            
          ],),

          SizedBox(height: 55),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: Colors.black,shape: BoxShape.circle),
              child: Icon(Icons.favorite_border,color: Colors.white,),
            ),

            ElevatedButton.icon(
              icon: Icon(Icons.add_shopping_cart_outlined),
              label: Text('Add to Cart',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
              style: ElevatedButton.styleFrom(minimumSize: Size(230, 46),primary: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              onPressed: (){

                try{
                  String id= DateTime.now().millisecondsSinceEpoch.toString();
                  reference.child(id).set({
                    'id': id,
                    'name': name,
                    'category': category,
                    'imageUrl': image,
                    'price': price,
                  });
                }
                catch(e){
                  progressDialog.dismiss();
                  print(e.toString());
                }
                Fluttertoast.showToast(msg: 'Order Successful');
                Get.snackbar(
                  'Dear Customer',
                  'Thanks for visiting our shop ? \n your order successfully Done',
                  icon: Icon(Icons.person),
                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                  backgroundColor: HexColor('#FFDFBB'),
                );

              },
            ),

          ],)

        ],),
      ),
    );
  }// Second Container Design Functions End


}  //  Main Class End Point



