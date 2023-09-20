import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241,242,237,1),
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
                size: 70,
              ),
            ),
          ),
        ),
        title: Text('Best Seller',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            color:Color.fromRGBO(241,242,237,1) ,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 10,
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
              ],
            ),
          ),
          const SizedBox(
            height: 130,
          ),
          const Text('No Orders',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 10,),
          const Text('No orders yet',
            style:TextStyle(
              fontSize: 16.0,

            ),
          ),

        ],
      ),
    );
  }
}

