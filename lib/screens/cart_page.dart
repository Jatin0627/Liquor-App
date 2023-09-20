import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/components/delete_button.dart';
import 'package:ecommerce/components/quantity_adderCart.dart';
import 'package:ecommerce/screens/product_page.dart';
import 'package:ecommerce/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class CartPage extends StatefulWidget {

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
 FirebaseServices _firebaseServices = FirebaseServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(241,242,237,1),
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
                size: 80,
              ),
            ),
          ),
        ),
        title: Text('Cart',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children:[
          Column(
          children: [
            Container(
              height: 700,
              child: FutureBuilder<QuerySnapshot>(
                future:_firebaseServices.usersRef.doc(_firebaseServices.getUserId())
                    .collection("cart").get(),
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Scaffold(
                      body: Center(
                        child: Text("Error: ${snapshot.error}"),
                      ),
                    );
                  }
                  if(snapshot.connectionState == ConnectionState.done){
                    // print( snapshot.data!.docs.map((document){}).length);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: snapshot.data!.docs.map((document){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                // Navigator.push(context,
                                //   MaterialPageRoute(builder: (context) => ProductPage(productId: document.id,
                                //     productName: '${(document.data() as Map)['name']}',
                                //
                                //   ),
                                //   ),
                                // );
                              },
                              child:Container(
                                    height: 160,
                                    child: FutureBuilder(
                                      future: _firebaseServices.productsRef.doc(document.id).get(),
                                      builder: (context,AsyncSnapshot<DocumentSnapshot> snapshot){
                                        if(snapshot.hasError){
                                          return Scaffold(
                                            body: Center(
                                              child: Text("Error: ${snapshot.error}"),
                                            ),
                                          );
                                        }
                                        if(snapshot.connectionState == ConnectionState.done){
                                          // Map _productMap = productSnap.data as Map;
                                          Map<String,dynamic>? _productMap = snapshot.data!.data() as Map<String, dynamic>?;

                                          return ListView(
                                            physics: NeverScrollableScrollPhysics(),
                                            children:[
                                              Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 1.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 110,
                                                  width: 120,
                                                  child: Center(
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      child: Image.network("${(_productMap as Map)['image']}",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('${(_productMap as Map)['name']}',
                                                        style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                        ),

                                                        DeleteButton(productId:document.id),
                                                        // IconButton(onPressed: (){},
                                                        //     icon:Icon(
                                                        //         Icons.delete,
                                                        //     ),
                                                        // )
                                                      ],
                                                    ),
                                                    Container(
                                                      alignment: Alignment.center,
                                                       height: 30,
                                                      width:80,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20.0),
                                                        border: Border.all(color: Colors.red,),
                                                      ),
                                                     child: Text('${(_productMap as Map)['qty']}',
                                                     style: TextStyle(
                                                       fontWeight: FontWeight.w500,
                                                     ),
                                                     ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),

                                                    QuantityAdderCart(
                                                      productId: document.id,
                                                      price: '${(_productMap as Map)['prize']}',
                                                      qty: '${(document.data() as Map)['qty']}',
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Divider(
                                                color: Colors.red,
                                              )
                                            ],
                                          );
                                        }

                                        // Loading State
                                        return const Scaffold(
                                          body: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                            ),
                          );
                        }).toList(),
                      ),
                    );

                  }
                  // Loading State
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),

          ],
        ),

        ],
      ),

    );
  }
}

