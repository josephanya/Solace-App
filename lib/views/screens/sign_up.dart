import 'package:Solace/providers/sign_up_provider.dart';
import 'package:Solace/theme/theme.dart';
import 'package:Solace/utilities/validator.dart';
import 'package:Solace/views/widgets/buttons.dart';
import 'package:Solace/views/widgets/loader.dart';
import 'package:Solace/views/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var signUpProvider = Provider.of<SignUpProvider>(context);
    return Scaffold(
      backgroundColor: white,
      body: Form(
        key: signUpProvider.formKey,
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
                hintText: 'Full name',
                isTextArea: true,
                isPassword: false,
                autocorrect: false,
                isEmail: true,
                isPhone: false,
                isNumber: false,
                isEnabled: true,
                controller: signUpProvider?.fullNameTEC,
                validator: (value) {
                  if (value.isNotEmpty) {
                    return null;
                  } else {
                    return 'This field can\'t be left empty';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              SolaceTextField(
                hintText: 'Email',
                isTextArea: true,
                isPassword: false,
                autocorrect: false,
                isEmail: true,
                isPhone: false,
                isNumber: false,
                isEnabled: true,
                controller: signUpProvider?.emailTEC,
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
                controller: signUpProvider?.passwordTEC,
                validator: (value) {
                  if (Validator.isPassword(value)) {
                    return null;
                  } else if (value.isEmpty) {
                    return 'This field can\'t be left empty';
                  } else {
                    return 'Please enter a password with at least 6 characters';
                  }
                },
              ),
              SizedBox(
                height: 50,
              ),
              signUpProvider.isLoading
                  ? Loader()
                  : PrimaryButton(
                      buttonText: 'Sign up',
                      onPressed: () {
                        if (signUpProvider.formKey.currentState.validate()) {
                          signUpProvider.signUp(context);
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
