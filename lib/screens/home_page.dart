
import 'package:ecommerce/components/featured_brands.dart';
import 'package:ecommerce/components/horizontal_list.dart';
import 'package:ecommerce/screens/best_seller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/drawer.dart';
import '../components/related_items.dart';
import 'items_page.dart';


class HomePage extends StatefulWidget {
  static String id = 'home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer1(),
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text('Liquor ',
          style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          ),
        ),

        leading:Builder(builder: (context){
          return  Padding(
            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: IconButton(
                icon: Image.asset('images/menu.png',
                  fit: BoxFit.cover,
                ),
                onPressed:  () => Scaffold.of(context).openDrawer(),
              ),
            ),
          );
        }),


        backgroundColor: const Color.fromRGBO(241,242,237,1),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              icon: const Icon(Icons.account_circle,
                color: Colors.grey,
                size: 45.0,
              ),
              onPressed: () {  },
            ),
          )
        ],
      ),

      backgroundColor:const Color.fromRGBO(241,242,237,1),
      body: ListView(
        children: <Widget> [
          Container(
            height: 80,
            child: Image.asset('images/barTender.png',
            fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),

          //Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search,
                color: Colors.black,
                ),
                hintText: 'Find your spirit',
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(35.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(35.0),
                )
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //Categories
          const Padding(padding: EdgeInsets.all(8.0),
          child: Text(
            'Categories',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          ),
          ),

          //Horizontal List
          HorizontalList(),

          const Divider(
            color: Colors.red,
          ),
          //Cantina Special Products
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(
                builder: (context) => ItemsPage(categoryname:'Snacks',),
              ),);},
              child: Container(
                height: 170.0,
               child: Image.asset('images/Bar.png',
               fit: BoxFit.cover,
               ),
              ),
            ),
          ),
         const Divider(color: Colors.red,),
       // Featured Collections

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(
                builder: (context) => ItemsPage(categoryname:'Bar Collection',),
              ),);},
              child: Container(
                height: 170.0,
                child: Image.asset('images/barCollection.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Divider(color: Colors.red,),
          //Clearance items

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(
                builder: (context) => ItemsPage(categoryname:'Clearance Sale',),
              ),);},
              child: Container(
                height: 170.0,
                child: Image.asset('images/clearance.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Divider(color: Colors.red,),

          //Featured Brands
          ListTile(
            title: const Text('Featured Brands',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
            ),
            trailing: GestureDetector(
              onTap: (){},
              child: const Text('See all',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.red,
              ),
              ),
            ),
          ),
          SizedBox(
            height: 400,
            child: FeaturedBrands(),
          ),
          const Divider(
            color: Colors.red,
          ),

          // Best Sellers
          Padding(
            padding:  const EdgeInsets.only(left: 8.0,right: 8.0),
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('Best Sellers',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 17.0,
                  ),
              ),
              InkWell(
                onTap: (){
                  //Navigator.pushNamed(context, BestSellers.id);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>BestSellers()));
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 17.0,
                  ),
                ),
              ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.red,
          ),
          //related items you viewed
          Padding(
            padding: const EdgeInsets.only(left: 8.0,bottom: 4.0,),
            child: Container(
              height: 20.0,
              child: const Text('Related to items you\'ve viewed',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
            ),
          ),
         RelatedItems(),
        ],
      ),

    );
  }
}
