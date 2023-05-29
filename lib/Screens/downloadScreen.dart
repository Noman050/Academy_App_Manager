// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:manager_app/Screens/studentContactScreen.dart';
import 'package:manager_app/Screens/studentDownloadFeeScreen.dart';
import 'package:manager_app/Widgets/teacher_personal_Pdfservices.dart';
import 'package:manager_app/Widgets/teacher_sub_class_Pdfservices.dart';
import '../Widgets/authentication.dart';
import 'studentPersonalScreen.dart';
import '../Widgets/teacher_contact_Pdfservices.dart';
import 'studentSubScreen.dart';

class DownLoad extends StatefulWidget {
  const DownLoad({Key? key}) : super(key: key);

  @override
  _DownLoadState createState() => _DownLoadState();
}

class _DownLoadState extends State<DownLoad> {

  List teacherContatctData = [];
  getteachercontact() async {
    await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers').
    where('name', isNotEqualTo: 'No Teacher').get().then((value) {
      for(var i in value.docs) {
        teacherContatctData.add(i.data());
      }
    });
  }
  final teacher_contact_Pdfservices _pdfservices_teachercontact=teacher_contact_Pdfservices();
  List teacherPersonalData = [];
  getteacherpersonal() async {
    await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers').
    where('name', isNotEqualTo: 'No Teacher').get().then((value) {
      for(var i in value.docs) {
        teacherPersonalData.add(i.data());
      }
    });
  }
  final teacher_personal_Pdfservices _pdfservices_teacherpersonal=teacher_personal_Pdfservices();

  List teacherSubClassData = [];
  getTeacherSubClass() async {
    await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('teachers').
    where('name', isNotEqualTo: 'No Teacher').get().then((value) {
      for(var i in value.docs) {
        teacherSubClassData.add(i.data());
      }
    });
  }
  final teacher_sub_class_Pdfservices _pdfservices_teacher_sub_class=teacher_sub_class_Pdfservices ();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Download & Print"),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,


            children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StudentFee()));

                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Student Fee',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,

                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(100.0),
                            child: SizedBox(
                              height: 50.0,
                              width: 50.0,
                              child: ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'Assets/images/download.png',
                                  ),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {

                    await getteachercontact();
                    final data=await _pdfservices_teachercontact.createPdf(teacherContatctData);
                    _pdfservices_teachercontact.saveAndLanchFile(data, "Teacher_class_&_subjeect.pdf");
                    teacherContatctData.clear();

                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Teachers Contacts',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,

                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(100.0),
                            child: SizedBox(
                              height: 50.0,
                              width: 50.0,
                              child: ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'Assets/images/download.png',
                                  ),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StudentContact()));

                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Students Contacts',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,

                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(100.0),
                            child: SizedBox(
                              height: 50.0,
                              width: 50.0,
                              child: ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'Assets/images/download.png',
                                  ),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {

                    await getteacherpersonal();
                    final data=await _pdfservices_teacherpersonal.createPdf(teacherPersonalData);
                    _pdfservices_teacherpersonal.saveAndLanchFile(data, "Teacher_Personal_Info.pdf");
                    teacherPersonalData.clear();

                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Teachers Details',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,

                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(100.0),
                            child: SizedBox(
                              height: 50.0,
                              width: 50.0,
                              child: ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'Assets/images/download.png',
                                  ),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StudentPersonal()));

                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Student Details',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,

                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(100.0),
                            child: SizedBox(
                              height: 50.0,
                              width: 50.0,
                              child: ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'Assets/images/download.png',
                                  ),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () async {


                    await getTeacherSubClass();
                    final data=await _pdfservices_teacher_sub_class.createPdf(teacherSubClassData);
                    _pdfservices_teacher_sub_class.saveAndLanchFile(data, "teachers_subject_&_class.pdf");
                    teacherContatctData.clear();

                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: [
                            Center(
                              child: Text(
                                'Teachers Class',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,

                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                '& Subjects',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,

                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(100.0),
                            child: SizedBox(
                              height: 50.0,
                              width: 50.0,
                              child: ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'Assets/images/download.png',
                                  ),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StudentSub()));
                  },
                  child: Material(
                    color: Colors.teal[300],
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: [
                            Center(
                              child: Text(
                                'Students Subjects',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,

                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Classwise',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(100.0),
                            child: SizedBox(
                              height: 50.0,
                              width: 50.0,
                              child: ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'Assets/images/download.png',
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}