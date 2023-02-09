import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ndialog/ndialog.dart';
import 'package:nike_app/StartingPage/InfoPage.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({Key? key}) : super(key: key);

  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {

  var nameController= TextEditingController();
  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  var confirmPassController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text('Hi !',style: GoogleFonts.firaSans(fontSize: 24,fontWeight: FontWeight.w700)),
                    SizedBox(height: 5,),
                    Text('Create a new account',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: HexColor('#9376EE')),),
                  ],),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    enabledBorder: myInputBorder(),
                    focusedBorder: myFocusBorder(),
                    prefixIcon: Icon(Icons.person,color: HexColor('#6E6D72'),),
                    hintText: 'Enter Name',
                    label: Text('Name'),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    enabledBorder: myInputBorder(),
                    focusedBorder: myFocusBorder(),
                    prefixIcon: Icon(Icons.email,color: HexColor('#6E6D72'),),
                    hintText: 'enter email ',
                    label: Text('Email'),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    enabledBorder: myInputBorder(),
                    focusedBorder: myFocusBorder(),
                    prefixIcon: Icon(Icons.password,color: HexColor('#6E6D72'),),
                    hintText: 'Password',
                    label: Text('password'),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                TextField(
                  obscureText: true,
                  controller: confirmPassController,
                  decoration: InputDecoration(
                    enabledBorder: myInputBorder(),
                    focusedBorder: myFocusBorder(),
                    prefixIcon: Icon(Icons.password,color: HexColor('#6E6D72'),),
                    hintText: 'confirm password',
                    label: Text('confirm password'),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                // SignUp Button
                Center(
                  child: ElevatedButton(
                    child: Text('SIGN UP',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: 1),),
                    style: ElevatedButton.styleFrom(minimumSize: Size(250, 40),primary: HexColor('#3A00FF'),),
                    onPressed: (){
                      SigUpFunctions();
                    },
                  ),
                ),
                
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Center(child: Text('Forgot Password?',style: TextStyle(),)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                  SizedBox(
                    width: 100,
                    child: Divider(
                      color: Colors.black54,
                      height: 5,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(width: 6,),
                  Text('OR',style: TextStyle(fontWeight: FontWeight.w400),),
                  SizedBox(width: 6,),
                  SizedBox(
                    width: 100,
                    child: Divider(
                      color: Colors.black54,
                      height: 5,
                      thickness: 1,
                    ),
                  ),
                ],),

                // Social Media Login
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                Center(child: Text('Social Medial Login',style: TextStyle(fontWeight: FontWeight.w400),)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: Image.asset('assets/images/google.png'),
                      )
                  ),
                  SizedBox(width: 8,),
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: Image.asset('assets/images/instagram.png'),
                      )
                  ),
                  SizedBox(width: 8,),
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: Image.asset('assets/images/apple.png'),
                      )
                  ),

                ],),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Text('Already have an account?'),
                  SizedBox(width: 5,),
                  TextButton(
                    child: Text('Sign in',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: 1),),
                    onPressed: (){
                      Get.back(result:SignUp_Page());
                    },
                  )
                ],)

              ],),
            ),
          ),
        ),
      ),
    );
  }

  // Connect to firebase database coding
  void SigUpFunctions() async{

    var name= nameController.text.toString().trim();
    var email= emailController.text.toString().trim();
    var password= passwordController.text.toString().trim();
    var confirm_password= confirmPassController.text.toString().trim();

    if(name.isEmpty || email.isEmpty || password.isEmpty || confirm_password.isEmpty){
      Fluttertoast.showToast(msg: 'Fill all Fields');
      return ;
    }

    if(password.length < 6){
      Fluttertoast.showToast(msg: 'password too short!');
      return ;
    }
    else if(password  != confirm_password){
      Fluttertoast.showToast(msg: 'Password Not Matching');
      return ;
    }else{

      // USER Sign Up Code
      ProgressDialog progressDialog= new ProgressDialog(
        context,
        title: Text('Sign Up'),
        message: Text('please wait ?'),
      );

      try{
        progressDialog.show();
        FirebaseAuth myAuth= FirebaseAuth.instance;
        UserCredential userCredential= await myAuth.createUserWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null){
          progressDialog.dismiss();
           Get.to(()=> StartingPage());
           Fluttertoast.showToast(msg: 'Sign Up successfully');
        }

      }on FirebaseException catch(e){
        progressDialog.dismiss();
        if(e.code == 'email-already-in-use'){
          Fluttertoast.showToast(msg: 'email already in use');
        }
        else if(e.code =='invalid-email'){
          Fluttertoast.showToast(msg: 'invalid-email');
        }

      }
      catch(e){
        progressDialog.dismiss();
        print(e.toString());
      }

    }

  } // Connect to firebase database coding

} // Main class of SingUp Page b



// Other Functions

  OutlineInputBorder myInputBorder(){
  return OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black87,),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );
 }

  OutlineInputBorder myFocusBorder(){
  return OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black87,),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );
}
