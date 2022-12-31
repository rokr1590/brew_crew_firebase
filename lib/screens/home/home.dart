import 'package:brew_coffee_firebase/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth =AuthService();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle =TextButton.styleFrom(
      minimumSize: Size(30,10),
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.only(right: 9)
    );
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Brew Crew"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,//no shadow
        actions: [
          TextButton.icon(
            icon:const Icon(Icons.person,color: Colors.black,),
            style: flatButtonStyle,
            onPressed: () async{
              await _auth.signOutCustomUser();
            },
            label:const Text("Logout",style: TextStyle(color: Colors.black),),
          )
        ],
      ),

    );

  }
}
