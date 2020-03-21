import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:windfarmville/comp/menu.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/config/strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: MyAppBar().setAppBar(Strings.FORGOT_PASSWORD),
        body: new Container(
          alignment: Alignment.center,
          color: Config.BACKGROUND_COLOR,
          child: Column(children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                width: double.infinity,
                child: new Text(
                  Strings.SENT_RECOVERY_EMAIL,
                  style: Config.BLACK_HIND_SEMIBOLD_18,
                )),

            //Email
            Container(
              padding:
                  EdgeInsets.only(top: 75, left: 40.0, bottom: 10, right: 40.0),
              child: new TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelStyle: Config.GREY_HIND_LIGHT_14,
                  hintStyle: Config.GREY_HIND_LIGHT_8,
                  labelText: Strings.EMAIL,
                  prefixIcon: Icon(Icons.account_box),
                ),
              ),
            ),

            //Password zurücksetzen
            Container(
              padding: EdgeInsets.only(
                  top: 7, left: 70.0, bottom: 2, right: 70.0),
              width: double.infinity,
              height: 60,
              child: new RaisedButton(
                color: Config.MAIN_COLOR,
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
                child: new Text(Strings.RESET,
                    style: Config.WHITE_HIND_BUTTON),
              ),
            ),
          ]),
        ));
  }
}
