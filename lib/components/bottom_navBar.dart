import 'package:ecommerce/screens/cart_page.dart';
import 'package:ecommerce/screens/empty_page.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // List<Widget> page = [
  //   // add your list of widgets here
  //   Center(child: Text("1")),
  //   Center(child: Text("2")),
  //   Center(child: Text("3")),
  //   Center(child: Text("4"))
  // ];
  int index = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,

      //body: page[index],
      body: HomePage(),
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        child: FittedBox(
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.red,
            child: Container(
              child: Center(
              child: Icon(Icons.shopping_cart,
                color: Colors.white.withOpacity(0.9),
                ),
                ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(width: 4, color: Colors.white)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Container(
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 20),
                Opacity(
                  opacity: index == 0 ? 1 : 0.5,
                  child: GestureDetector(
                    child: navButton("Home", Icons.home_outlined),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar()));
                      setState(() {
                        index = 0;
                      });
                    },
                  ),
                ),
                Spacer(),
                Opacity(
                  opacity: index == 1 ? 1 : 0.5,
                  child: GestureDetector(
                    child: navButton("Favorites", Icons.heart_broken_outlined),
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                  ),
                ),
                Spacer(),
                Spacer(),
                Opacity(
                  opacity: index == 2 ? 1 : 0.5,
                  child: GestureDetector(
                    child: navButton("Order", Icons.plagiarism_outlined),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EmptyPage()));
                      setState(() {
                        index = 2;
                      });
                    },
                  ),
                ),
                Spacer(),
                Opacity(
                  opacity: index == 3 ? 1 : 0.5,
                  child: GestureDetector(
                    child:
                    navButton("MyProfile", Icons.account_circle_outlined),
                    onTap: () {
                      setState(() {
                        index = 3;
                      });
                    },
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          )),
    );
  }
}

Widget navButton(text, icon) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: Colors.red,
      ),
      Text(
        text,
        style: TextStyle(color: Colors.red),
      ),
    ],
  );
}