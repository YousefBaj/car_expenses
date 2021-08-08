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
  var _isVisibile = true;
  var _validate = false;

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
                autofocus: false,
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
                    hintText: 'UserName',
                    hintStyle: TextStyle(color: Colors.white)),
                controller: _usernameController,
                onChanged: (newValue) {
                  _validate = false;
                  username = newValue;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: !_isVisibile,
                style: TextStyle(color: Colors.white),
                cursorColor: Color.fromRGBO(220, 74, 91, 1),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      splashColor: Colors.transparent,
                      icon: _isVisibile
                          ? Icon(
                              Icons.visibility,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                      onPressed: () => {
                        setState(() {
                          _validate = false;
                          _isVisibile = !_isVisibile;
                        })
                      },
                    ),
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
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white)),
                controller: _passwordController,
                onChanged: (newValue) {
                  _validate = false;
                  password = newValue;
                },
              ),
              SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  child: Text(
                    "Email or Password not correct",
                    style: TextStyle(
                      color: _validate ? Colors.red : Colors.transparent,
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                color: Color.fromRGBO(
                  220,
                  74,
                  91,
                  1,
                ),
                onPressed: () => signIn,
                minWidth: double.infinity,
                elevation: 0,
                splashColor: Colors.transparent,
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
      setState(() {
        _validate = true;
      });
    }

    return user;
  }
}
