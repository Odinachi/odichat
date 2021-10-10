import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:odichatz/components/button_widget.dart';
import 'package:odichatz/screens/login_screen.dart';
import 'package:odichatz/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

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
            Expanded(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: animation.value * 100,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          'Odi',
                          style: TextStyle(fontSize: 43.0),
                        ),
                        DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 40.0,
                            fontFamily: 'Horizon',
                          ),
                          child: AnimatedTextKit(animatedTexts: [
                            RotateAnimatedText('Chat',
                                textStyle: TextStyle(color: Colors.black54)),
                            RotateAnimatedText('Flex',
                                textStyle: TextStyle(color: Colors.black54)),
                            RotateAnimatedText('Happy',
                                textStyle: TextStyle(color: Colors.black54)),
                            RotateAnimatedText('Jovial',
                                textStyle: TextStyle(color: Colors.black54)),
                            RotateAnimatedText('Fun',
                                textStyle: TextStyle(color: Colors.black54)),
                            RotateAnimatedText('Relax'),
                          ]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonWidget(
              color: Colors.lightBlueAccent,
              text: 'Log in',
              onpress: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            ButtonWidget(
              color: Colors.blueAccent,
              text: 'Register',
              onpress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
