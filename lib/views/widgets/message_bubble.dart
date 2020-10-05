// import 'dart:io';
// import 'package:Solace/theme/theme.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class MessageBubble extends StatelessWidget {
//   final String sender;
//   final String content;
//   final bool isMe;
//   final DateTime time;
//   final int type;

//   MessageBubble({this.sender, this.content, this.isMe, this.time, this.type});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//       child: Column(
//         crossAxisAlignment:
//             isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//             child: Text(
//               '$sender',
//               style: TextStyle(fontSize: 11.5, color: Colors.black54),
//             ),
//           ),
//           Material(
//             borderRadius: BorderRadius.circular(8),
//             color: isMe ? primaryTeal : white,
//             child: (type == 1)
//                 ? Container(
//                     child: FlatButton(
//                       child: Material(
//                         child: CachedNetworkImage(
//                           placeholder: (context, url) => Container(
//                             child: Platform.isAndroid
//                                 ? CircularProgressIndicator()
//                                 : CupertinoActivityIndicator(),
//                             width: 150.0,
//                             height: 150.0,
//                             padding: EdgeInsets.all(70.0),
//                             decoration: BoxDecoration(
//                               color: grey,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                           errorWidget: (context, url, error) => Material(
//                             child: Image.asset(
//                               'images/img_not_available.jpeg',
//                               width: 150.0,
//                               height: 150.0,
//                               fit: BoxFit.cover,
//                             ),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8.0),
//                             ),
//                             clipBehavior: Clip.hardEdge,
//                           ),
//                           imageUrl: content,
//                           width: 150.0,
//                           height: 150.0,
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                         clipBehavior: Clip.hardEdge,
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => FullPhoto(url: content)));
//                       },
//                       padding: EdgeInsets.all(0),
//                     ),
//                     margin: EdgeInsets.only(left: 0.0),
//                   )
//                 : Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 10),
//                     child: Text('$content',
//                         style: TextStyle(
//                             color: isMe ? Colors.white : Colors.black87,
//                             fontSize: 15,
//                             fontWeight: FontWeight.w500)),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
