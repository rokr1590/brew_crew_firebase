import 'package:brew_coffee_firebase/models/custom_user.dart';
import 'package:brew_coffee_firebase/screens/wrapper.dart';
import 'package:brew_coffee_firebase/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
        value: AuthService().user, //Listening to the user  stream in the AuthService Class created in the auth.dart
        initialData: null,
        child: const MaterialApp(
         home: Wrapper(),
      ),
    );
  }
}


