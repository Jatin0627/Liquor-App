import 'package:ecommerce/screens/cart_page.dart';
import 'package:ecommerce/screens/empty_page.dart';
import 'package:ecommerce/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

retItems(text, icondata) {
  return Container(
    child: Column(
      children: <Widget>[
        Divider(),
        ListTile(
          title: Text("$text"),
          leading: Icon(
            icondata,
            color: Colors.red,
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 15),
        )
      ],
    ),
  );
}

class Drawer1 extends StatefulWidget {

  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email1 = "";
  var loggedInUser;



  //final storage = new FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser () async{
    final user = await _auth.currentUser;
    try{
      if(user !=null){
        loggedInUser = user;

        setState(() {
          email1 = loggedInUser.email.toString();
        });

        print(email1);
      }
    }catch(e){
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: ListView(
        children: [
          Container(
            height: 200,
            color:Color.fromRGBO(241,242,237,1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset('images/account.png',
                    height: 120,
                    width: 120,
                    color: Colors.grey,
                  ),
                ),

                // Text("$email1",
                //   style: TextStyle(
                //     fontSize: 18.0,
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Text("${email1}",
                style: TextStyle(
                  fontSize: 18.0,

                ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: retItems("Home", Icons.home),
          ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: retItems("Categories", Icons.menu),
          ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: retItems("Search", Icons.search),
          ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: retItems("Favorites", Icons.favorite),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
            },
            child: retItems("Cart", Icons.shopping_cart),
          ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: retItems("Location", Icons.location_on),
          ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: retItems("Profile", Icons.account_circle),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EmptyPage()));
            },
            child: retItems("Orders", Icons.replay_10_sharp),
          ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: retItems("Rate Us", Icons.thumb_up),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: MaterialButton(
              onPressed: () async{
                await FirebaseAuth.instance.signOut();
               // await storage.delete(key:'uid');
              // Navigator.pushNamed(context, WelcomeScreen.id);
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()), (route) => false);
              },
              child: Text("Logout",
              style:TextStyle(
                fontSize:20,
              )
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
