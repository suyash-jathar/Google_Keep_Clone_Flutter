import 'package:flutter/material.dart';
import 'package:google_keep_clone_application_1/login.dart';
import 'services/login_info.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  bool isLogIn = false;

  getLoggedInState() async{
    
    await LocalDataSaver.getLogData().then((value){
 
      setState(() {
          isLogIn = value.toString() == "null";
      });
    });
  }

  @override
  void initState() {
    
    super.initState();
        getLoggedInState();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLogIn ? Login(): Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
