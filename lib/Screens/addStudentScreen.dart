// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'addStudentTeacherScreen.dart';
import '../Widgets/authentication.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';


class AddStudent extends StatefulWidget {
  const AddStudent({Key? key,}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  String imageUrl = "https://firebasestorage.googleapis.com/v0/b/academia-39c5c.appspot.com/o/test%2Fstudent.jpg?alt=media&token=7f5610b2-bdc8-4b71-b099-3bdbddd7f3d3";

  File? image;
  var path;
  var file;


  final picker = ImagePicker();

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();

    final imagePicker = ImagePicker();
    String imageFile;


    var image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //Select Image
      image = await _picker.pickImage(source: ImageSource.gallery);
      var file = File(image!.path);

      if (image != null){
        //Upload to Firebase
        var snapshot = await _storage.ref()
            .child('student/').child(const Uuid().v1())
            .putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }
  var key1 = GlobalKey();
  String classname = "";
  String name = "";
  String email = "";
  String phone = "";
  String password = "";
  String subjects = "";
  String s1name = "null";
  String s2name = "null";
  String s3name = "null";
  String s4name = "null";
  String s5name = "null";
  String s6name = "null";
  String s7name = "null";
  String s8name = "null";

  String fee = "Not Payed";
  // String s9name = "";
  // String s10name = "";
  final cont1 = TextEditingController();
  final cont2 = TextEditingController();
  final cont3 = TextEditingController();
  final cont4 = TextEditingController();
  final cont5 = TextEditingController();

  TextEditingController tclassname = TextEditingController();
  TextEditingController tsubjectname = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var classvalue;
  var s1value;
  var s2value;
  var s3value;
  var s4value;
  var s5value;
  var s6value;
  var s7value;
  var s8value;

  var ss1;
  var ss2;
  var ss3;
  var ss4;
  var ss5;
  var ss6;
  var ss7;
  var ss8;
  // var s9value = null;
  // var s10value = null;
  var subcount = 0;
  Widget build_name() {
    return TextFormField(
      controller: cont1,
      decoration: const InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Name is Required";
        } else {
          if (!ValidateName(value!)) {
            return "Correct the name format, e.g., Noman Ali";
          }
        }
        return null;
      },
      onChanged: (newValue) => {
        setState(() => {name = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {name= newValue.toString()})
      },
    );
  }
  bool ValidateReg(String str) {
    bool flag = RegExp(r"^(FA|SP)[0-9][0-9]-(BCS|MCS|BSE)-[0-9][0-9][0-9]$")
        .hasMatch(str.toUpperCase());
    return flag;
  }

  // bool ValidateGitID(String str) {
  //   bool flag = RegExp(r"[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38}$")
  //       .hasMatch(str.toUpperCase());
  //   return flag;
  // }
  bool ValidateName(String str) {
    bool flag = RegExp(r"^([a-zA-Z',.-]+( [a-zA-Z',.-]+)*){1,30}")
        .hasMatch(str.toUpperCase());
    return flag;
  }
  Widget build_email() {
    return TextFormField(
      controller: cont2,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Email is required.";
        }
      },
      onChanged: (newValue) => {
        setState(() => {email = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {email= newValue.toString()})
      },
    );
  }
  Widget build_phone() {
    return TextFormField(
      controller: cont3,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Phone #',
        hintText: 'i.e 03088648424',
      ),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Phone number is required.";
        }
        return null;
      },
      onChanged: (newValue) => {
        setState(() => {phone = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {phone = newValue.toString()})
      },
    );
  }
  Widget build_password() {
    return TextFormField(
      controller: cont4,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: '*******',
      ),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Password is required.";
        }
        return null;
      },
      onChanged: (newValue) => {
        setState(() => {password = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {password = newValue.toString()})
      },
    );
  }
  Widget build_subject() {
    return TextFormField(
      controller: cont5,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Number of Subjects',
      ),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Number of subjects is required";
        }
        return null;
      },
      onChanged: (newValue) => {
        setState(() => {subjects = newValue.toString()})
      },
      onSaved: (newValue) => {
        setState(() => {subjects = newValue.toString()})
      },
    );
  }
  Future<void> addData(
      name,
      email,
      phone,
      password,
      subjects
      ) async {
    if (classvalue == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Select Class & Subject'),
      ));
    } else {
      final uid = AuthenticationHelper().getID();
      //
      // FirebaseFirestore.instance
      //     .collection("manager")
      //     .doc(uid)
      //     .collection('students')
      //     .add({
      //   "class":classname,
      //   "name": name,
      //   "email": email,
      //   "phone": phone,
      //   "password": password,
      //   "subjects": subjects,
      //   "image" : imageUrl,
      //   "s1":s1name,
      //   "s2":s2name,
      //   "s3":s3name,
      //   "s4":s4name,
      //   "s5":s5name,
      //   "s6":s6name,
      //   "s7":s7name,
      //   "s8":s8name,
      //
      //   "jan":"Not Payed",
      //   "feb":"Not Payed",
      //   "mar":"Not Payed",
      //   "apr":"Not Payed",
      //   "may":"Not Payed",
      //   "jun":"Not Payed",
      //   "jul":"Not Payed",
      //   "aug":"Not Payed",
      //   "sep":"Not Payed",
      //   "oct":"Not Payed",
      //   "nov":"Not Payed",
      //   "dec":"Not Payed",
      //
      //
      //
      // });
      //
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddStudentTeacher(
            classname:classname,
            name: name,
            email: email,
            phone: phone,
            password: password,
            subjects: subjects,
            image : imageUrl,
            s1:s1name,
            s2:s2name,
            s3:s3name,
            s4:s4name,
            s5:s5name,
            s6:s6name,
            s7:s7name,
            s8:s8name,

          )));
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Add Student'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(55))
                        ),
                        child:
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 50,
                          child: ClipOval(
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: (imageUrl != null)
                                    ? Image.network(imageUrl)
                                    : null,
                              )
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 120,
                        left: 120,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              color: Colors.teal[400]
                          ),
                          child: IconButton(
                            icon: const Icon(  Icons.camera_alt_rounded,size: 30,color: Colors.white,
                            ),
                            onPressed: () async{
                              uploadImage();
                            },
                          ),
                        )
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    build_name(),
                    build_email(),
                    build_phone(),
                    build_password(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Select Class'),
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('classes').snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return SnackBar(
                          content: Text(snapshot.error.toString()));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    List<DropdownMenuItem<String>> classitems = [];
                    for (int i = 0; i < snapshot.data!.docs.length; i++) {
                      DocumentSnapshot snap = snapshot.data.docs[i];
                      if (!classitems.contains(snap.id)) {
                        classitems.add(DropdownMenuItem(
                          value: snap.id.toString(),
                          child: SizedBox(
                              width: 400, child: Text(snap['name'])),
                        ));
                      }
                    }
                    return DropdownButtonFormField(
                      isExpanded: true,
                      value: classvalue,
                      key: key1,
                      items: classitems,
                      onChanged: (newValue) {
                        setState(() async{
                          classvalue = newValue.toString();
                          // print(classitems);
                          // print('***********************************************************');
                          DocumentSnapshot variable = await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('classes').doc(classvalue).get();
                          var clname=variable.get('name');
                          // print(clname.toString());
                          classname=clname.toString();
                          // print('ok');
                        });
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                build_subject(),
                const SizedBox(
                  height: 15,
                ),
                const Text('Select Subjects'),
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return SnackBar(
                          content: Text(snapshot.error.toString()));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    List<DropdownMenuItem<String>> subjectitems = [];
                    subcount = snapshot.data!.docs.length;
                    for (int i = 0; i < snapshot.data!.docs.length; i++) {
                      DocumentSnapshot snap = snapshot.data.docs[i];
                      if (!subjectitems.contains(snap.id)) {
                        subjectitems.add(DropdownMenuItem(
                          value: snap.id.toString(),
                          child: SizedBox(
                              width: 400, child: Text(snap['name'])),
                        ));
                      }
                    }
                    return Column(
                      children: [
                        Column(
                          children: [
                            DropdownButtonFormField2(
                              isExpanded: true,
                              value: s1value,
                              items: subjectitems,
                              onChanged: (newValue) {
                                setState(() async {
                                  ss1 = newValue.toString();
                                  //
                                  // print(subjectitems);
                                  // print('***********************************************************');
                                  // print(s1value);
                                  DocumentSnapshot variablee = await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').doc(ss1).get();
                                  var subname=variablee.get('name');
                                  // print(subname.toString());
                                  s1name=subname.toString();
                                  // print('ok');
                                });
                              },
                            ),
                            DropdownButtonFormField2(
                              isExpanded: true,
                              value: s2value,
                              items: subjectitems,
                              onChanged: (newValue) {
                                setState(() async {
                                  ss2 = newValue.toString();
                                  // print(subjectitems);
                                  // print('***********************************************************');
                                  // print(s2value);
                                  DocumentSnapshot variablee = await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').doc(ss2).get();
                                  var subname=variablee.get('name');
                                  // print(subname.toString());
                                  s2name=subname.toString();
                                  // print('ok');
                                });
                              },
                            ),
                            DropdownButtonFormField2(
                              isExpanded: true,
                              value: s3value,
                              items: subjectitems,
                              onChanged: (newValue) {
                                setState(() async {
                                  ss3 = newValue.toString();
                                  // print(subjectitems);
                                  // print('***********************************************************');
                                  // print(s3value);
                                  DocumentSnapshot variablee = await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').doc(ss3).get();
                                  var subname=variablee.get('name');
                                  // print(subname.toString());
                                  s3name=subname.toString();
                                  // print('ok');
                                });
                              },
                            ),
                            DropdownButtonFormField2(
                              isExpanded: true,
                              value: ss4,
                              items: subjectitems,
                              onChanged: (newValue) {
                                setState(() async {
                                  classvalue = newValue.toString();
                                  // print(subjectitems);
                                  // print('***********************************************************');
                                  // print(s4value);
                                  DocumentSnapshot variablee = await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').doc(ss4).get();
                                  var subname=variablee.get('name');
                                  // print(subname.toString());
                                  s4name=subname.toString();
                                  // print('ok');
                                });
                              },
                            ),
                            DropdownButtonFormField2(
                              isExpanded: true,
                              value: s5value,
                              items: subjectitems,
                              onChanged: (newValue) {
                                setState(() async {
                                  classvalue = newValue.toString();

                                  DocumentSnapshot variablee = await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').doc(ss5).get();
                                  var subname=variablee.get('name');
                                  s5name=subname.toString();
                                  // print('ok');
                                });
                              },
                            ),
                            DropdownButtonFormField2(
                              isExpanded: true,
                              value: ss6,
                              items: subjectitems,
                              onChanged: (newValue) {
                                setState(() async {
                                  classvalue = newValue.toString();

                                  DocumentSnapshot variablee = await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').doc(ss6).get();
                                  var subname=variablee.get('name');
                                  s6name=subname.toString();
                                  // print('ok');
                                });
                              },
                            ),
                            DropdownButtonFormField2(
                              isExpanded: true,
                              value: ss7,
                              items: subjectitems,
                              onChanged: (newValue) {
                                setState(() async {
                                  classvalue = newValue.toString();
                                  DocumentSnapshot variablee = await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').doc(ss7).get();
                                  var subname=variablee.get('name');
                                  s7name=subname.toString();
                                  // print('ok');
                                });
                              },
                            ),
                            DropdownButtonFormField2(
                              isExpanded: true,
                              value: ss8,
                              items: subjectitems,
                              onChanged: (newValue) {
                                setState(() async {
                                  classvalue = newValue.toString();
                                  DocumentSnapshot variablee = await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('subjects').doc(ss8).get();
                                  var subname=variablee.get('name');
                                  s8name=subname.toString();
                                  // print('ok');
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      addData(
                          name,
                          email,
                          phone,
                          password,
                          subjects
                      );
                      // print("ok");
                    } else {
                      print("something wrong");
                    }
                  },
                  child: const Center(
                    child: Text(
                      'Next',
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
      ),
    );
  }
}

























