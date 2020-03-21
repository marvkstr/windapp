import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windfarmville/config/config.dart';
import 'dart:async';
import 'package:windfarmville/views/login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SplashScreen extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
      Timer(
        Duration(seconds: 3),
        () => checkLogin());
  }

  void checkLogin() async{
    if(_auth.currentUser() == null){ // User not logged in
      Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }else{ // user logged in
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString("UserType") ?? '';
      if(value == 'owner'){ //user is owner
        Config.userType = "owner";
        Navigator.pushNamed(context, "/dashboard");
      }else
      if(value == 'technician'){ // user is technician
        Config.userType = "technician";
        Navigator.pushNamed(context, "/orders");
      }else{
        if(value==''){// Error catch if signOut in Menu not worked
        _auth.signOut();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
            } 
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                        'assets/images/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        
                        CircleAvatar(
                          backgroundColor: Config.BACKGROUND_COLOR,
                          radius: 70.0,
                          child: Image(image: AssetImage(
                            'assets/images/App_icon.png')), //ToDo: statt dem Appicon später richtiges Icon benutzen - was spricht gegen dieses icon?
                          //child: Icon(
                          //  Logotest2.logotest2,
                          //  color: Config.accentcolor,
                          //  size: 100.0,
                          //),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text(
                          Config.name,
                          style: Config.BLUE_EXO2_35,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Config.MAIN_COLOR),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
