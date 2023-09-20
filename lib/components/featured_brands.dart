import 'package:flutter/material.dart';

class FeaturedBrands extends StatefulWidget {
  @override
  State<FeaturedBrands> createState() => _FeaturedBrandsState();
}

class _FeaturedBrandsState extends State<FeaturedBrands> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context,index){
          return Padding(
            padding:EdgeInsets.fromLTRB(8.0,0, 8.0, 8.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(18.0),

              ),
              child: Image.asset('images/Brand3.jpg',
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }
}


