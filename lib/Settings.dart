import 'package:flutter/material.dart';
import 'package:google_keep_clone_application_1/colors.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        elevation: 0.0,
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Row(children: [
          
          Text(" Sync ",style: TextStyle(color: white,fontSize: 25),),
          Spacer(),
          Transform.scale(scale:1.3),
          Switch.adaptive(value: value, onChanged: (switchValue){
            setState(() {
              this.value=switchValue;
            });
          })
        ]),
      ),
    );
  }
}
