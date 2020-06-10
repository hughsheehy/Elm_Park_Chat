import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey , end: Colors.white).animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,   //Colors.white.withOpacity(controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/chat.png'),   //'images/logo.png'),
                    height: 100 * controller.value,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Elm Park Chat'],
                  textStyle: TextStyle(
                    fontSize: 30.0 * controller.value,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'LogIn',
              color: Colors.lightBlueAccent,
              onPressed: (){Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.lightBlue,
              onPressed: (){Navigator.pushNamed(context, RegistrationScreen.id);
                },
            ),
            ],
        ),
      ),
    );
  }
}

