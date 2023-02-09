import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ndialog/ndialog.dart';

import '../StartingPage/InfoPage.dart';
import 'SignUP.dart';

class SignIn_Page extends StatefulWidget {
  const SignIn_Page({Key? key}) : super(key: key);

  @override
  State<SignIn_Page> createState() => _SignIn_PageState();
}

class _SignIn_PageState extends State<SignIn_Page> {

  var emailController= TextEditingController();
  var passwordController= TextEditingController();

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
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text('Welcome!',style: GoogleFonts.firaSans(letterSpacing: 0.5,fontSize: 24,fontWeight: FontWeight.w600)),
                    SizedBox(height: 5,),
                    Text('Sign in to Continue',style: TextStyle(letterSpacing: 1,fontSize: 16,fontWeight: FontWeight.w500,color: HexColor('#9376EE')),),
                  ],),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                // SignUp Button
                Center(
                  child: ElevatedButton(
                    child: Text('SIGN IN',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: 1),),
                    style: ElevatedButton.styleFrom(minimumSize: Size(250, 40),primary: HexColor('#3A00FF'),),
                    onPressed: (){
                      SigInFunctions();
                    },
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Center(child: Text('Forgot Password?',style: TextStyle(),)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
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
                Center(child: Text('Social Media Login',style: TextStyle(fontWeight: FontWeight.w400),)),
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
                  Text('Dont have an account?'),
                  SizedBox(width: 5,),
                  TextButton(
                    child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: 1),),
                    onPressed: (){
                      Get.off(()=> SignUp_Page());
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
  void SigInFunctions() async {
    var email= emailController.text.toString().trim();
    var password= passwordController.text.toString().trim();

    if(email.isEmpty || password.isEmpty){
      Fluttertoast.showToast(msg: 'Fill all Fields');
      return ;
    }else{

      // user SignIn code

      ProgressDialog progressDialog= new ProgressDialog(
          context,
          title: Text('Sign In'),
          message: Text('please wait ?'),
      );

      try{
        progressDialog.show();
        FirebaseAuth myAuth= FirebaseAuth.instance;
        UserCredential userCredential=await myAuth.signInWithEmailAndPassword(email: email, password: password);

        if(userCredential.user != null){
          progressDialog.dismiss();
          Get.to(()=> StartingPage());
          Fluttertoast.showToast(msg: 'Sign In Successfully');
        }

      }
      on FirebaseException catch(e){
        progressDialog.dismiss();
        if(e.code == 'user-not-found'){
          Fluttertoast.showToast(msg: 'invalid email');
        }
        else if(e.code == 'wrong-password'){
          Fluttertoast.showToast(msg: 'wrong password');
        }
      }
      catch(e){
        progressDialog.dismiss();
        print(e.toString());
      }

    }

  } // Connect to firebase database coding

} // Main class of SingIn Page b

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

