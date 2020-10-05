import 'package:Solace/models/user_model.dart';
import 'package:Solace/services/auth.dart';
import 'package:Solace/views/widgets/bottom_navigator.dart';
import 'package:Solace/views/widgets/dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  Auth auth = Auth();
  var formKey = GlobalKey<FormState>();
  var resetFormKey = GlobalKey<FormState>();

  final TextEditingController fullNameTEC = new TextEditingController();
  final TextEditingController emailTEC = new TextEditingController();
  final TextEditingController passwordTEC = new TextEditingController();

  bool _isLoading = false;
  UserModel userModel;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  String firstName(String fullName) {
    var firstName = fullName.split(' ').first;
    return (firstName[0].toUpperCase() + firstName.substring(1));
  }

  signUp(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      var user = await auth.signUp(emailTEC.text, passwordTEC.text);
      if (user != null) {}
      UserModel userModel = UserModel(
        fullName: fullNameTEC.text,
        firstName: firstName(fullNameTEC.text),
        email: emailTEC.text,
        profilePic: '',
        groupID: '',
        userID: user.uid,
        creationDate: DateTime.now(),
      );
      await auth.createUserProfile(userModel);
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = firstName(fullNameTEC.text);
      user.updateProfile(updateInfo);
      fullNameTEC.text = '';
      emailTEC.text = '';
      passwordTEC.text = '';
      notifyListeners();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomNavigator(),
        ),
      );
      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      notifyListeners();
      print(error.toString());
      showDialog(
          context: context,
          builder: (_) => CustomDialog(
              title: 'Error',
              description: 'An error occurred. Please try again',
              buttonText: 'Try again'));
    }
  }
}
