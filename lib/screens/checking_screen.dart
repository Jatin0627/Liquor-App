// import 'package:ecommerce/components/bottom_navBar.dart';
// import 'package:ecommerce/screens/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'home_page.dart';
//
// class CheckingScreen extends StatelessWidget {
//   static String id = "checking_screen";
//   final storage = new FlutterSecureStorage();
//   Future<bool> checkLoginStatus() async{
//     String? value = await storage.read(key: 'uid');
//     if(value == null){
//       return false;
//     }
//     return true;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         if(snapshot.data == false){
//           return WelcomeScreen();
//         }
//         if(snapshot.connectionState == ConnectionState.waiting){
//           return const Center(child: CircularProgressIndicator(),);
//         }
//         return NavBar();
//       },
//     );
//   }
// }
