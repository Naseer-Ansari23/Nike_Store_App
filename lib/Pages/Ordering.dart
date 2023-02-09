import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Ordering_page extends StatefulWidget {
  const Ordering_page({Key? key}) : super(key: key);

  @override
  State<Ordering_page> createState() => _Ordering_pageState();
}

class _Ordering_pageState extends State<Ordering_page> {

  DatabaseReference ourReference= FirebaseDatabase.instance.ref('UserOrder');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: StreamBuilder(
            stream: ourReference.onValue,
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot){

              if(snapshot.hasData){

                Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
                List<dynamic> list=[];
                list=map.values.toList();

                return ListView.builder(
                  itemCount: snapshot.data!.snapshot.children.length ,
                  itemBuilder: (context,index){
                    return  Card(
                      margin: EdgeInsets.all(10),
                      elevation: 12,
                      color: HexColor('#98BFAA'),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Row(children: [
                            SizedBox(
                              width: 130,
                              height: 130,
                              child: Image.network(list[index]['imageUrl'].toString(),fit: BoxFit.fitWidth,),
                            ),
                            SizedBox(width: 5,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              Text(list[index]['name'].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                              SizedBox(height: 2,),
                              Text(list[index]['category'].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                              SizedBox(height: 10,),

                              Row(children: [
                                Text('\$${list[index]['price'].toString()}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                SizedBox(width: Get.width * 0.2,),

                                GestureDetector(
                                  child: Icon(Icons.delete),
                                  onTap: (){
                                    // ourReference.child(list[index]['id'].toString()).remove();
                                    Get.defaultDialog(
                                     title: 'Warning',
                                      middleText: 'Are you sure you want to Delete ?',
                                      actions: [
                                        ElevatedButton(
                                          child: Text('Yes'),
                                          onPressed: (){
                                            ourReference.child(list[index]['id'].toString()).remove();
                                            Get.back();
                                          },
                                        ),
                                        ElevatedButton(
                                          child: Text('No'),
                                          onPressed: (){
                                            Get.back();
                                          },
                                        ),
                                      ],

                                    );
                                  },
                                ),

                              ],)

                            ],),

                          ],),
                        ),
                      ),
                    );

                  },
                );

              }
              else{
                return Center(child: CircularProgressIndicator());
              }

            },
          )
        ),
      ),
    );
  }
}



// Design Class for Data

class DesignWidget extends StatelessWidget {
  String image,name,category,price;
  Widget icon;
  DesignWidget({Key? key,required this.icon,required this.category,required this.price,required this.image,required this.name}) : super(key: key);

  DatabaseReference ourReference= FirebaseDatabase.instance.ref('UserOrder');

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 12,
      color: HexColor('#98BFAA'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Row(children: [
            SizedBox(
              width: 130,
              height: 130,
              child: Image.network(image,fit: BoxFit.fitWidth,),
            ),
            SizedBox(width: 5,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
              SizedBox(height: 2,),
              Text(category,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              SizedBox(height: 10,),

              Row(children: [
                Text('\$${price}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                SizedBox(width: Get.width * 0.2,),
              ],)

            ],),

          ],),
        ),
      ),
    );
  }

  ShowDialog(){
    return Get.defaultDialog(
      title: 'Warning',
      middleText: 'Are you sure do want to delete',
      actions: [
        ElevatedButton(
          child: Text('Yes'),
          onPressed: (){
          },
        ),
        ElevatedButton(
          child: Text('No'),
          onPressed: (){},
        ),
      ]

    );
  }
}

