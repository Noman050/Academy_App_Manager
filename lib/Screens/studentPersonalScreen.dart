// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Widgets/authentication.dart';
import '../Widgets/studentPersonalPdfservices.dart';

class StudentPersonal extends StatefulWidget {
  const StudentPersonal({super.key});

  @override
  _StudentPersonalState createState() => _StudentPersonalState();
}

class _StudentPersonalState extends State<StudentPersonal> {

  var name;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Click on any class'),
        backgroundColor: Colors.blue[800],
      ),
      body:
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('classes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  child: CardList(snapshot: snapshot.data,index: index),
                );
              });
        },
      ),

    );

  }

}


class CardList extends StatelessWidget {
  CardList({super.key, required this.snapshot,required this.index});
  final QuerySnapshot snapshot;
  final int index;

  var name;


  List pdfData = [];

  List studentPersonalData = [];
  getstudentpersonal() async {
    await FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('students').get().then((value) {
      for(var i in value.docs) {
        studentPersonalData.add(i.data());
      }
    });
  }
  final StudentPersonalPdfservices _pdfservices_studentpersonal=StudentPersonalPdfservices();


  @override
  Widget build(BuildContext context) {
    //var docid=snapshot.docs[index].id;
    name=snapshot.docs[index]['name'];

    //TextEditingController updatee = TextEditingController();
    return GestureDetector(
      onTap: ()async {


        await getstudentpersonal();
        final data=await _pdfservices_studentpersonal.createPdf(studentPersonalData);
        _pdfservices_studentpersonal.saveAndLanchFile(data, "Student_Personal_Info.pdf");
        studentPersonalData.clear();
      },
      child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,  // red as border color
              ),
              borderRadius: const BorderRadius.all(Radius.circular(2))),

          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    // changing from 200 to 150 as to look better
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

                  Text(
                    snapshot.docs[index]['name'],
                    style:
                    TextStyle(fontSize: 25, color:Colors.blue[900], fontWeight: FontWeight.w900),
                  ),
                ],
              ))),
    );
  }
}