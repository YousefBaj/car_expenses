import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  SignInPage();

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  var username;
  var password;
  var user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 40, 60, 1),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 200),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SIGN IN",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: Color.fromRGBO(220, 74, 91, 1),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Color.fromRGBO(220, 74, 91, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Color.fromRGBO(220, 74, 91, 1),
                      ),
                    ),
                    labelText: 'UserName',
                    labelStyle: TextStyle(color: Colors.white)),
                controller: _usernameController,
                onChanged: (newValue) {
                  username = newValue;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                cursorColor: Color.fromRGBO(220, 74, 91, 1),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Color.fromRGBO(220, 74, 91, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Color.fromRGBO(220, 74, 91, 1),
                      ),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white)),
                controller: _passwordController,
                onChanged: (newValue) {
                  password = newValue;
                },
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(220, 74, 91, 1),
                  ),
                  fixedSize: MaterialStateProperty.all(Size.fromWidth(5000)),
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: () => signIn,
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }

  Future<dynamic> get signIn async {
    try {
      user = await auth.signInWithEmailAndPassword(
          email: username, password: password);
      if (user == null) {}
    } catch (e) {
      print(e);
    }

    return user;
  }
}
