// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Widgets/authentication.dart';
import 'dart:async';
import 'package:intl/intl.dart';



class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  TextEditingController note = TextEditingController();
  String _timeString='0';

  String date = "";
  DateTime selectedDate = DateTime.now();
  late String ntime;
  late String ndate;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime =
    DateFormat('kk:mm:ss').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
      // print(_timeString);
    });
  }

  TimeOfDay notificationtime = TimeOfDay.now();

  void _selectnotificationTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: notificationtime,
    );
    if (newTime != null) {
      setState(() {
        notificationtime = newTime;
        ntime = notificationtime.toString();
        ntime = ntime.substring(11,15);
      });
    }
  }
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;

        ndate = selectedDate.toString();
        ndate = ndate.substring(0,10);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blue[800],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('notifications').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
            child: CircularProgressIndicator(),);
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

      floatingActionButton: FloatingActionButton(
        onPressed: () async{

          await showDialog(context: context, builder: (context)=> AlertDialog(
            title: const Center(child: Text('Add Notification',style: TextStyle(fontSize: 20,color: Colors.deepPurple),)),
            content: SingleChildScrollView(
              child: Column(
                children: [


                  ElevatedButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: const Text('Select Date')
                    // Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent[400],
                    ),
                    onPressed: _selectnotificationTime,
                    child: const Text('Select Time')
                    // Text(' ${notificationtime.format(context)}'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Text('Write Notification',style: TextStyle(fontSize: 15,color: Colors.blue[900],fontWeight: FontWeight.w900),),
                  TextField(
                    controller: note,
                    textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,

                    decoration: const InputDecoration(),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  final uid=AuthenticationHelper().getID();
                  FirebaseFirestore.instance.collection("manager").doc(uid).collection('notifications').add({'note': note.text,'time':ntime,'date':ndate});
                  note.clear();
                },
              ),
            ],
          ));
        },
        tooltip: 'Add Notification',
        child: const Icon(Icons.add),
      ),
    );
  }
}
class CardList extends StatelessWidget {
  const CardList({super.key, required this.snapshot,required this.index});
  final QuerySnapshot snapshot;
  final int index;


  @override
  Widget build(BuildContext context) {
    var docid=snapshot.docs[index].id;
    TextEditingController updatee = TextEditingController();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 50,
      shadowColor: Colors.blue[800],
      color: Colors.white,
      child: Container(
          height: 280,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,  // red as border color
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 50.0,
                        width: 50.0,
                        child: ClipOval(
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'Assets/images/notification.png',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        snapshot.docs[index]['time'],
                        style:
                        TextStyle(fontSize: 15, color: Colors.pink[900]),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        snapshot.docs[index]['date'],
                        style:
                        TextStyle(fontSize: 15, color: Colors.pink[900]),
                      ),
                    ],
                  ),

                  const SizedBox(
                    width: 30,
                  ),
                  Text('Notification',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.blue[900]),),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                            child: Text(
                              snapshot.docs[index]['note'],
                              style:
                              TextStyle(fontSize: 15, color: Colors.blue[500]),
                            ),

                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,

                        child: IconButton(
                          onPressed: () async{
                            var ref=FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('notifications').doc(docid);
                            ref.delete();
                          },
                          icon: const Icon(FontAwesomeIcons.trashCanArrowUp),
                          color: Colors.redAccent[700],
                          //cart+ icon from FontAwesome
                        ),

                      ),
                      SizedBox(
                        height: 50,
                        width: 50,

                        child:
                        IconButton(
                          onPressed:
                              () async{
                            await showDialog(context: context, builder: (context)=> AlertDialog(
                              title: const Text('Enter updated notification',style: TextStyle(fontSize: 20,color: Colors.deepPurple)),
                              content: TextField(
                                controller: updatee,
                                textInputAction: TextInputAction.go,

                                decoration: const InputDecoration(hintText: "Name"),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('notifications').doc(docid).update({
                                      'note':updatee.text,
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ));
                          },
                          icon: const Icon(FontAwesomeIcons.penToSquare),
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}