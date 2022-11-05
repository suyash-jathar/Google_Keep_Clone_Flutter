import 'package:google_keep_clone_application_1/EditNoteView.dart';
import 'package:google_keep_clone_application_1/services/db.dart';
import './model/MyNoteModel.dart';
import './colors.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class NoteView extends StatefulWidget {
  Note note;
  NoteView({required this.note});


  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: bgcolor,
      elevation: 0.0,
      actions: [
        IconButton(
            splashRadius: 18,
            onPressed: () {},
            icon: Icon(Icons.archive_outlined)),
        IconButton(
            splashRadius: 18,
            onPressed: () {},
            icon: Icon(Icons.push_pin_outlined)),
        
        
        IconButton(
          splashRadius: 18, 
          onPressed: () async{
            await NotesDatabase.instance.deleteNote(widget.note);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));
          }, 
          icon: Icon(Icons.delete_forever_outlined),
          ),
        
        
        IconButton(
          splashRadius: 18, 
          onPressed: () async{
            Navigator.push(context,MaterialPageRoute(builder: (context)=> EditNoteView(note:widget.note)));
          }, 
          icon: Icon(Icons.edit),
          ),
        ],
      ),

      body: Container(
        color: bgcolor,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.note.title,style: TextStyle(fontSize: 23 ,fontWeight: FontWeight.bold,color: white),),
            SizedBox(height: 5,),
            Divider(),
            SizedBox(height: 5,),
            Text(widget.note.content,style: TextStyle(color: white),),
          ],
        ),
      ),
    );
  }
}
