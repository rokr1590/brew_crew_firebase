import 'package:brew_coffee_firebase/models/custom_user.dart';
import 'package:brew_coffee_firebase/screens/authenticate/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_coffee_firebase/screens/home/home.dart';
import 'package:brew_coffee_firebase/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userfromProvider = Provider.of<User?>(context);

    //return either Home or Authenticate widget
    if(userfromProvider == null)
      {
        return Authenticate();
      }else
        {
          return Home();
        }

  }
}
