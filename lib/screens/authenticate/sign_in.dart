import 'package:brew_coffee_firebase/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth =AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,//no elevation in app bar that is no shadow
        title: Text("Sign in to Brew Crew"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: ElevatedButton(
          child: Text('Sign in anon'),
          onPressed: () async {
            //the function is async because we will be using a function in here that returns a
            // Future object and there fore we will also be using await keywword to wait
            //for that Future Function to finish
            dynamic fbuser = await _auth.signInAnon();
            if(fbuser == null)
              {
                print("Error Signing in ");
              } else {
                print("Signed in ");
                print(fbuser.uid);
            }
          },
        ),
      ),
    );
  }
}
