import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_keep_clone_application_1/model/MyNoteModel.dart';
import 'package:google_keep_clone_application_1/services/login_info.dart';
import 'db.dart';

class FireDB {
  //CREATE,READ,UPDATE,DELETE
  final FirebaseAuth _auth = FirebaseAuth.instance;

  createNewNoteFirestore(Note note) async {
    LocalDataSaver.getSyncSet().then((isSyncOn) async {
      if (isSyncOn.toString()=="true") {
        final User? current_user = _auth.currentUser;
        await FirebaseFirestore.instance
            .collection("notes")
            .doc(current_user!.email)
            .collection("usernotes")
            .doc(note.uniqueID)
            .set({
          "Title": note.title,
          "content": note.content,
          "uniqueID": note.uniqueID,
          "date": note.createdTime,
        }).then((_) {
          print("DATA ADDED SUCCESSFULLY");
        });
      }
    });
  }

  getAllStoredNotes() async {
    final User? current_user = _auth.currentUser;
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(current_user!.email)
        .collection("usernotes")
        .orderBy("date")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Map note = result.data();

        NotesDatabse.instance.InsertEntry(Note(
            title: note["Title"],
            content: note["content"],
            uniqueID: note["uniqueID "],
            createdTime: note["date"],
            pin: false,
            isArchieve: false)); //Add Notes In Database
      });
    });
  }

  updateNoteFirestore(Note note) async {
    LocalDataSaver.getSyncSet().then((isSyncOn) async {
      if (isSyncOn.toString()=="true") {
        final User? current_user = _auth.currentUser;
        await FirebaseFirestore.instance
            .collection("notes")
            .doc(current_user!.email)
            .collection("usernotes")
            .doc(note.uniqueID.toString())
            .update({
          "Title": note.title.toString(),
          "content": note.content
        }).then((_) {
          print("DATA ADDED SUCCESFULLY");
        });
      }
    });
  }

  deleteNoteFirestore(Note note) async {
    LocalDataSaver.getSyncSet().then((isSyncOn) async {
      if (isSyncOn.toString()=="true") {
        final User? current_user = _auth.currentUser;
        await FirebaseFirestore.instance
            .collection("notes")
            .doc(current_user!.email.toString())
            .collection("usernotes")
            .doc(note.uniqueID.toString())
            .delete()
            .then((_) {
          print("DATA DELETED SUCCESS FULLY");
        });
      }
    });
  }
}
