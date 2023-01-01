// import 'package:flutter/material.dart';
// import 'package:google_keep_clone_application_1/services/db.dart';
// import './colors.dart';
// import 'home.dart';
// import 'model/MyNoteModel.dart';
// class CreateNoteView extends StatefulWidget {
//   const CreateNoteView({Key? key}) : super(key: key);

//   State<CreateNoteView> createState() => _CreateNoteViewState();
// }

// class _CreateNoteViewState extends State<CreateNoteView> {
//   TextEditingController title=TextEditingController();
//   TextEditingController content=TextEditingController();
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     title.dispose();
//     content.dispose();
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bgcolor,
//       appBar: AppBar(
//         backgroundColor: bgcolor,
//         elevation: 0.0,
//         actions: [
//           IconButton(
//               splashRadius: 18,
//               onPressed: () async{
//                 await NotesDatabase.instance.InsertEntry(Note(title:title.text, content:content.text, createdTime: DateTime.now(), pin: false,isArchieve: false));
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
//               },
//               icon: Icon(Icons.save_outlined))
//         ],
//       ),
//       body: Container(
//           margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           child: Column(
//             children: [
//               TextField(
//                 cursorColor: white,
//                 controller: title,
//                 style: TextStyle(fontSize: 25, color: white),
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     disabledBorder: InputBorder.none,
//                     hintText: "Title",
//                     hintStyle: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey.withOpacity(0.8))),
//               ),
//               Container(
//                   height: 300,
//                   child: TextField(
//                     controller: content,
//                     keyboardType: TextInputType.multiline,
//                     minLines: 50,
//                     maxLines: null,
//                     cursorColor: white,
//                     style: TextStyle(fontSize: 17, color: white),
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         enabledBorder: InputBorder.none,
//                         errorBorder: InputBorder.none,
//                         disabledBorder: InputBorder.none,
//                         hintText: "Note ..",
//                         hintStyle: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey.withOpacity(0.8))),
//                   )),
//             ],
//           )),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_keep_clone_application_1/colors.dart';
import 'package:google_keep_clone_application_1/services/db.dart';
import 'package:uuid/uuid.dart';

import 'home.dart';
import 'model/MyNoteModel.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({ Key? key }) : super(key: key);

  _CreateNoteViewState createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  TextEditingController title = new TextEditingController();
  TextEditingController content = new TextEditingController();
  var uuid = Uuid();

  void dispose() {
    super.dispose();
    title.dispose();
    content.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
         elevation: 0.0,
         actions: [
           IconButton(
             splashRadius: 17,
             onPressed: () async{
               await NotesDatabse.instance.InsertEntry(Note(title : title.text , content : content.text ,uniqueID: uuid.v1(), pin : false,isArchieve: false, createdTime: DateTime.now()));
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
             }, 
           icon: Icon(Icons.save_outlined))
         ],
          ),

          body: 
          Container(
            margin : EdgeInsets.symmetric(horizontal : 15 ,vertical: 10),
          child: Column(
            children: [
              TextField(
                cursorColor: white,
                controller: title,
                style: TextStyle(fontSize: 25, color: Colors.white , fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.8))),
              ),
              Container(
                height: 300,
                child: TextField(
                  cursorColor: white,
                  controller: content,
                  keyboardType:  TextInputType.multiline,
                   minLines: 50,
                maxLines: null,
                  style: TextStyle(fontSize: 17, color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Note",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.withOpacity(0.8))),
                ),
              )
              
            ],
          ),),
      
    );
  }
}