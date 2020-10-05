import 'package:Solace/theme/theme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  PrimaryButton({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: FlatButton(
        color: primaryTeal,
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}

class TransparentButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  TransparentButton({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
              color: primaryTeal, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
