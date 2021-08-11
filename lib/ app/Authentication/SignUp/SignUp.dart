import 'package:car_expenses/%20app/HomePage/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  var username;
  var password;
  var confirmPassword;

  late User _user;
  var _isVisibile = false;
  var _validate = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                "SIGN UP",
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
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(
                        color: Color.fromRGBO(220, 74, 91, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(
                        color: Color.fromRGBO(220, 74, 91, 1),
                      ),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white24)),
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
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(
                        color: Color.fromRGBO(220, 74, 91, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(
                        color: Color.fromRGBO(220, 74, 91, 1),
                      ),
                    ),
                    hintText: "PASSWORD",
                    hintStyle: TextStyle(color: Colors.white24)),
                controller: _passwordController,
                onChanged: (newValue) {
                  _validate = false;
                  password = newValue;
                },
              ),
              SizedBox(
                height: 10,
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
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(
                        color: Color.fromRGBO(220, 74, 91, 1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(
                        color: Color.fromRGBO(220, 74, 91, 1),
                      ),
                    ),
                    hintText: "CONFIRM PASSWORD",
                    hintStyle: TextStyle(color: Colors.white24)),
                controller: _confirmPasswordController,
                onChanged: (newValue) {
                  _validate = false;
                  confirmPassword = newValue;
                },
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  child: Text(
                    "Email or Password not correct",
                    style: TextStyle(
                      color: _validate ? Colors.redAccent : Colors.transparent,
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Color.fromRGBO(
                  220,
                  74,
                  91,
                  1,
                ),
                onPressed: () => signUp,
                minWidth: double.infinity,
                elevation: 0,
                splashColor: Colors.transparent,
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () => {
                          Navigator.pop(
                            context,
                          )
                        },
                      )
                    ],
                  )
                ],
              ))
            ],
          )),
    );
  }

  Future<void> get signUp async {
    try {
      if (password == confirmPassword) {
        final userCredential = await auth.createUserWithEmailAndPassword(
            email: username, password: password);
        _user = userCredential.user!;
        print(_user.email);
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: HomePage(),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 500),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
