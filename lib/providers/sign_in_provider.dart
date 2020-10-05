import 'package:Solace/models/user_model.dart';
import 'package:Solace/services/auth.dart';
import 'package:Solace/views/widgets/bottom_navigator.dart';
import 'package:Solace/views/widgets/dialog.dart';
import 'package:flutter/material.dart';

class SignInProvider with ChangeNotifier {
  Auth auth = Auth();
  var formKey = GlobalKey<FormState>();
  var resetFormKey = GlobalKey<FormState>();

  final TextEditingController emailTEC = new TextEditingController();
  final TextEditingController passwordTEC = new TextEditingController();

  bool _isLoading = false;
  UserModel userModel;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  signIn(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      var user = await auth.signIn(emailTEC.text, passwordTEC.text);
      notifyListeners();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomNavigator(),
        ),
      );
      isLoading = false;
      notifyListeners();
      emailTEC.text = '';
      passwordTEC.text = '';
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e.toString());
      if (e.toString().contains('ERROR_WRONG_PASSWORD')) {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                title: 'Invalid password',
                description:
                    'The password is invalid or the user does not have a password',
                buttonText: 'Try again'));
      } else if (e.toString().contains('ERROR_TOO_MANY_REQUESTS')) {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                title: 'Error',
                description:
                    'Too many unsuccessful login attempts. Try again later',
                buttonText: 'Try again'));
      } else if (e.toString().contains('ERROR_USER_NOT_FOUND')) {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                title: 'Error',
                description: 'This user does not exist',
                buttonText: 'Try again'));
      } else if (e.toString().contains('not a')) {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                title: 'Error',
                description: e.toString() ?? '',
                buttonText: 'Try again'));
      } else {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                title: 'Error',
                description: 'An error occurred. Please try again',
                buttonText: 'Try again'));
      }
    }
  }

  resetPassword(BuildContext context) async {
    try {
      await auth.resetPassword(emailTEC.text);
      emailTEC.text = '';
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (_) => CustomDialog(
              title: 'Successfully sent',
              description:
                  'You should recieve an email shortly with a link to reset your password',
              buttonText: 'Continue'));
    } catch (e) {
      print(e.toString());
      showDialog(
          context: context,
          builder: (_) => CustomDialog(
              title: 'Error',
              description: 'An error occurred. Please try again',
              buttonText: 'Try again'));
    }
  }
}
