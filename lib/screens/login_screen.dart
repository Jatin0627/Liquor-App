import 'package:ecommerce/components/bottom_navBar.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fluttertoast/fluttertoast.dart';
class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool isloading = false;

 // final storage = new FlutterSecureStorage();
  void cancelToast() => Fluttertoast.cancel();

  void showToast({required String msg1}) => Fluttertoast.showToast(
    msg: msg1,
    fontSize: 18.0,
    gravity: ToastGravity.BOTTOM,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/Bar.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                email = value;
              },
              decoration: kTextFeildDecoration.copyWith(hintText: 'Enter Your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
             password = value;
              },
              decoration: kTextFeildDecoration.copyWith(hintText: 'Enter Your password'),
            ),
            SizedBox(
              height: 24.0,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color:Colors.black,
                borderRadius: BorderRadius.circular(30.0),
                child:MaterialButton(
                  onPressed:()async{
                    setState(() {
                      isloading = true;
                    });
                    try{
                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);

                      if(user != null){

                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavBar()), (route) => false);

                      }
                    }catch(e){
                      print(e);
                    }

                    Future.delayed(Duration(seconds: 6),(){
                      setState(() {
                        isloading = false;
                      });
                      if(isloading == false){
                        showToast(msg1: 'Invalid email and Password');
                      }else{
                        cancelToast();
                      }
                    });
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: isloading? CircularProgressIndicator(color: Colors.white,) :Text(
                    'LogIn',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
