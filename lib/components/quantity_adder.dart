import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
class QuantityAdder extends StatefulWidget {
  final String productId;
  final String price;
   QuantityAdder({required this.productId,required this.price});

  @override
  State<QuantityAdder> createState() => _QuantityAdderState();
}

class _QuantityAdderState extends State<QuantityAdder> {
  int x = 0;
  String msg1 = '';
  final CollectionReference _usersRef = FirebaseFirestore.instance.collection("users");

  final User? _user = FirebaseAuth.instance.currentUser;

  Future<void> _addToCart(){
    return _usersRef.doc(_user?.uid).collection('cart').doc(widget.productId).set({'qty':x});
  }
  Future<void> _removeToCart(){
    return _usersRef.doc(_user?.uid).collection('cart').doc(widget.productId).delete();

  }
  void showToast({required String msg1}) => Fluttertoast.showToast(
      msg: msg1,
      fontSize: 18.0,
      gravity: ToastGravity.BOTTOM,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 15.0,),
      child: Container(
        height: 40.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: IconButton(
                onPressed:()async{
                  if(x> 1){
                   setState(() {
                     x = x-1;
                   });
                    await _addToCart();
                   showToast(
                     msg1: 'Product removed from cart'
                   );
                  } else {
                    setState(() {
                      x = 0;
                    });
                    await _removeToCart();
                    showToast(
                        msg1: 'no item in the cart'
                    );
                  }


            },
                icon: Icon(
                  Icons.remove,
                  color:Colors.red,
                )
            ),
          ),

          Text('$x',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          ),


          IconButton(onPressed:()async{
            setState((){
              x = x+1;
            });
            await _addToCart();
            showToast(
                msg1: 'Product added to cart'
            );
          },
              icon: Icon(
                Icons.add,
                color:Colors.red,
              )
          ),
         Container(
           height: 40.0,
           width: 90,
           color: Colors.black,
           child: Center(
             child: Text(
               '\$${double.parse(widget.price)*x}',
                   style:TextStyle(color: Colors.white,
                   fontSize: 18.0,
                   ),
             ),
           ),
         )
        ],
          ),
      ),
    );
  }
}

