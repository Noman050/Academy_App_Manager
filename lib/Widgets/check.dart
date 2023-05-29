import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/homeScreen.dart';
import '../Screens/loginScreen.dart';

class Check extends StatelessWidget {
  final _auth=FirebaseAuth.instance;

  Check({super.key});

  @override
  Widget build(BuildContext context) {

    if(_auth.currentUser==null){
      return const LoginScreen();
    }
    else{
      return const HomeScreen();
    }
  }
}
