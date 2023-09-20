import 'package:ecommerce/components/favorite%20_icon.dart';
import 'package:ecommerce/components/quantity_adder.dart';
import 'package:ecommerce/components/related_items.dart';
import 'package:ecommerce/screens/cart_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_plus/share_plus.dart';
class ProductPage extends StatefulWidget {
  final String productId;
  final String productName;
  ProductPage({required this.productId,required this.productName});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Color _favIconColor = Colors.grey;
  final CollectionReference _productsRef = FirebaseFirestore.instance.collection("Products");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(241,242,237,1),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0,top: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:ImageIcon(
              AssetImage('images/back-arrow.png'),
                color: Colors.black,
                size: 100,
              ),
            ),
          ),
        ),
        title: Text('${widget.productName}',
        style: TextStyle(
          color: Colors.black,
        ),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(241,242,237,1),
              height: 650,
              child: FutureBuilder(
                  future:_productsRef.doc(widget.productId).get(),
                  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                    if(snapshot.hasError){
                      return Scaffold(
                        body: Center(
                          child: Text("Error: ${snapshot.error}"),
                        ),
                      );
                    }

                    if(snapshot.connectionState == ConnectionState.done){
                      Map<String,dynamic>? documentData = snapshot.data!.data() as Map<String, dynamic>?;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children:<Widget> [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
                            child: Stack(
                             alignment:FractionalOffset.topRight,
                              children: <Widget>[
                                Container(
                                color:Colors.white,
                                child: Center(
                                  child: Image.network('${(documentData as Map)["image"]}',
                                  height: 300,
                                  ),
                                ),
                              ),
                                IconButton(
                                    onPressed: ()async{
                                      final url = (documentData as Map)["image"];
                                     await Share.share(
                                          "$url");
                                    },
                                    icon: Icon(
                                      Icons.share,
                                      color: Colors.black,
                                    ),
                                ),
                                 Positioned(
                                   bottom:0,
                                   child:FavoriteIcon(),
                                 ),

                            ]
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('${(documentData as Map)["desc"]}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            ),
                          ),
                         Divider(
                           color: Colors.red,
                         ),

                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text(
                             '${(documentData as Map)["qty"]}\,\$${(documentData as Map)["prize"]}',
                             style: TextStyle(
                               color: Colors.red,
                               fontWeight: FontWeight.w600,
                               fontSize: 25,
                             ),
                           ),
                         ),

                       // quantity Adder
                       QuantityAdder(productId: widget.productId, price: '${(documentData as Map)["prize"]}',


                       ),
                       SizedBox(
                         height: 50,
                       ),

                        GestureDetector(
                          onTap:() {
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>CartPage(),),);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              height: 40,
                              width: 160,
                              child:Center(
                                child: Text('Buy now  ➝',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        ],
                     );

                    }



                    // Loading State
                    return Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
              ),
            ),

            Container(
              height: 600,
                child:SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                    child: RelatedItems(),
                )
            ),

          ],
        ),
      ),
    );
  }
}

