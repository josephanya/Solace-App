import 'package:Solace/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signIn(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }

  Future<FirebaseUser> signUp(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }

  Future signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<void> resetPassword(String email) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  createUserProfile(UserModel userModel) async {
    await Firestore.instance
        .collection('users')
        .document(userModel.userID)
        .setData(userModel.toJson());
  }

  Future<UserModel> getUserProfile() async {
    var user = await FirebaseAuth.instance.currentUser();
    var querySnapshot =
        await Firestore.instance.collection('users').document(user.uid).get();

    return (querySnapshot.data != null)
        ? UserModel.fromSnapshot(querySnapshot)
        : null;
  }
}
