import 'package:flutter/material.dart';
import 'package:google_keep_clone_application_1/colors.dart';
import 'package:google_keep_clone_application_1/services/login_info.dart';

class Settings extends StatefulWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late bool? value ;
  getSyncSet()async{
    LocalDataSaver.getSyncSet().then((valueDB) {
      setState(() {
        value=valueDB;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getSyncSet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(backgroundColor: bgcolor,
      elevation: 0.0,
      title : Text("Settings")
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
        Row(children: [
          Text("Sync" ,style: TextStyle(color: Colors.white , fontSize: 18),),
          Spacer(),
          Transform.scale(scale: 1.3,
          child : Switch.adaptive(value: value!, onChanged: (switchValue) {
            setState(() {
              
            this.value = switchValue;
            LocalDataSaver.saveSyncSet(switchValue);
            });
          }),)
        ],)
      ],),),
    );
  }
}