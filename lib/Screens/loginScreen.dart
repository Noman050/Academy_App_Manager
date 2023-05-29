// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../Widgets/authentication.dart';
import 'homeScreen.dart';
import 'signUpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool _isValid = false;

  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen', style: TextStyle(fontSize: 25, letterSpacing: 2),),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/images/loginnn.jpg"),
                    fit: BoxFit.cover
                )
            ),

            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60.0,
                    backgroundImage: AssetImage('Assets/images/loginn.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 50,
                    shadowColor: Colors.blue[800],
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child:
                      Form(
                        key: _form,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            const SizedBox(
                              height: 5,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Enter Email",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.yellow, letterSpacing: 2),),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: email,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.white
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.white
                                      )

                                  ),
                                  hintText: "e.g. nomi@gmail.com"
                              ),
                              validator: (value) {
                                // Check if this field is empty
                                if (value == null || value.isEmpty) {
                                  return 'Email field is required';
                                }

                                // using regular expression
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return "Please enter a valid email address";
                                }

                                // the email is valid
                                return null;
                              },
                            ),

                            const SizedBox(
                              height: 30,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Enter Password",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.yellow, letterSpacing: 2),),
                            ),
                            TextFormField(
                              
                              controller: password,
                              validator: (String? value) {
                                if (value != null && value.isEmpty) {
                                  return "Password is Required";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.white
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.white
                                      )

                                  ),

                                  hintText: "e.g. nomi123&&@"

                              ),
                            ),

                            const SizedBox(
                              height: 30,
                            ),

                            SizedBox(
                                height:50,
                                width:150,
                                child:
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(shape: const StadiumBorder(), elevation: 10),
                                  onPressed:(){
                                    _saveForm();
                                    if(_isValid==true){
                                      AuthenticationHelper()
                                          .signIn(email.text,  password.text)
                                          .then((result) {
                                        if (result == null) {
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                                        } 
                                      });
                                    }
                                  },
                                  child: const Text('Login',style: TextStyle(fontSize: 20,),),
                                )
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                           TextButton(onPressed:(){

                                          Navigator.pushAndRemoveUntil(
                                          context,
                                            MaterialPageRoute(builder: (context) => const SignUpScreen()),
                                                (Route<dynamic> route) => false,
                                           );
                                        }, child: const Text("Not Registered Yet ? Register Now !", style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1),)),
                            const SizedBox(
                              height: 30,
                            ),
                            const Center(
                              child: Text(
                                "Developed by: Noman Ali",style: TextStyle(color: Colors.yellow, fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, letterSpacing: 2),
                                
                              ),
                            ), 
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}