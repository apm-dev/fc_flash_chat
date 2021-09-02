import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fc_flash_chat/constants.dart';
import 'package:fc_flash_chat/screens/login_screen.dart';
import 'package:fc_flash_chat/screens/registration_screen.dart';
import 'package:fc_flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  String host;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    /* animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    }); */

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.url,
              decoration: kTextFieldInputDecoration.copyWith(
                hintText: "Enter host address",
              ),
              onChanged: (value) {
                host = value;
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: "Login",
              color: Colors.lightBlueAccent,
              onPressed: () async {
                Navigator.pushNamed(context, LoginScreen.id);
                // var sp = await SharedPreferences.getInstance();
                // print(sp.getString("USERNAME"));
                // print(sp.getString("PASSWORD"));
                // print(sp.getString("TOKEN"));
              },
            ),
            RoundedButton(
              title: "Register",
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RegistrationScreen.id,
                  arguments: host,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
