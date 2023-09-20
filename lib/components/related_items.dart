
import 'package:ecommerce/components/favorite%20_icon.dart';
import 'package:ecommerce/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';


class RelatedItems extends StatefulWidget {
  @override
  State<RelatedItems> createState() => _RelatedItemsState();
}

class _RelatedItemsState extends State<RelatedItems> {
  final CollectionReference _productsRef = FirebaseFirestore.instance.collection("Products");
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 700,
            child: FutureBuilder<QuerySnapshot>(
              future:_productsRef.get(),
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
                    child: GridView(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 200),
                      shrinkWrap: true,

                      children: snapshot.data!.docs.map((document){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ProductPage(productId: document.id,
                                  productName: '${(document.data() as Map)['name']}',

                            ),
                            ),
                            );
                              },
                            child: Container(
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Image.network("${(document.data() as Map)['image']}",
                                      height: 120,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text("${(document.data() as Map)['name']}",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("\$${(document.data() as Map)['prize']}",
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Icon(
                                          Icons.favorite_border,
                                          color: Colors.black,

                                        ),
                                        //  FavoriteIcon(),
                                      ],
                                    ),
                                  )

                                ],
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
    );
  }
}
