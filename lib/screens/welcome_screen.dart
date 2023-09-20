import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

  String finalEmail = '';
class WelcomeScreen extends StatefulWidget {
  // static const String id = "welcome_screen";
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  //
  // Future getValidationData() async{
  //   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var obtainedEmail = sharedPreferences.getString('email');
  //   setState(() {
  //     finalEmail = obtainedEmail!;
  //   });
  //   print(finalEmail);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          elevation: 5.0,
          color:Colors.black,
          borderRadius: BorderRadius.circular(30.0),
          child:MaterialButton(
            onPressed:(){
              //Navigator.pushNamed(context, LoginScreen.id);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            },
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              'LogIn',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),

            SizedBox(height: 10,),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color:Colors.black,
                borderRadius: BorderRadius.circular(30.0),
                child:MaterialButton(
                  onPressed:(){
                    //Navigator.pushNamed(context, RegisterScreen.id);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
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
