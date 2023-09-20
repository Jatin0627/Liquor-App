import 'package:ecommerce/components/related_items.dart';
import 'package:flutter/material.dart';

class ItemsPage extends StatefulWidget {
    final String categoryname;
    ItemsPage({required this.categoryname});
  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {

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
                size: 30,
              ),
            ),
          ),
        ),
        title: Text('${widget.categoryname}',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children:<Widget> [
          Container(
            alignment: Alignment.center,
            height: 100,
            color:Color.fromRGBO(241,242,237,1) ,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 90,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search,
                            color: Colors.black,
                          ),
                          hintText: 'Find your spirit',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(35.0),
                          )
                      ),
                    ),
                  ),
                ),
                Text('Filter',
                  style: TextStyle(
                    fontSize: 18.0,

                  ),),
                IconButton(onPressed: (){},
                  icon:ImageIcon(
                       AssetImage('images/filter.png'),
                       color: Colors.black,
                    size: 30,
                ),
                ),
              ],
            ),
          ),

          //items to disply
          Container(
            height: 570,
            child: SingleChildScrollView(
              child: RelatedItems(),
            ),
          )
        ],
      ),
    );
  }
}

