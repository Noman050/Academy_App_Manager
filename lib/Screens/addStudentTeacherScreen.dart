// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manager_app/Screens/studentsScreen.dart';
import '../Widgets/authentication.dart';

class AddStudentTeacher extends StatefulWidget {
  const AddStudentTeacher({Key? key, this.classname, this.name, this.email, this.phone, this.password, this.subjects,
    this.image, this.s1, this.s2, this.s3, this.s4, this.s5, this.s6, this.s7, this.s8,


  }) :super(key: key);
  final classname;
  final name;
  final email;
  final phone;
  final  password;
  final subjects;
  final image;
  final s1;
  final s2;
  final s3;
  final s4;
  final s5;
  final s6;
  final s7;
  final s8;

  @override
  _AddStudentTeacherState createState() => _AddStudentTeacherState();
}

class _AddStudentTeacherState extends State<AddStudentTeacher> {
  String imageUrl = "https://firebasestorage.googleapis.com/v0/b/academia-39c5c.appspot.com/o/test%2Fstudent.jpg?alt=media&token=7f5610b2-bdc8-4b71-b099-3bdbddd7f3d3";




  var key1 = GlobalKey();
  late String classname = widget.classname;
  late String name = widget.name;
  late String email = widget.email;
  late String phone = widget.phone;
  late String password = widget.password;
  late String subjects = widget.subjects;
  late String s1name = widget.s1;
  late String s2name = widget.s2;
  late String s3name = widget.s3;
  late String s4name = widget.s4;
  late String s5name = widget.s5;
  late String s6name = widget.s6;
  late String s7name = widget.s7;
  late String s8name = widget.s8;

  late String image = widget.image;

  String s1 = "Null";
  String s2 = "Null";
  String s3 = "Null";
  String s4 = "Null";
  String s5 = "Null";
  String s6 = "Null";
  String s7 = "Null";
  String s8 = "Null";


  Future<void> addData(
      name,
      email,
      phone,
      password,
      subjects
      ) async {

      final uid = AuthenticationHelper().getID();


      FirebaseFirestore.instance
          .collection("manager")
          .doc(uid)
          .collection('students')
          .add({
        "class":classname,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "subjects": subjects,
        "image" : image,
        "s1":s1name,
        "s2":s2name,
        "s3":s3name,
        "s4":s4name,
        "s5":s5name,
        "s6":s6name,
        "s7":s7name,
        "s8":s8name,

        "t1":s1,
        "t2":s2,
        "t3":s3,
        "t4":s4,
        "t5":s5,
        "t6":s6,
        "t7":s7,
        "t8":s8,


        "jan":"Not Payed",
        "feb":"Not Payed",
        "mar":"Not Payed",
        "apr":"Not Payed",
        "may":"Not Payed",
        "jun":"Not Payed",
        "jul":"Not Payed",
        "aug":"Not Payed",
        "sep":"Not Payed",
        "oct":"Not Payed",
        "nov":"Not Payed",
        "dec":"Not Payed",



      });

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Done"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Students(),
                      ),
                          (route) => false,
                    );


                  },
                  child: const Text("Ok"))
            ],
            content:
            const Text("Student Information Added"),
          ));





  }
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: AppBar(
        title:const Text('Add Student'),
      ),

      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 60,
                child: ClipOval(
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: (image != null)
                          ? Image.network(image)
                          : null,

                    )
                ),

              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text('Name :',style: TextStyle(fontSize: 16,color:Colors.blue[900]),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 20, 0),
                    child: Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text('Class :',style: TextStyle(fontSize: 16,color:Colors.blue[900]),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 20, 0),
                    child: Text(classname,style: TextStyle(fontSize: 18,color:Colors.blue[700]),),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text('Email :',style: TextStyle(fontSize: 16,color:Colors.blue[900]),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 20, 0),
                    child: Text(email,style: TextStyle(fontSize: 13,color:Colors.blue[700])),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text('Phone # :',style: TextStyle(fontSize: 15,color:Colors.blue[900]),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 20, 0),
                    child: Text(phone,style: TextStyle(fontSize: 18,color:Colors.blue[700])),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text('Password :',style: TextStyle(fontSize: 16,color:Colors.blue[900]),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 20, 0),
                    child: Text(password,style: TextStyle(fontSize: 18,color:Colors.blue[700])),
                  )
                ],
              ),



              const Divider(thickness: 1,),
              SizedBox(
                height: 50,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers')
                      .where('subject', whereIn: [s1name,'null']).
                  snapshots(),


                  builder: (context, AsyncSnapshot snapshot) {

                    DocumentSnapshot snap= snapshot.data.docs[0];

                    if (snapshot.data!.docs.length == 1) {
                      snap = snapshot.data.docs[0];
                    } else
                    {
                      snap = snapshot.data.docs[1];
                    }

                      s1 = snap['name'].toString();

                    return ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Subject 1:  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                                Text(s1name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                              ],
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Automatically Assigned Teacher: ',style: TextStyle(fontSize: 12,color:Colors.blue[600]),),
                            Text(s1,style: TextStyle(fontSize: 14,color:Colors.blue[900],fontWeight: FontWeight.w900),),
                          ],
                        )

                      ],
                    );
                  },
                ),
              ),

              const Divider(thickness: 1,),
              SizedBox(
                height: 60,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers')
                      .where("subject", whereIn: [s2name, 'null']).
                  snapshots(),


                  builder: (context, AsyncSnapshot snapshot) {



                    DocumentSnapshot snap= snapshot.data.docs[0];

                    if (snapshot.data!.docs.length == 1) {
                      snap = snapshot.data.docs[0];
                    } else
                    {
                      snap = snapshot.data.docs[1];
                    }
                    s2 = snap['name'].toString();




                    return ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Subject 2:  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                                Text(s2name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                              ],
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Automatically Assigned Teacher: ',style: TextStyle(fontSize: 12,color:Colors.blue[600]),),
                            Text(s2,style: TextStyle(fontSize: 14,color:Colors.blue[900],fontWeight: FontWeight.w900),),
                          ],
                        )

                      ],



                    );
                  },
                ),
              ),

              const Divider(thickness: 1,),
              SizedBox(
                height: 60,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers')
                      .where("subject", whereIn: [s3name,'null']).
                  snapshots(),


                  builder: (context, AsyncSnapshot snapshot) {

                    DocumentSnapshot snap= snapshot.data.docs[0];

                    if (snapshot.data!.docs.length == 1) {
                      snap = snapshot.data.docs[0];
                    } else
                    {
                      snap = snapshot.data.docs[1];
                    }
                    s3 = snap['name'].toString();




                    return ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Subject 3:  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                                Text(s3name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                              ],
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Automatically Assigned Teacher: ',style: TextStyle(fontSize: 12,color:Colors.blue[600]),),
                            Text(s3,style: TextStyle(fontSize: 14,color:Colors.blue[900],fontWeight: FontWeight.w900),),
                          ],
                        )

                      ],



                    );
                  },
                ),
              ),

              const Divider(thickness: 1,),
              SizedBox(
                height: 50,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers')
                      .where("subject", whereIn: ['null', s4name]).
                  snapshots(),


                  builder: (context, AsyncSnapshot snapshot) {


                    DocumentSnapshot snap= snapshot.data.docs[0];
                    if (snapshot.data!.docs.length == 1) {
                      snap = snapshot.data.docs[0];
                    } else
                    {
                      snap = snapshot.data.docs[1];
                    }
                    s4 = snap['name'].toString();



                    return ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Subject 4:  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                                Text(s4name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                              ],
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Automatically Assigned Teacher: ',style: TextStyle(fontSize: 12,color:Colors.blue[600]),),
                            Text(s4,style: TextStyle(fontSize: 14,color:Colors.blue[900],fontWeight: FontWeight.w900),),
                          ],
                        )

                      ],



                    );
                  },
                ),
              ),

              const Divider(thickness: 1,),
              SizedBox(
                height: 50,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers')
                      .where("subject", whereIn: ['null', s5name]).
                  snapshots(),


                  builder: (context, AsyncSnapshot snapshot) {


                    DocumentSnapshot snap= snapshot.data.docs[0];
                    if (snapshot.data!.docs.length == 1) {
                      snap = snapshot.data.docs[0];
                    } else
                    {
                      snap = snapshot.data.docs[1];
                    }
                    s5 = snap['name'].toString();




                    return ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Subject 5:  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                                Text(s5name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                              ],
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Automatically Assigned Teacher: ',style: TextStyle(fontSize: 12,color:Colors.blue[600]),),
                            Text(s5,style: TextStyle(fontSize: 14,color:Colors.blue[900],fontWeight: FontWeight.w900),),
                          ],
                        )

                      ],



                    );
                  },
                ),
              ),

              const Divider(thickness: 1,),
              SizedBox(
                height: 50,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers')
                      .where("subject", whereIn: ['null', s6name]).
                  snapshots(),


                  builder: (context, AsyncSnapshot snapshot) {

                    DocumentSnapshot snap= snapshot.data.docs[0];
                    if (snapshot.data!.docs.length == 1) {
                      snap = snapshot.data.docs[0];
                    } else
                    {
                      snap = snapshot.data.docs[1];
                    }
                    s6 = snap['name'].toString();



                    return ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Subject 6:  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                                Text(s6name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                              ],
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Automatically Assigned Teacher: ',style: TextStyle(fontSize: 12,color:Colors.blue[600]),),
                            Text(s6,style: TextStyle(fontSize: 14,color:Colors.blue[900],fontWeight: FontWeight.w900),),
                          ],
                        )

                      ],



                    );
                  },
                ),
              ),

              const Divider(thickness: 1,),
              SizedBox(
                height: 50,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers')
                      .where("subject", whereIn: ['null', s7name]).
                  snapshots(),


                  builder: (context, AsyncSnapshot snapshot) {


                    DocumentSnapshot snap= snapshot.data.docs[0];
                    if (snapshot.data!.docs.length == 1) {
                      snap = snapshot.data.docs[0];
                    } else
                    {
                      snap = snapshot.data.docs[1];
                    }
                    s7 = snap['name'].toString();



                    return ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Subject 7:  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                                Text(s7name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                              ],
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Automatically Assigned Teacher: ',style: TextStyle(fontSize: 12,color:Colors.blue[600]),),
                            Text(s7,style: TextStyle(fontSize: 14,color:Colors.blue[900],fontWeight: FontWeight.w900),),
                          ],
                        )

                      ],



                    );
                  },
                ),
              ),

              const Divider(thickness: 1,),
              SizedBox(
                height: 50,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers')
                      .where("subject", whereIn: [s8name, 'null']).
                  snapshots(),


                  builder: (context, AsyncSnapshot snapshot) {


                    DocumentSnapshot snap= snapshot.data.docs[0];
                    if (snapshot.data!.docs.length == 1) {
                      snap = snapshot.data.docs[0];
                    } else
                    {
                      snap = snapshot.data.docs[1];
                    }
                    s8 = snap['name'].toString();




                    return ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Subject 8:  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                                Text(s8name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,color:Colors.blue[900]),),
                              ],
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Automatically Assigned Teacher: ',style: TextStyle(fontSize: 12,color:Colors.blue[600]),),
                            Text(s8,style: TextStyle(fontSize: 14,color:Colors.blue[900],fontWeight: FontWeight.w900),),
                          ],
                        )

                      ],



                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                    addData(
                        name,
                        email,
                        phone,
                        password,
                        subjects
                    );
                    // print("ok"),
                },
                child: const Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}