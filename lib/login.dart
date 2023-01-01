// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:flutter_signin_button/button_view.dart';
// import 'package:google_keep_clone_application_1/home.dart';
// import 'package:google_keep_clone_application_1/services/auth.dart';
// import 'package:google_keep_clone_application_1/services/firestore_db.dart';
// import 'package:google_keep_clone_application_1/services/login_info.dart';
// import '';
// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key? key}) : super(key: key);
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final FirebaseAuth _auth=FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sign In"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [SignInButton(
//             Buttons.Google, 
//             onPressed: () async{
//               await signInWithGoogle();
//               final User? currentUser = await _auth.currentUser;
//                LocalDataSaver.saveLoginData(true);
//                LocalDataSaver.saveImg(currentUser!.photoURL.toString());
//                LocalDataSaver.saveMail(currentUser.email.toString());
//                LocalDataSaver.saveName(currentUser.displayName.toString());
//                await FireDB().getAllStoredNotes();
//               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home( )));
//             }
//             )],
//         ),
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_keep_clone_application_1/home.dart';
import 'package:google_keep_clone_application_1/services/auth.dart';
import 'package:google_keep_clone_application_1/services/firestore_db.dart';
import 'package:google_keep_clone_application_1/services/login_info.dart';
class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login To App"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(Buttons.Google, onPressed:() async{
              await  signInWithGoogle();
               final User? currentUser = await _auth.currentUser;
               LocalDataSaver.saveLoginData(true);
               LocalDataSaver.saveImg(currentUser!.photoURL.toString());
               LocalDataSaver.saveMail(currentUser.email.toString());
               LocalDataSaver.saveName(currentUser.displayName.toString());
               LocalDataSaver.saveSyncSet(false);
               await FireDB().getAllStoredNotes();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
            })
          ],
        ),
      ),
    );

  }
}