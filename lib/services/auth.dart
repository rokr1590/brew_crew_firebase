import 'package:firebase_auth/firebase_auth.dart';

import '../models/custom_user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //creating our custom USer Object from or based on the FireBaseUSer we get
  CustomUser ?_userFromFirebaseUser(User cuser){
    return cuser != null ? CustomUser(uid: cuser.uid):null;
  }

  //auth change user Stream

  Stream<User?> get user {
    try {
      return _auth.authStateChanges();
          //.map((User user) => _userFromFirebaseUser(user));
      //.map(_userFromFirebaseUser); //alternative way for above map method
    }
    catch(e)
    { print("Error in listening to Stream ${e.toString()}");
    return _auth.authStateChanges();
        /*.map((User user) => _userFromFirebaseUser(user));*/
    }
  }

  //sign in anon
  Future signInAnon() async{
    try{
      //AuthResult changed with UserCredential
      UserCredential authresult =await _auth.signInAnonymously();
      //FirebaseUser has been changed to User
      User ?firebaseuser = authresult.user;
      return _userFromFirebaseUser(firebaseuser!);
      // return firebaseuser;
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and Password

  //register with email and password

  //sign out
  Future signOutCustomUser() async{
    try{
      return await _auth.signOut();
    }
    catch(e)
    {
      print("Error with Signing Out ${e.toString()}");
      return null;
    }
  }
}