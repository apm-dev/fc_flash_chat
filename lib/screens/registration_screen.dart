import 'package:fc_flash_chat/constants.dart';
import 'package:fc_flash_chat/widgets/password_input_field.dart';
import 'package:fc_flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldInputDecoration.copyWith(
                hintText: "Enter name",
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              onChanged: (value) {},
              decoration: kTextFieldInputDecoration.copyWith(
                hintText: "Enter username",
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            PasswordInputField(
              onChanged: (value) {},
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              onPressed: () {},
              title: "Register",
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
