// ignore_for_file: library_private_types_in_public_api
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Widgets/authentication.dart';
import 'loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  final _form = GlobalKey<FormState>();
  bool _isValid = false;

  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }

  var n=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Up',style: TextStyle(fontSize: 25, letterSpacing: 2)),
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
        child:  SingleChildScrollView(
          child: Container(
            
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/images/signupp.png"),
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
                    backgroundImage: AssetImage('Assets/images/signup.jpg'),
                    
                  ),
                ),
                Card(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 40,
                  shadowColor: Colors.blue[800],
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child:

                    Form(
                      key: _form,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Enter Academy Name",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.yellow, letterSpacing: 2),),
                          ),
                          TextFormField(
                            controller: name,
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
                                hintText: "e.g. Noman Academic Services"
                            ),
                            validator: (value) {
                              // Check if this field is empty
                              if (value == null || value.isEmpty) {
                                return 'Name is required';
                              }
                              // the email is valid
                              return null;
                            },
                          ),

                        const SizedBox(height: 10,),
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
const SizedBox(height: 10,),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Enter Phone Number",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.yellow, letterSpacing: 2),),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: phone,
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
                                hintText: "e.g. +923090512091"
                            ),
                            validator: (value) {
                              // Check if this field is empty
                              if (value == null || value.isEmpty) {
                                return 'Phone number is';
                              }


                              // the email is valid
                              return null;
                            },
                          ),
const SizedBox(height: 10,),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Enter Password",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.yellow, letterSpacing: 2),),
                          ),
                          TextFormField(
                            controller: password,
                            validator: (String? password) {
                              if (password != null && password.isEmpty) {
                                return "Password is Required";
                              }
                              else if(password!.length<7)
                              {
                                return "Minimum Password length is 7 ";
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
                                  child: const Text('Sign Up',style: TextStyle(fontSize: 20),),
                                  onPressed:() async {
                                    _saveForm();
                                     if(_isValid==true)
                                      {
                                        AuthenticationHelper()
                                            .signUp(email.text, password.text)
                                            .then((result) {
                                          if (result == null) {
                                            final uid = AuthenticationHelper().getID();
                                            FirebaseFirestore.instance
                                                .collection("manager")
                                                .doc(uid)
                                                .collection('academy')
                                                .add({
                                              'name':name.text,
                                             'email': email.text,
                                              'phone': phone.text,
                                              'password':password.text
                                            });
                                            FirebaseFirestore.instance
                                                .collection("academies")
                                                .add({
                                              'name':name.text,
                                              'email': email.text,
                                              'phone': phone.text,
                                              'password':password.text,
                                              'uid' : uid
                                            });
                                            FirebaseFirestore.instance
                                                .collection("manager")
                                                .doc(uid)
                                                .collection('teachers')
                                                .add({
                                              'name':'No Teacher',
                                              'subject' : 'null',
                                              'class' : 'null',
                                              'email' : 'null',
                                            'image' : 'null',
                                              'phone' : 'null',
                                              'password' : 'null',
                                            });
                                      FirebaseFirestore.instance
                                          .collection("manager")
                                          .doc(uid)
                                          .collection('students')
                                          .add({
                                      "class":'null',
                                      "name": 'No Student',
                                      "email": 'null',
                                      "phone": 'null',
                                      "password": 'null',
                                      "subjects": 'null',
                                      "image" : 'null',
                                      "s1":'null',
                                      "s2":'null',
                                      "s3":'null',
                                      "s4":'null',
                                      "s5":'null',
                                      "s6":'null',
                                      "s7":'null',
                                      "s8":'null',
                                      "t1":'null',
                                      "t2":'null',
                                      "t3":'null',
                                      "t4":'null',
                                      "t5":'null',
                                      "t6":'null',
                                      "t7":'null',
                                      "t8":'null',
                                      "jan":'null',
                                      "feb":'null',
                                      "mar":'null',
                                      "apr":'null',
                                      "may":'null',
                                      "jun":'null',
                                      "jul":'null',
                                      "aug":'null',
                                      "sep":'null',
                                      "oct":'null',
                                      "nov":'null',
                                      "dec":'null',
                                      });
                                            showAlertDialog(context);
                                          } else {
                                            // print("NO");
                                            showAlertDialogForError(context);
                                          }
                                        });
                                      }
                                            },
                              ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                        TextButton(onPressed:(){

                                          Navigator.pushAndRemoveUntil(
                                          context,
                                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                                                (Route<dynamic> route) => false,
                                           );
                                        }, child: const Text("Already Registered ? Login Now !", style: TextStyle(color: Colors.white, fontSize: 18,letterSpacing: 1),)),
                          const SizedBox(
                            height: 10,
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
              ],
            ),
          ),
        ),
      ),
    );

  }
}

showAlertDialog(BuildContext context) {

  Widget continueButton = TextButton(
    child: const Text("OK"),
    onPressed:  () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Signed Up"),
    content: const Text("Your Account has been created"),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


showAlertDialogForError(BuildContext context) {

  Widget continueButton = TextButton(
    child: const Text("OK"),
    onPressed:  () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Error"),
    content: const Text("This Account cannot be created"),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}