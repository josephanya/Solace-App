import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServerDatabase {
  final String uid;
  final CollectionReference users = Firestore.instance.collection('users');
  ServerDatabase({this.uid});

  Future regUser({
    @required String fullName,
    @required email,
    @required userID,
    @required groupID,
  }) async {
    return await users.document(uid).setData(
      {
        'fullName': fullName,
        'email': email,
        'groupID': groupID,
        'userID': userID,
      },
    );
  }

  Future<String> getGroupID() async {
    return await users.document(uid).get().then((datasnapshot) {
      var id = datasnapshot.data['groupID'];
      return id;
    });
  }
}

class LocalDatabase {}
