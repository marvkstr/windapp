import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:windfarmville/views/createorder.dart';
import 'package:windfarmville/views/forgotpassword.dart';
import 'package:windfarmville/views/order_board.dart';
import 'package:windfarmville/views/splashscreen.dart';
import 'package:windfarmville/views/dashboard.dart';
import 'package:windfarmville/views/login.dart';
import 'package:windfarmville/views/profil.dart';
import 'package:windfarmville/views/statistic.dart';
//import 'package:workmanager/workmanager.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future onSelectNotification(String payload) async {
  //add information here what happens if Notification got clicked
  print("Notification got clicked"+ payload);
}

showNotification(String title, String body) async {
  if (flutterLocalNotificationsPlugin == null) {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var androidSetting =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosSetting = new IOSInitializationSettings();
    var initializationSettings =
        new InitializationSettings(androidSetting, iosSetting);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }
  var android = new AndroidNotificationDetails(
      'channel id', 'channel Name', 'CHANNEL DESCRIPTION');
  var iOS = new IOSNotificationDetails();
  var notificationDetails = new NotificationDetails(android, iOS);
  await flutterLocalNotificationsPlugin.show(
      0, title, body, notificationDetails,payload: "Hello");
}

/* Pushbenachrichtigungen für
  Nachrichten
  Windturbine Statusveränderungen
  Auftragsstatusänderungen
*/

/*void callbackDispatcher() {
  Workmanager.executeTask((task, inputData) async {
    if (task == "") { // Hier GetMessages einfürgen
      FirebaseUser user = (await _auth.currentUser());
      if (user != null) {
            String titleNotification="";
            String bodyNotification="";
            await Firestore.instance.collection('messages').getDocuments().then((QuerySnapshot querySnapshot){
            List<DocumentSnapshot> docs = querySnapshot.documents;
            docs.sort((a, b) => a.data['time']
                .compareTo(b.data['time'])); //Sortiert Nachrichten nach Zeit
            //creates Notification for last Message from opponend
            if (user.email != docs.last.data['from']) {
              titleNotification =
                  "Neue Nachricht von: " + docs.last.data['from'];
              bodyNotification = docs.last.data['text'];
            }
            });
          if(titleNotification!=""){
          //showNotification(titleNotification, bodyNotification);
          }
        }
    } else {
      print(
          "Native called background task: $task"); //simpleTask will be emitted here.
    }
    return true;
  });
} */

void main() {
  /*WidgetsFlutterBinding.ensureInitialized();
  Workmanager.initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          false // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );*/
  runApp(new App());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);  //Locks App in vertical mode
  //Workmanager.registerOneOffTask('1', 'GetMessages'); // prüft nur wenn app gestartet wird
  //Workmanager.registerPeriodicTask('2', 'GetMessages'); // Prüft alle 15 Minuten
}

//Runnable App
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*theme: defaultTargetPlatform == TargetPlatform.iOS
        ? Config.kIOSTheme
        : Config.kDefaultTheme,*/
      debugShowCheckedModeBanner: false,
      // Start the app with the "/" named route. In this case, the app starts
      // on the SplashScreen widget.
      initialRoute: '/',
      routes: { // TODO update routes for new screens
        // When navigating to the "/" route, build the SplashScreen widget.
        '/': (context) => SplashScreen(),

        "/login": (context) => LoginScreen(),
        "/splashscreen": (context) => SplashScreen(),
        "/profile": (context) => ProfilScreen(),
        "/dashboard": (context) => Dashboard(),
        "/orders": (context) => OrderBoard(),
        "/forgot_password": (context) => ForgotPasswordScreen(),
        //"/windturbine": (context) => WindturbineScreen(),
        "/createorder": (context) => CreateOrder(),
        //"/statistic": (context) => StatisticScreen(),
      },
    );
  }
}
