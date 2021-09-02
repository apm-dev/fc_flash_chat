import 'package:fc_flash_chat/constants.dart';
import 'package:fc_flash_chat/widgets/password_input_field.dart';
import 'package:fc_flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              decoration: kTextFieldInputDecoration.copyWith(
                hintText: 'Enter your username',
              ),
              onChanged: (value) {
                //Do something with the user input.
              },
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
              color: Colors.lightBlueAccent,
              title: "Login",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
