// import 'package:flutter/material.dart';
// import 'package:google_keep_clone_application_1/Settings.dart';
// import 'package:google_keep_clone_application_1/colors.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class SideMenu extends StatefulWidget {
//   const SideMenu({Key? key}) : super(key: key);

//   @override
//   State<SideMenu> createState() => _SideMenuState();
// }

// class _SideMenuState extends State<SideMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         decoration: BoxDecoration(color: bgcolor),
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                   margin: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
//                   child: Text(
//                     "Google Keep",
//                     style: TextStyle(
//                         color: white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold),
//                   )),
//               Divider(
//                 color: white.withOpacity(0.3),
//               ),
//               sectionOne(),
//               SizedBox(
//                 height: 12,
//               ),
//               sectionTwo(),
//               SizedBox(
//                 height: 12,
//               ),
//               sectionSetting()
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget sectionOne() {
//     return Container(
//       // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//       margin: EdgeInsets.only(right: 10),
//       child: TextButton(
//           onPressed: () {},
//           style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all(
//                   Colors.orangeAccent.withOpacity(0.3)),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(50),
//                           bottomRight: Radius.circular(50))))),
//           child: Container(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.lightbulb,
//                   size: 25,
//                   color: white.withOpacity(0.7),
//                 ),
//                 SizedBox(
//                   width: 27,
//                 ),
//                 Text(
//                   "Notes",
//                   style: TextStyle(color: white.withOpacity(0.7), fontSize: 18),
//                 )
//               ],
//             ),
//           )),
//     );
//   }

//   Widget sectionTwo() {
//     return Container(
//       // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//       margin: EdgeInsets.only(right: 10),
//       child: TextButton(
//           onPressed: () {},
//           style: ButtonStyle(
//               // backgroundColor: MaterialStateProperty.all(
//               //     Colors.orangeAccent.withOpacity(0.3)),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(50),
//                           bottomRight: Radius.circular(50))))),
//           child: Container(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.archive_outlined,
//                   size: 25,
//                   color: white.withOpacity(0.7),
//                 ),
//                 SizedBox(
//                   width: 27,
//                 ),
//                 Text(
//                   "Archive",
//                   style: TextStyle(color: white.withOpacity(0.7), fontSize: 18),
//                 )
//               ],
//             ),
//           )),
//     );
//   }

//   Widget sectionSetting() {
//     return Container(
//       // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//       margin: EdgeInsets.only(right: 10),
//       child: TextButton(
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder:(context)=>Settings()));
//           },
//           style: ButtonStyle(
//               // backgroundColor: MaterialStateProperty.all(
//               //     Colors.orangeAccent.withOpacity(0.3)),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(50),
//                           bottomRight: Radius.circular(50))))),
//           child: Container(
//             padding: EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.settings_outlined,
//                   size: 25,
//                   color: white.withOpacity(0.7),
//                 ),
//                 SizedBox(
//                   width: 27,
//                 ),
//                 Text(
//                   "Settings",
//                   style: TextStyle(color: white.withOpacity(0.7), fontSize: 18),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_keep_clone_application_1/ArchiveView.dart';
import 'package:google_keep_clone_application_1/Settings.dart';
import 'package:google_keep_clone_application_1/colors.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: bgcolor),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: Text(
                    "Google Keep",
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )),
              Divider(
                color: white.withOpacity(0.3),
              ),
              sectionOne(),
              SizedBox(height: 5,),
              sectionTwo(),
              SizedBox(height: 5,),
              sectionSetting()
            ],
          ),
        ),
      ),
    );
  }




  Widget sectionOne()
  {
    return Container(
                margin: EdgeInsets.only(right: 10),
                child: TextButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ))),
                  onPressed: () {},
                  child: Container(
                    
                    padding: EdgeInsets.all(5),
                    child: Row(
                    children: [
                      Icon(
                        Icons.lightbulb,
                        size: 25,
                        color: white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 27,
                      ),
                      Text(
                        "Notes",
                        style: TextStyle(
                            color: white.withOpacity(0.7), fontSize: 18),
                      )
                    ],
                  ),
                  )
                ),
              );
  }





   Widget sectionTwo()
  {
    return Container(
                margin: EdgeInsets.only(right: 10),
                child: TextButton(
                  style: ButtonStyle(
                  
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveView()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                    children: [
                      Icon(
                        Icons.archive_outlined,
                        size: 25,
                        color: white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 27,
                      ),
                      Text(
                        "Archive",
                        style: TextStyle(
                            color: white.withOpacity(0.7), fontSize: 18),
                      )
                    ],
                  ),
                  )
                ),
              );
  }



     Widget sectionSetting()
  {
    return Container(
                margin: EdgeInsets.only(right: 10),
                child: TextButton(
                  style: ButtonStyle(
                  
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                    children: [
                      Icon(
                       Icons.settings_outlined,
                        size: 25,
                        color: white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 27,
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(
                            color: white.withOpacity(0.7), fontSize: 18),
                      )
                    ],
                  ),
                  )
                ),
              );
  }
}
