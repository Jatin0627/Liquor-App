import 'package:ecommerce/screens/items_page.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
       Categories(imageLocation: 'images/beerBarrel.png',name: 'Liquor',),
          Categories(imageLocation: 'images/beerGlass.png',name: 'Beer',),
          Categories(imageLocation: 'images/wineGlass.png',name: 'Wine',),
          Categories(imageLocation: 'images/tin.png',name: 'RTD',),
          Categories( imageLocation: 'images/nachos-package.png',name: 'Cantina',),
          Categories( imageLocation: 'images/smoking.png',name: 'Smoking',),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final String name ;
  final String imageLocation;
  // final Function onPressed;
  //final Function onTap;
  Categories ({required this.name,required this.imageLocation,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0,bottom: 5.0),
      child: Column(
        children: [
          GestureDetector(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ItemsPage(categoryname:name,),

              ),);},

            child: Container(
              width: 90,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red),
              ),
              child: Center(
                child: Image.asset(imageLocation,
                  height: 60,
                  width: 60,
                ),
              ),
            ),
          ),
          SizedBox(height: 7.0,),
          Text(name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 15.0,
          ),
          ),
        ],
      ),
    );
  }
}


