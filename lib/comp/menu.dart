import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/config/strings.dart';
import 'package:windfarmville/views/statistic.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class MyAppBar {
  setAppBar(String title) {
    return new AppBar(
      backgroundColor: Config.MAIN_COLOR,
      title: Row(
        children: <Widget>[
          new Text(title, style: Config.WHITE_EXO2_22),
        ],
      ),
    );
  }
}

class MyDrawer {
  setDrawer(context) {
    return new Drawer(
      child: Container(
        color: Config.LIGHT_BLUE,
        child: ListView(children: <Widget>[
          new DrawerHeader(
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage(
                          'assets/images/App_icon.png'),height: 100,),
                    Container(
                      child: new Text(
                          Config.name,
                          style: Config.WHITE_EXO2_22
                      ),padding: EdgeInsets.fromLTRB(0, 5, 0, 0),),
                  ],
                ),
              ),
              decoration: new BoxDecoration(
                color: Config.MAIN_COLOR,
              )),
          if (Config.userType == "owner")
            new ListTile(
              //no technician
              title: new Text(
                  Strings.TURBINES,
                  style: Config.BLACK_HIND_REGULAR_18,
              ),
              onTap: () {
                Navigator.pushNamed(context, "/dashboard");
              },
            ),
          if (Config.userType == "owner")
            new ListTile(
              //no technician
              title: new Text(
                "Statistics",
                style: Config.BLACK_HIND_REGULAR_18,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => StatisticScreen(windanlagenName: "Alle")
              ));
              },
            ),
          new ListTile(
            title: new Text(
              "Profile",
              style: Config.BLACK_HIND_REGULAR_18,
            ),
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
          ),
          new ListTile(
            title: new Text(
                "Orders",
              style: Config.BLACK_HIND_REGULAR_18,
            ),
            onTap: () {
              Navigator.pushNamed(context, "/orders");
            },
          ),
          new ListTile(
            title: new Text(
                "Logout",
              style: Config.BLACK_HIND_REGULAR_18,
            ),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              final key = "UserType";
              prefs.setString(key,'');
              _auth.signOut();
              Navigator.pushNamed(context, "/login");
            },
          ),
        ]),
      ),
    );
  }
}
