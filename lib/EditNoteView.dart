// import 'package:flutter/material.dart';
// import 'package:google_keep_clone_application_1/NoteView.dart';
// import 'package:google_keep_clone_application_1/services/db.dart';
// import './colors.dart';
// import 'home.dart';
// import 'model/MyNoteModel.dart';

// class EditNoteView extends StatefulWidget {
//   Note note;
//   EditNoteView({required this.note});

//   @override
//   State<EditNoteView> createState() => _EditNoteViewState();
// }

// class _EditNoteViewState extends State<EditNoteView> {
//   late String editableTitle;
//   late String editableContent;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     editableTitle=widget.note.title.toString();
//     editableContent=widget.note.content.toString();
//   }

//   @override
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
//                  Note newNote=Note(content: editableContent,title: editableTitle,pin: widget.note.pin  ,createdTime: widget.note.createdTime,isArchieve: widget.note.isArchieve,id: widget.note.id);
//                  await NotesDatabase.instance.updateNotes(newNote);
//                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));

//               },
//               icon: Icon(Icons.save_outlined))
//         ],
//       ),
//       body: Container(
//           margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           child: Column(
//             children: [
//               Form(
//                 child: TextFormField(
//                   initialValue: editableTitle,
//                   cursorColor: white,
//                   onChanged: (value) => editableTitle=value,
//                   style: TextStyle(fontSize: 25, color: white),
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       enabledBorder: InputBorder.none,
//                       errorBorder: InputBorder.none,
//                       disabledBorder: InputBorder.none,
//                       hintText: "Title",
//                       hintStyle: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey.withOpacity(0.8))),
//                 ),
//               ),
//               Container(
//                   height: 300,
//                   child: Form(
//                     child: TextFormField(
//                       initialValue: editableContent,
//                       keyboardType: TextInputType.multiline,
//                       minLines: 50,
//                       maxLines: null,
//                       cursorColor: white,
//                       onChanged: (value) => editableContent=value,
//                       style: TextStyle(fontSize: 17, color: white),
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                           enabledBorder: InputBorder.none,
//                           errorBorder: InputBorder.none,
//                           disabledBorder: InputBorder.none,
//                           hintText: "Note..",
//                           hintStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey.withOpacity(0.8))),
//                     ),
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

import 'NoteView.dart';
import 'home.dart';
import 'model/MyNoteModel.dart';

class EditNoteView extends StatefulWidget {
  Note? note;
 EditNoteView({required this.note} );

  @override
  _EditNoteViewState createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late String  NewTitle ;
  late String NewNoteDet ;
  var uuid = Uuid();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.NewTitle = widget.note!.title.toString();
    this.NewNoteDet = widget.note!.content.toString();
  }
  @override
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
               Note newNote = Note(content: NewNoteDet ,uniqueID: widget.note!.uniqueID, title: NewTitle , createdTime:  widget.note!.createdTime,isArchieve: widget.note!.isArchieve, pin: widget.note!.pin , id: widget.note!.id);
               await NotesDatabse.instance.updateNote(newNote);
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
              Form(
                  child:       TextFormField(
                    initialValue: NewTitle,
                cursorColor: white,
                onChanged: (value){
                  NewTitle = value;
                },
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
              ),
   
              Container(
                height: 300,
                child: Form(
                  child: TextFormField(
                    onChanged: (value){
                      NewNoteDet = value;
                    },
                    initialValue: NewNoteDet,
                  cursorColor: white,
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
              )
              
            ],
          ),),
      
    );
  }
}