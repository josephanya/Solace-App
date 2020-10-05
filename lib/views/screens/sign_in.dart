import 'package:Solace/providers/sign_in_provider.dart';
import 'package:Solace/theme/theme.dart';
import 'package:Solace/utilities/validator.dart';
import 'package:Solace/views/widgets/buttons.dart';
import 'package:Solace/views/widgets/loader.dart';
import 'package:Solace/views/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var signInProvider = Provider.of<SignInProvider>(context);
    return Scaffold(
      backgroundColor: white,
      body: Form(
        key: signInProvider.formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/solace_logo_ls.png',
                width: 200,
              ),
              SizedBox(
                height: 35,
              ),
              SolaceTextField(
                hintText: 'Email address',
                isTextArea: true,
                isPassword: false,
                autocorrect: false,
                isEmail: true,
                isPhone: false,
                isNumber: false,
                isEnabled: true,
                controller: signInProvider?.emailTEC,
                validator: (value) {
                  if (Validator.isEmail(value)) {
                    return null;
                  } else if (value.isEmpty) {
                    return 'This field can\'t be left empty';
                  } else {
                    return 'Please enter a valid email';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              SolaceTextField(
                hintText: 'Password',
                isTextArea: true,
                isPassword: true,
                autocorrect: false,
                isEmail: false,
                isPhone: false,
                isNumber: false,
                isEnabled: true,
                controller: signInProvider?.passwordTEC,
                validator: (value) {
                  if (Validator.isPassword(value)) {
                    return null;
                  } else if (value.isEmpty) {
                    return 'This field can\'t be left empty';
                  } else {
                    return 'Please enter a password with atlest 6 characters';
                  }
                },
              ),
              SizedBox(
                height: 50,
              ),
              signInProvider.isLoading
                  ? Loader()
                  : PrimaryButton(
                      buttonText: 'Sign in',
                      onPressed: () {
                        if (signInProvider.formKey.currentState.validate()) {
                          signInProvider.signIn(context);
                        }
                      },
                    ),
              SizedBox(
                height: 30,
              ),
              Text('Forgot passowrd?')
            ],
          ),
        ),
      ),
    );
  }
}
