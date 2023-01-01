// // ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

// import 'package:flutter/material.dart';
// import 'package:google_keep_clone_application_1/NoteView.dart';
// import 'package:google_keep_clone_application_1/SideMenuBar.dart';
// import './colors.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'CreateNoteView.dart';
// class ArchiveView extends StatefulWidget {
//   const ArchiveView({Key? key}) : super(key: key);
//   @override
//   State<ArchiveView> createState() => _ArchiveViewState();
// }

// class _ArchiveViewState extends State<ArchiveView> {
//   GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
//   String note =
//       "THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE ";
//   String note1 = "THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       endDrawerEnableOpenDragGesture: true,
//       key: _drawerKey,
//       drawer: SideMenu(),
//       backgroundColor: bgcolor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                 width: MediaQuery.of(context).size.width,
//                 height: 55,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: cardColor,
//                     boxShadow: [
//                       BoxShadow(
//                           color: black.withOpacity(0.2),
//                           spreadRadius: 1,
//                           blurRadius: 3)
//                     ]),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               _drawerKey.currentState!.openDrawer();
//                             },
//                             icon: Icon(
//                               Icons.menu,
//                               color: white,
//                             )),
//                         SizedBox(
//                           width: 16,
//                         ),
//                         // Search bar
//                         Container(
//                           height: 55,
//                           width: 180,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Search Your Notes",
//                                 style: TextStyle(
//                                     color: white.withOpacity(0.5),
//                                     fontSize: 16),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 10),
//                       child: Row(
//                         children: [
//                           TextButton(
//                               style: ButtonStyle(
//                                   overlayColor: MaterialStateColor.resolveWith(
//                                       (states) => white.withOpacity(0.1)),
//                                   shape: MaterialStateProperty.all<
//                                           RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(50.00)))),
//                               onPressed: () {},
//                               child: Icon(
//                                 Icons.grid_view,
//                                 color: white,
//                               )),
//                           SizedBox(
//                             width: 9,
//                           ),
//                           CircleAvatar(
//                             backgroundColor: Colors.white,
//                             radius: 16,
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Main Section
//               NoteSectionAll(),
//               NotesListSection()
//             ],
//           )),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         splashColor: bgcolor,
//         elevation: 0.0,
//         foregroundColor: Colors.white,
//         child:Icon(Icons.add,size:40.0),
//         backgroundColor:cardColor,
//         onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNoteView()));
//         },
//         ),
//     );
//   }



// // Widgets Section
//   Widget NoteSectionAll() {
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 "ALL",
//                 style: TextStyle(
//                     color: white.withOpacity(0.5),
//                     fontSize: 13,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//           child: StaggeredGridView.countBuilder(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: 10,
//             crossAxisCount: 4,
//             mainAxisSpacing: 12,
//             crossAxisSpacing: 12,
//             staggeredTileBuilder: (index) => StaggeredTile.fit(2),
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: (){
//                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteView()));
//                 },
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: white.withOpacity(0.4)),
//                     borderRadius: BorderRadius.circular(7),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "HEADING ",
//                         style: TextStyle(
//                             color: white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         index.isEven
//                             ? note.length > 250
//                                 ? '${note.substring(0, 250)}....'
//                                 : note
//                             : note1.length > 250
//                                 ? "${note1.substring(0, 250)}"
//                                 : note1,
//                         style: TextStyle(color: white),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget NotesListSection() {
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 "LIST VIEW",
//                 style: TextStyle(
//                     color: white.withOpacity(0.5),
//                     fontSize: 13,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//           child: ListView.builder(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: 10,
//             itemBuilder: (context, index) {
//               return Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.only(bottom: 8),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: white.withOpacity(0.4)),
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "HEADING ",
//                       style: TextStyle(
//                           color: white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       index.isEven
//                           ? note.length > 250
//                               ? '${note.substring(0, 250)}....'
//                               : note
//                           : note1.length > 250
//                               ? "${note1.substring(0, 250)}"
//                               : note1,
//                       style: TextStyle(color: white),
//                     ),
//                   ],
//                 ),
//               );
//             },
            
//           ),
//         ),

//       ],
//     );
//   }
// }

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_keep_clone_application_1/SearchBar.dart';
import 'package:google_keep_clone_application_1/SideMenuBar.dart';
import 'package:google_keep_clone_application_1/colors.dart';
import 'package:google_keep_clone_application_1/model/MyNoteModel.dart';
import 'package:google_keep_clone_application_1/services/db.dart';
import 'package:google_keep_clone_application_1/services/login_info.dart';
import 'NoteView.dart';
import 'CreateNoteView.dart';
import 'package:flutter/material.dart';

class ArchiveView extends StatefulWidget {
  const ArchiveView({Key? key}) : super(key: key);

  @override
  _ArchiveViewState createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String note =
      "THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE THIS IS NOTE";
  String note1 = "THIS IS NOTE THIS IS NOTE THIS IS NOTE";
  late List<Note> notesList;
  bool isLoading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNotes();
  }
  Future getAllNotes() async {
    this.notesList = await NotesDatabse.instance.readAllArchiveNotes();
    if (this.mounted) {
      setState(() {
        isLoading = false;
      });
    }
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
        :Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => CreateNoteView()) );
        },
        backgroundColor: cardColor,
        child: Icon(Icons.add , size: 45,),
      ),
        endDrawerEnableOpenDragGesture: true,
        key: _drawerKey,
        drawer: SideMenu(),
        backgroundColor: bgcolor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_sharp,
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
                                // TextButton(
                                //     style: ButtonStyle(
                                //         overlayColor:
                                //             MaterialStateColor.resolveWith(
                                //                 (states) =>
                                //                     white.withOpacity(0.1)),
                                //         shape: MaterialStateProperty.all<
                                //                 RoundedRectangleBorder>(
                                //             RoundedRectangleBorder(
                                //           borderRadius:
                                //               BorderRadius.circular(50.0),
                                //         ))),
                                //     onPressed: () {},
                                //     child: Icon(
                                //       Icons.grid_view,
                                //       color: white,
                                //     )),
                                // SizedBox(
                                //   width: 9,
                                // ),
                                // CircleAvatar(
                                //   radius: 16,
                                //   backgroundColor: Colors.white,
                                // )
                              ],
                            ),
                          ),
                        ])),
                NoteSectionAll(),
              ],
            ),
          ),
        )));
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
              itemBuilder: (context, index) => 
              InkWell(
                onTap: () 
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NoteView(note: notesList[index])));
                },
                child: 
              Container(
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
              
              )
            )),
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
                "LIST VIEW",
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
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: white.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("HEADING",
                        style: TextStyle(
                            color: white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
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
