import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_keep_clone_application_1/SearchBar.dart';
import 'package:google_keep_clone_application_1/SideMenuBar.dart';
import 'package:google_keep_clone_application_1/colors.dart';
import 'package:google_keep_clone_application_1/login.dart';
import 'package:google_keep_clone_application_1/services/auth.dart';
import 'package:google_keep_clone_application_1/services/db.dart';
import 'package:google_keep_clone_application_1/services/login_info.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'NoteView.dart';
import 'CreateNoteView.dart';
import 'package:flutter/material.dart';

import 'model/MyNoteModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  late List<Note> notesList;
  late String? ImgUrl;
  bool isStaggered = true;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String note =
      "THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE";
  String note1 = "THIS IS NOTE THIS IS NOTE THIS IS NOTE";
  @override
  void initState() {
    super.initState();
    LocalDataSaver.saveSyncSet(false);
    getAllNotes();
  }

  Future createEntry(Note note) async {
    await NotesDatabse.instance.InsertEntry(note);
  }

  Future getAllNotes() async {
    LocalDataSaver.getImg().then((value) {
      if (this.mounted) {
        setState(() {
          ImgUrl = value;
        });
      }
    });

    this.notesList = await NotesDatabse.instance.readAllNotes();
    if (this.mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future getOneNote(int id) async {
    await NotesDatabse.instance.readOneNote(id);
  }

  Future updateOneNote(Note note) async {
    await NotesDatabse.instance.updateNote(note);
  }

  Future deleteNote(Note note) async {
    await NotesDatabse.instance.delteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            backgroundColor: bgcolor,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          )
        : Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateNoteView()));
              },
              backgroundColor: cardColor,
              child: Icon(
                Icons.add,
                size: 45,
              ),
            ),
            endDrawerEnableOpenDragGesture: true,
            key: _drawerKey,
            drawer: SideMenu(),
            backgroundColor: bgcolor,
            body: RefreshIndicator(
              onRefresh: () {
                return Future.delayed(Duration(seconds: 1), () {
                  /// adding elements in list after [1 seconds] delay
                  /// to mimic network call
                  ///
                  /// Remember: [setState] is necessary so that
                  /// build method will run again otherwise
                  /// list will not show all elements
                  setState(() {});
                });
              },
              child: SafeArea(
                  child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 3)
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _drawerKey.currentState!.openDrawer();
                                        },
                                        icon: Icon(
                                          Icons.menu,
                                          color: white,
                                        )),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchView()));
                                      },
                                      child: Container(
                                          height: 55,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              220,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Search Your Notes",
                                                  style: TextStyle(
                                                      color: white
                                                          .withOpacity(0.5),
                                                      fontSize: 14),
                                                )
                                              ])),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    children: [
                                      TextButton(
                                          style: ButtonStyle(
                                              overlayColor: MaterialStateColor
                                                  .resolveWith((states) =>
                                                      white.withOpacity(0.1)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ))),
                                          onPressed: () {
                                            setState(() {
                                              isStaggered = !isStaggered;
                                            });
                                          },
                                          child: Icon(
                                            Icons.grid_view,
                                            color: white,
                                          )),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          signOut();
                                          LocalDataSaver.saveLoginData(false);

                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Login()));
                                        },
                                        child: CircleAvatar(
                                          onBackgroundImageError:
                                              (Object, StackTrace) {
                                            print("Ok");
                                          },
                                          radius: 16,
                                          backgroundImage:
                                              NetworkImage(ImgUrl.toString()),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ])),
                      NoteSectionAll(),
                    ],
                  ),
                ),
              )),
            ));
  }

  Widget NoteSectionAll() {
    return Container(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "ALL",
                style: TextStyle(
                    color: white.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: notesList.length,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                crossAxisCount: 4,
                staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NoteView(note: notesList[index])));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: white.withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(7)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(notesList[index].title,
                                style: TextStyle(
                                    color: white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              notesList[index].content.length > 250
                                  ? "${notesList[index].content.substring(0, 250)}..."
                                  : notesList[index].content,
                              style: TextStyle(color: white),
                            )
                          ],
                        ),
                      ),
                    ))),
      ],
    ));
  }

  Widget NotesListSection() {
    return Container(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "ALL",
                style: TextStyle(
                    color: white.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: notesList.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: white.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notesList[index].content.length > 250
                          ? "${notesList[index].content.substring(0, 250)}..."
                          : notesList[index].content,
                      style: TextStyle(color: white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      index.isEven
                          ? note.length > 250
                              ? "${note.substring(0, 250)}..."
                              : note
                          : note1,
                      style: TextStyle(color: white),
                    )
                  ],
                ),
              ),
            )),
      ],
    ));
  }
}
