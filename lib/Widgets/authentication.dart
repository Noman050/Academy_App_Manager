import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manager_app/Screens/loginScreen.dart';


class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String getID(){
    final  user =  _auth.currentUser;
    final userid = user?.uid;
    return userid.toString();
  }

  //SIGN UP METHOD
  Future signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut(BuildContext context) async {
    await _auth.signOut().then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
    });

  }
}