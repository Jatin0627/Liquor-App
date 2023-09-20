import 'package:ecommerce/components/bottom_navBar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  static String id = "register_screen";
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool isloading = false;
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
         height: 5.0,
           ),
         Text(
        'Password must be 8 letter long',
        style: TextStyle(
          color: Colors.red,
          ),
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
                      final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if(newUser != null){
                        //Navigator.pushNamed(context,HomePage.id);
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavBar()), (route) => false);

                      }
                    }catch(e){
                      print(e);
                    }
                    Future.delayed(Duration(seconds: 5),(){
                      setState(() {
                        isloading = false;
                      });
                    });
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: isloading? CircularProgressIndicator(color: Colors.white,) :Text(
                    'Register',
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

