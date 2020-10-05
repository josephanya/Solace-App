import 'package:Solace/theme/theme.dart';
import 'package:Solace/views/screens/sign_in.dart';
import 'package:Solace/views/screens/sign_up.dart';
import 'package:Solace/views/widgets/buttons.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/solace_logo_ls.png',
              width: 250,
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'Welcome to Solace',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Your companinon to help you cope with depression and anxiety',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60,
            ),
            PrimaryButton(
              buttonText: 'Get started',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TransparentButton(
              buttonText: 'Sign in',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignIn(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
