import 'dart:async';
import 'package:car_expenses/%20app/HomePage/HomePage.dart';
import 'package:car_expenses/%20app/Authentication/Sign_in/sing_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth _user = FirebaseAuth.instance;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 5),
      () => {
        Navigator.pushReplacement(
          context,
          PageTransition(
              child: _user != null ? SignInPage() : HomePage(),
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 400)),
        )
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(37, 40, 60, 1)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset('Assets/Images/Splash.png'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Best Way to Manage \nYour Car Expensses",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
