import 'package:Solace/services/auth.dart';
import 'package:Solace/theme/theme.dart';
import 'package:Solace/views/screens/welcome.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Profile',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        child: Icon(
                          Icons.settings,
                          size: 38,
                        ),
                        onTap: () async {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Welcome(),
                            ),
                          );
                          await Auth().signOut();
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
