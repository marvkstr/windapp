import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/config/strings.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: new Container(
            alignment: Alignment.center,
            color: Config.BACKGROUND_COLOR,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 75, left: 40.0, bottom: 10, right: 40.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image(
                        image: AssetImage('assets/images/App_icon.png'),
                        height: 100,
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                        child: Text(Config.name, style: Config.BLUE_EXO2_35)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 25, left: 40.0, bottom: 10, right: 40.0),
                child: new TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelStyle: Config.GREY_HIND_LIGHT_14,
                    hintStyle: Config.GREY_HIND_LIGHT_8,
                    labelText: Strings.EMAIL,
                    prefixIcon: Icon(Icons.mail_outline),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 10, left: 40.0, bottom: 10, right: 40.0),
                child: new TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelStyle: Config.GREY_HIND_LIGHT_14,
                    hintStyle: Config.GREY_HIND_LIGHT_8,
                    labelText: Strings.PASSWORD,
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 7, left: 70.0, bottom: 2, right: 70.0),
                width: double.infinity,
                height: 60,
                child: new RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Config.BUTTON_COLOR,
                  onPressed: () {
                    if (usernameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      _loginUser(usernameController.text.trimRight(),
                          passwordController.text.trimRight(), context);
                    }
                  },
                  child: new Text(Strings.LOGIN,
                      style: Config.WHITE_HIND_BUTTON),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: new InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/forgot_password");
                        },
                        child: new Text(
                          Strings.FORGOT_PASSWORD + '?',
                          style: TextStyle(
                              color: Config.BUTTON_COLOR, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }

  void _loginUser(String email, String password, BuildContext context) async {
    FirebaseUser user;
    //logs in the user and catches errors
    try {
      user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
    } catch (e) {
      String errorMessage = "";
      if (e.toString() ==
              "PlatformException(ERROR_INVALID_EMAIL, The email address is badly formatted., null)" ||
          e.toString() ==
              "PlatformException(ERROR_WRONG_PASSWORD, The password is invalid or the user does not have a password., null)") {
        errorMessage = "Falsches Passwort oder Falscher Benutzername";
      } else {
        errorMessage = "Keine Internetverbindung";
      }
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(errorMessage),
            );
          });
    }

    //TODO Abfrage welche Berechtigung besteht über eigene Datenbank
    if (user != null) {
      if (email == "kunde@test.com") {
        Config.userType = "owner";
        writeToSharedPreferences("owner");
        Navigator.pushNamed(context, "/dashboard");
      }
      if (email == "techniker@test.com") {
        Config.userType = "technician";
        writeToSharedPreferences("technician");
        Navigator.pushNamed(context, "/orders");
      }
    }
  }

  void writeToSharedPreferences(String userType) async {
    // writes userType in local Repository
    final prefs = await SharedPreferences.getInstance();
    final key = "UserType";
    final value = userType;
    prefs.setString(key, value);
  }
}
