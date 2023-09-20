import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/screens/cart_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeleteButton extends StatefulWidget {
  final String productId;
  DeleteButton({required this.productId});

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  final CollectionReference _usersRef = FirebaseFirestore.instance.collection("users");

  final User? _user = FirebaseAuth.instance.currentUser;
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
    return  IconButton(
      onPressed: ()async{
        await _removeToCart();
        showToast(
            msg1: 'Product deleted from cart'
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CartPage()));
      },
      icon:Icon(
        Icons.delete,
      ),
    );
  }
}
