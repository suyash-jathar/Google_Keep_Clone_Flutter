import 'package:flutter/material.dart';
import 'package:google_keep_clone_application_1/colors.dart';
import 'package:google_keep_clone_application_1/home.dart';
import 'package:google_keep_clone_application_1/model/MyNoteModel.dart';
import 'package:google_keep_clone_application_1/services/db.dart';
import 'package:intl/intl.dart';
import 'EditNoteView.dart';

class NoteView extends StatefulWidget {
  Note? note;
  NoteView({required this.note});

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
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
              onPressed: () async {
                await NotesDatabse.instance.pinNote(widget.note);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(
                  widget.note!.pin ? Icons.push_pin : Icons.push_pin_outlined)),
          IconButton(
              splashRadius: 17,
              onPressed: () async {
                await NotesDatabse.instance.archNote(widget.note);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(widget.note!.isArchieve
                  ? Icons.archive
                  : Icons.archive_outlined)),
          IconButton(
              splashRadius: 17,
              onPressed: () async {
                await NotesDatabse.instance.delteNote(widget.note);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Icon(Icons.delete_forever_outlined)),
          IconButton(
              splashRadius: 17,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditNoteView(note: widget.note)));
              },
              icon: Icon(Icons.edit_outlined))
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Created Time ${DateFormat('dd--MM--yyyy  -  kk:mm').format(widget.note!.createdTime)} ",style: TextStyle(color: Colors.white),),
            SizedBox(height: 20,),
            Text(
              widget.note!.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.note!.content,
              style: TextStyle(color: Colors.white),
            )
          ]),
        ),
      ),
    );
  }
}
