import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_keep_clone_application_1/colors.dart';
import 'package:google_keep_clone_application_1/services/db.dart';

import 'NoteView.dart';
import 'model/MyNoteModel.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<int> SearchResultIDs = [];
  List<Note?> SearchResultNotes = [];
  bool isLoading = false;
  void SearchResult(String query) async {
    SearchResultNotes.clear();
    setState(() {
      isLoading = true;
    });
    final ResultIds = await NotesDatabase.instance.getNoteString(query);
    List<Note?> SearchResultNotesLocal = [];
    ResultIds.forEach((element) async {
      final SearchNote = await NotesDatabase.instance.readOneNote(element);
      SearchResultNotesLocal.add(SearchNote);
      setState(() {
        SearchResultNotes.add(SearchNote);
      });
    });
    setState(() {
      isLoading=false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(color: white.withOpacity(0.1)
                  // border: Border.all(color: Colors.white.withOpacity(0.1))
                  ),
              // margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_outlined,
                            color: white,
                          )),
                      Expanded(
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          cursorColor: white,
                          style: TextStyle(color: white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: "Search Note",
                              hintStyle: TextStyle(
                                  fontSize: 17,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.grey.withOpacity(0.8))),
                          onSubmitted: ((value) {
                            setState(() {
                              SearchResult(value.toLowerCase());
                            });
                          }),
                        ),
                      ),
                    ],
                  ),
                  isLoading?Center(child: CircularProgressIndicator(),):NoteSectionAll()
                ],
              ),
            ),
          ),
        ));
  }

  Widget NoteSectionAll() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Search Results",
                style: TextStyle(
                    color: white.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: SearchResultNotes.length,
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            staggeredTileBuilder: (index) => StaggeredTile.fit(2),
            itemBuilder: (context, index) {
              return InkWell( 
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoteView(
                                note: SearchResultNotes[index]!,
                              )));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: white.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        SearchResultNotes[index]!.title,
                        style: TextStyle(
                            color: white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        SearchResultNotes[index]!.content.length > 250
                            ? '${SearchResultNotes[index]!.content.substring(0, 250)}....'
                            : SearchResultNotes[index]!.content,
                        style: TextStyle(color: white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
