import 'package:flutter/material.dart';
import 'feeScreen.dart';
import '../Widgets/authentication.dart';
import '../Widgets/check.dart';
import 'classesScreen.dart';
import 'downloadScreen.dart';
import 'notificationsScreen.dart';
import 'studentsScreen.dart';
import 'subjectsScreen.dart';
import 'teachersScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SafeArea(
          child:Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Home Screen')),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                      icon: const Icon(Icons.exit_to_app),
                      label: const Text('Log Out',style: TextStyle(fontSize: 15),),
                      onPressed:(){
                        AuthenticationHelper().signOut(context);

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Check()));
                      }
                  ),
                )
              ],
            ),
            body:
            SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const Teachers()));
                        },
                        child: Material(
                          color: Colors.teal[300],
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              const Center(
                                child: Text(
                                  'Teachers',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: const SizedBox(
                                    // changing from 200 to 150 as to look better
                                    height: 120.0,
                                    width: 120.0,
                                    child: ClipOval(
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'Assets/images/teacher.jpg',
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
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const Students()));
                        },
                        child: Material(
                          color: Colors.blue[300],
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              const Center(
                                child: Text(
                                  'Students',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: const SizedBox(
                                    // changing from 200 to 150 as to look better
                                    height: 120.0,
                                    width: 120.0,
                                    child: ClipOval(
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'Assets/images/student.jpg',
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
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const Classes()));
                        },
                        child: Material(
                          color: Colors.red[300],
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              const Center(
                                child: Text(
                                  'Classes',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: const SizedBox(
                                    // changing from 200 to 150 as to look better
                                    height: 120.0,
                                    width: 120.0,
                                    child: ClipOval(
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'Assets/images/class.jpg',
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
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const SubjectsScreen()));
                        },
                        child: Material(
                          color: Colors.brown[400],
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              const Center(
                                child: Text(
                                  'Subjects',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: const SizedBox(
                                    // changing from 200 to 150 as to look better
                                    height: 120.0,
                                    width: 120.0,
                                    child: ClipOval(
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'Assets/images/book.jpg',
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
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const Fee()));
                        },
                        child: Material(
                          color: Colors.blueGrey[600],
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              const Center(
                                child: Text(
                                  'Fees',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: const SizedBox(
                                    // changing from 200 to 150 as to look better
                                    height: 120.0,
                                    width: 120.0,
                                    child: ClipOval(
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'Assets/images/fee.jpg',
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
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const DownLoad()));
                        },
                        child: Material(
                          color: Colors.deepPurple[400],
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              const Center(
                                child: Text(
                                  'Download & Print',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                ),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: const SizedBox(
                                    // changing from 200 to 150 as to look better
                                    height: 120.0,
                                    width: 120.0,
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
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const NotificationsScreen()));
                        },
                        child: Material(
                          color: Colors.white,
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.pink,
                                  width: 2
                                ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                const Center(
                                  child: Text(
                                    'Notifications',style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.pink,

                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                  ),
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: const SizedBox(
                                      // changing from 200 to 150 as to look better
                                      height: 120.0,
                                      width: 120.0,
                                      child: ClipOval(
                                        child: Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            'Assets/images/notification.png',
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
                    ),


                  ],
                ),
              ),
            ),
          )
      ),
    );

  }
}