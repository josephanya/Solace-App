import 'package:Solace/theme/theme.dart';
import 'package:flutter/material.dart';

class SolaceTextField extends StatelessWidget {
  final Widget suffix;
  final VoidCallback onTap;
  final bool autocorrect,
      isEmail,
      isPhone,
      isNumber,
      isPassword,
      isTextArea,
      isEnabled;
  final Function(String) onChanged, validator, onSaved;
  final TextEditingController controller;
  final String hintText;

  SolaceTextField(
      {this.suffix,
      this.onTap,
      this.onChanged,
      this.validator,
      this.autocorrect,
      this.isEmail,
      this.isNumber,
      this.isPassword,
      this.isPhone,
      this.controller,
      this.isTextArea,
      this.isEnabled,
      this.onSaved,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: TextFormField(
              controller: controller,
              obscureText: isPassword,
              enabled: isEnabled,
              validator: validator,
              onChanged: onChanged,
              onTap: onTap,
              maxLines: isTextArea && !isPassword ? null : isPassword ? 1 : 3,
              keyboardType: isEmail
                  ? TextInputType.emailAddress
                  : isPhone
                      ? TextInputType.phone
                      : isNumber
                          ? TextInputType.numberWithOptions(decimal: true)
                          : TextInputType.text,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.black),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                  fillColor: textfieldFill,
                  hintText: hintText,
                  filled: true,
                  suffix: suffix,
                  errorStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                      color: Colors.red),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Colors.grey[200],
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Colors.red[400],
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Colors.red[400],
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Colors.grey[200],
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Colors.grey[200],
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Colors.grey[100],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
