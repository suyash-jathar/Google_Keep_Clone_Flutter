import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_keep_clone_application_1/home.dart';
import 'package:google_keep_clone_application_1/services/auth.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SignInButton(
            Buttons.Google, 
            onPressed: () async{
              await signInWithGoogle();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home( )));
            }
            )],
        ),
      ),
    );
  }
}
