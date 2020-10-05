// import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final Widget child;
//   final Function onPressed;

//   @override
//   final Size preferredSize;
//   CustomAppBar({
//     @required this.title,
//     @required this.child,
//     @required this.onPressed,
//   }) : preferredSize = Size.fromHeight(60.0);
// }

// class CAppBar extends StatelessWidget implements PreferredSizeWidget {
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: Size(double.infinity, 100),
//       child: Container(
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
//         ]),
//         width: MediaQuery.of(context).size.width,
//         height: 100,
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.blueAccent,
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20))),
//           child: Container(
//             margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.navigate_before,
//                   size: 40,
//                   color: Colors.white,
//                 ),
//                 Text(
//                   "Foodbar",
//                   style: TextStyle(fontSize: 30, color: Colors.white),
//                 ),
//                 Icon(
//                   Icons.navigate_before,
//                   color: Colors.transparent,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
