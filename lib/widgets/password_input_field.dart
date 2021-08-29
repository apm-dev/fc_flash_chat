import 'package:fc_flash_chat/constants.dart';
import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final void Function(String) onChanged;

  PasswordInputField({@required this.onChanged});

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isPassVisible = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 1,
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            obscureText: !isPassVisible,
            onChanged: widget.onChanged,
            decoration: kTextFieldInputDecoration.copyWith(
              hintText: "Enter password",
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isPassVisible = !isPassVisible;
            });
          },
          icon: Icon(
            isPassVisible ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ],
    );
  }
}
