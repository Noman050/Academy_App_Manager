// ignore_for_file: library_private_types_in_public_api
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Widgets/authentication.dart';

class Classes extends StatefulWidget {
  const Classes({super.key});

  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {

  TextEditingController classname = TextEditingController();
  TextEditingController fee = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classes'),
        backgroundColor: Colors.blue[800],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('classes').snapshots(),
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
            title: const Text('Enter name of new class',style: TextStyle(fontSize: 20,color: Colors.deepPurple),),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: classname,
                    textInputAction: TextInputAction.go,

                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  TextField(
                    controller: fee,
                    textInputAction: TextInputAction.go,

                    decoration: const InputDecoration(hintText: "Fee per Subject"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  final uid=AuthenticationHelper().getID();
                  FirebaseFirestore.instance.collection("manager").doc(uid).collection('classes').add({'name': classname.text,'fee':fee.text});
                },
              ),
            ],
          ));
        },
        tooltip: 'Add Class',
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
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,  // red as border color
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                'Assets/images/class.jpg',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          snapshot.docs[index]['name'],
                          style:
                          TextStyle(fontSize: 25, color: Colors.blue[900]),
                        ),
                      ],
                    ),

                    const SizedBox(
                      width: 30,
                    ),

                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,

                          child: IconButton(
                            onPressed: () async{
                              var ref=FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('classes').doc(docid);
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
                                title: const Text('Enter new name of class',style: TextStyle(fontSize: 20,color: Colors.deepPurple)),
                                content: TextField(
                                  controller: updatee,
                                  textInputAction: TextInputAction.go,

                                  decoration: const InputDecoration(hintText: "Name"),
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      FirebaseFirestore.instance.collection('manager').doc(AuthenticationHelper().getID()).collection('classes').doc(docid).update({
                                        'name':updatee.text,
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
                  ]))),
    );
  }
}