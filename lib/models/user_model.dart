import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String fullName, firstName, email, profilePic, userID, groupID;
  DateTime creationDate;
  final DocumentReference reference;

  UserModel({
    this.fullName,
    this.firstName,
    this.email,
    this.profilePic,
    this.groupID,
    this.reference,
    this.userID,
    this.creationDate,
  });

  UserModel.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : fullName = map['fullName'],
        firstName = map['firstName'],
        email = map['email'],
        profilePic = map['profilePic'],
        groupID = map['groupID'],
        userID = map['userID'],
        creationDate = map['creationDate'].toDate();

  UserModel.fromJson(Map<String, dynamic> json, {this.reference})
      : fullName = json['fullName'],
        firstName = json['firstName'],
        email = json['email'],
        profilePic = json['profilePic'],
        groupID = json['groupID'],
        userID = json['userID'],
        creationDate = json['creationDate'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['firstName'] = this.firstName;
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['groupID'] = this.groupID;
    data['userID'] = this.userID;
    data['creationDate'] = this.creationDate;
    return data;
  }

  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
