import 'package:fc_flash_chat/constants.dart';
import 'package:fc_flash_chat/services/authing.dart';
import 'package:fc_flash_chat/widgets/password_input_field.dart';
import 'package:fc_flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "registration_screen";

  final String host;
  RegistrationScreen({@required this.host});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  String name, uname, passwd;

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
                name = value;
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
              onChanged: (value) {
                uname = value;
              },
              decoration: kTextFieldInputDecoration.copyWith(
                hintText: "Enter username",
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            PasswordInputField(
              onChanged: (value) {
                passwd = value;
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              onPressed: () async {
                bool isRegistered = await Authing(baseUrl: widget.host)
                    .register(name, uname, passwd);

                if (isRegistered) {
                  print("welcome to our app");
                } else {
                  print("failed");
                }
              },
              title: "Register",
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
