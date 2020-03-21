// TODO: Farb & Schriftanpassungen
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:windfarmville/comp/menu.dart';
import 'package:windfarmville/data/maintenance/turbine.dart';
import 'package:windfarmville/dbconnector/databaseLogin.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/main.dart';

class StatisticScreen extends StatefulWidget {
  final String windanlagenName;
  StatisticScreen({Key key, @required this.windanlagenName}) : super(key: key);

  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool boolWeek = false;
  bool boolDay = true;
  int windanlagenId;
  double ersterTag;
  double zweiterTag;
  double dritterTag;
  double vierterTag;
  double fuenfterTag;
  double sechsterTag;
  double siebterTag;
  double ersteWoche;
  double zweiteWoche;
  double dritteWoche;
  double vierteWoche;
  String windanlageDropDown;

  @override
  void initState() {
    super.initState();
    windanlageDropDown = widget.windanlagenName;
        flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    switch (windanlageDropDown) {
      case "Alle":
        windanlagenId = 0;
        break;
      case "Pustefix 3000":
        windanlagenId = 1;
        break;
      case "Pustefix 3001":
        windanlagenId = 2;
        break;
      case "Pustefix 3002":
        windanlagenId = 3;
        break;
      case "Pustefix 3003":
        windanlagenId = 4;
        break;
      case "Pustefix 3004":
        windanlagenId = 5;
        break;
      case "Pustefix 3005":
        windanlagenId = 6;
        break;
      default:
        break;
    }
    getDataFromDatabase(windanlagenId);
  }

  Future onSelectNotification(String payload) async {
    //add information here what happens if Notification got clicked
  }

  showNotification(String title, String body) async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel Name', 'CHANNEL DESCRIPTION');
    var iOS = new IOSNotificationDetails();
    var notificationDetails = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }

  //hardcoded data
  void getDataFromDatabase(int windanlagenId) {
    switch (windanlagenId) {
      case 0:
        ersterTag = 13698.00 + 13698 + 11245 + 12245 + 10346 + 15456;
        zweiterTag = 12000.00 + 14000 + 18456 + 15456 + 15456 + 17623;
        dritterTag = 15000.00 + 12034 + 12034 + 19034 + 17623 + 15000;
        vierterTag = 10000.00 + 13463 + 10000 + 16000 + 9124 + 9124;
        fuenfterTag = 13500.00 + 16342 + 12356 + 12356 + 13500 + 13500;
        sechsterTag = 12240.00 + 12346 + 13467 + 13253 + 6235 + 9124;
        siebterTag = 15000.00 + 13600 + 13600 + 10000 + 2767 + 6235;
        ersteWoche = 100500.00 + 100500 + 150004 + 143004 + 93626 + 100500;
        zweiteWoche = 95890.00 + 102153 + 120004 + 140567 + 82356 + 82356;
        dritteWoche = 90990.00 + 112314 + 99000 + 102464 + 142435 + 93626;
        vierteWoche = 92544.00 + 164325 + 99324 + 129324 + 88345 + 92544;
        break;
      case 1:
        ersterTag = 13698;
        zweiterTag = 12000;
        dritterTag = 15000;
        vierterTag = 10000;
        fuenfterTag = 13500;
        sechsterTag = 12240;
        siebterTag = 15000;
        ersteWoche = 100500;
        zweiteWoche = 95890;
        dritteWoche = 90990;
        vierteWoche = 92544;
        break;
      case 2:
        ersterTag = 13698;
        zweiterTag = 14000;
        dritterTag = 12034;
        vierterTag = 13463;
        fuenfterTag = 16342;
        sechsterTag = 12346;
        siebterTag = 13600;
        ersteWoche = 100500;
        zweiteWoche = 102153;
        dritteWoche = 112314;
        vierteWoche = 164325;
        break;
      case 3:
        ersterTag = 11245;
        zweiterTag = 18456;
        dritterTag = 12034;
        vierterTag = 10000;
        fuenfterTag = 12356;
        sechsterTag = 13467;
        siebterTag = 13600;
        ersteWoche = 150004;
        zweiteWoche = 120004;
        dritteWoche = 99000;
        vierteWoche = 99324;
        break;
      case 4:
        ersterTag = 12245;
        zweiterTag = 15456;
        dritterTag = 19034;
        vierterTag = 16000;
        fuenfterTag = 12356;
        sechsterTag = 13253;
        siebterTag = 10000;
        ersteWoche = 143004;
        zweiteWoche = 140567;
        dritteWoche = 102464;
        vierteWoche = 129324;
        break;
      case 5:
        ersterTag = 10346;
        zweiterTag = 15456;
        dritterTag = 17623;
        vierterTag = 9124;
        fuenfterTag = 8365;
        sechsterTag = 6235;
        siebterTag = 2767;
        ersteWoche = 93626;
        zweiteWoche = 82356;
        dritteWoche = 142435;
        vierteWoche = 88345;
        break;
      case 6:
        ersterTag = 15456;
        zweiterTag = 17623;
        dritterTag = 15000;
        vierterTag = 9124;
        fuenfterTag = 13500;
        sechsterTag = 9124;
        siebterTag = 6235;
        ersteWoche = 100500;
        zweiteWoche = 142435;
        dritteWoche = 93626;
        vierteWoche = 92544;
        break;
      default:
        break;
    }
  }

  /*
  void getDataFromDatabase(int windanlagenId) async {
    if (windanlagenId == 0) {
      var results1 = await getStatistikQuery(1);
      var results2 = await getStatistikQuery(2);
      var results3 = await getStatistikQuery(3);
      var results4 = await getStatistikQuery(4);
      var results5 = await getStatistikQuery(5);
      for (var row in results1) {
        ersterTag = row[1];
        zweiterTag = row[2];
        dritterTag = row[3];
        vierterTag = row[4];
        fuenfterTag = row[5];
        sechsterTag = row[6];
        siebterTag = row[7];
        ersteWoche = row[8];
        zweiteWoche = row[9];
        dritteWoche = row[10];
        vierteWoche = row[11];
      }
      for (var row in results2) {
        ersterTag = ersterTag + row[1];
        zweiterTag = zweiterTag + row[2];
        dritterTag = dritterTag + row[3];
        vierterTag = vierterTag + row[4];
        fuenfterTag = fuenfterTag + row[5];
        sechsterTag = sechsterTag + row[6];
        siebterTag = siebterTag + row[7];
        ersteWoche = ersteWoche + row[8];
        zweiteWoche = zweiteWoche + row[9];
        dritteWoche = dritteWoche + row[10];
        vierteWoche = vierteWoche + row[11];
      }
      for (var row in results3) {
        ersterTag = ersterTag + row[1];
        zweiterTag = zweiterTag + row[2];
        dritterTag = dritterTag + row[3];
        vierterTag = vierterTag + row[4];
        fuenfterTag = fuenfterTag + row[5];
        sechsterTag = sechsterTag + row[6];
        siebterTag = siebterTag + row[7];
        ersteWoche = ersteWoche + row[8];
        zweiteWoche = zweiteWoche + row[9];
        dritteWoche = dritteWoche + row[10];
        vierteWoche = vierteWoche + row[11];
      }
      for (var row in results4) {
        ersterTag = ersterTag + row[1];
        zweiterTag = zweiterTag + row[2];
        dritterTag = dritterTag + row[3];
        vierterTag = vierterTag + row[4];
        fuenfterTag = fuenfterTag + row[5];
        sechsterTag = sechsterTag + row[6];
        siebterTag = siebterTag + row[7];
        ersteWoche = ersteWoche + row[8];
        zweiteWoche = zweiteWoche + row[9];
        dritteWoche = dritteWoche + row[10];
        vierteWoche = vierteWoche + row[11];
      }
      for (var row in results5) {
        ersterTag = ersterTag + row[1];
        zweiterTag = zweiterTag + row[2];
        dritterTag = dritterTag + row[3];
        vierterTag = vierterTag + row[4];
        fuenfterTag = fuenfterTag + row[5];
        sechsterTag = sechsterTag + row[6];
        siebterTag = siebterTag + row[7];
        ersteWoche = ersteWoche + row[8];
        zweiteWoche = zweiteWoche + row[9];
        dritteWoche = dritteWoche + row[10];
        vierteWoche = vierteWoche + row[11];
        setState(() => this.ersterTag = ersterTag); //updated View
      }
    } else {
      var results = await getStatistikQuery(windanlagenId);
      for (var row in results) {
        ersterTag = row[1];
        zweiterTag = row[2];
        dritterTag = row[3];
        vierterTag = row[4];
        fuenfterTag = row[5];
        sechsterTag = row[6];
        siebterTag = row[7];
        ersteWoche = row[8];
        zweiteWoche = row[9];
        dritteWoche = row[10];
        vierteWoche = row[11];
        setState(() => this.ersterTag = ersterTag); //MagieZeile updated View
      }
    }
  }
  */
  @override
  build(BuildContext context) {
    var series;
    var dataDay = [
      new EnergyDay(new DateTime(2020, 1, 24), ersterTag),
      new EnergyDay(new DateTime(2020, 1, 25), zweiterTag),
      new EnergyDay(new DateTime(2020, 1, 26), dritterTag),
      new EnergyDay(new DateTime(2020, 1, 27), vierterTag),
      new EnergyDay(new DateTime(2020, 1, 28), fuenfterTag),
      new EnergyDay(new DateTime(2020, 1, 29), sechsterTag),
      new EnergyDay(new DateTime(2020, 1, 30), siebterTag),
    ];

    var dataWeek = [
      new EnergyWeek(2, ersteWoche),
      new EnergyWeek(3, zweiteWoche),
      new EnergyWeek(4, dritteWoche),
      new EnergyWeek(5, vierteWoche),
    ];

    if (boolDay) {
      series = [
        new charts.Series(
          domainFn: (EnergyDay dayData, _) => dayData.day,
          measureFn: (EnergyDay dayData, _) => dayData.power,
          colorFn: (EnergyDay dayData, _) => dayData.color,
          id: 'EnergyDay',
          data: dataDay,
        ),
      ];
    } else {
      series = [
        new charts.Series(
          domainFn: (EnergyWeek weekData, _) => weekData.week,
          measureFn: (EnergyWeek weekData, _) => weekData.power,
          colorFn: (EnergyWeek weekData, _) => weekData.color,
          id: 'EnergyWeek',
          data: dataWeek,
        ),
      ];
    }

    return new Scaffold(
        drawer: MyDrawer().setDrawer(context),
        appBar: MyAppBar().setAppBar("Statistics"),
        resizeToAvoidBottomInset: false,
        body: new Container(
          color: Config.LIGHT_BLUE,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                  color: Config.BACKGROUND_COLOR,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: DropdownButton<String>(
                        value: windanlageDropDown,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 20,
                        elevation: 24,
                        style: Config.BLACK_HIND_SEMIBOLD_18,
                        onChanged: (String newValue) {
                          setState(() {
                            windanlageDropDown = newValue;

                            switch (windanlageDropDown) {
                              case "Alle":
                                windanlagenId = 0;
                                break;
                              case "Pustefix 3000":
                                windanlagenId = 1;
                                break;
                              case "Pustefix 3001":
                                windanlagenId = 2;
                                break;
                              case "Pustefix 3002":
                                windanlagenId = 3;
                                break;
                              case "Pustefix 3003":
                                windanlagenId = 4;
                                break;
                              case "Pustefix 3004":
                                windanlagenId = 5;
                                break;
                              case "Pustefix 3005":
                                windanlagenId = 6;
                                break;
                              default:
                                break;
                            }
                            getDataFromDatabase(windanlagenId);
                          });
                        },
                        items: <String>[
                          'Alle',
                          'Pustefix 3000',
                          'Pustefix 3001',
                          'Pustefix 3002',
                          'Pustefix 3003',
                          'Pustefix 3004',
                          'Pustefix 3005'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: Config.GREY_HIND_LIGHT_14,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Day",
                            style: Config.GREY_HIND_LIGHT_14,
                          ),
                          Checkbox(
                            value: boolDay,
                            activeColor: Config.MAIN_COLOR,
                            onChanged: (bool value) {
                              setState(() {
                                boolDay = value;
                                boolWeek = !value;
                              });
                            },
                          ),
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Week",
                            style: Config.GREY_HIND_LIGHT_14,
                          ),
                          Checkbox(
                            value: boolWeek,
                            activeColor: Config.MAIN_COLOR,
                            onChanged: (bool value) {
                              setState(() {
                                boolWeek = value;
                                boolDay = !value;
                                showNotification("Anlagendefekt", "Anlage: Pustefix 3003 defekt");
                                for (var dataSet in Config.exampleTurbines) {
                                  if(dataSet["name"]== "Pustefix 3003"){
                                    dataSet["state"] = TurbineState.closedDown;
                                    dataSet["note"] = "Error 800: Der Impuls des Rotors ist defekt";
                                    dataSet["currentPowerInMegaWatts"] = 0.0;
                                  }
                                }
                              });
                            },
                          ),
                        ])
                  ],
                ),
              ),
              if (boolDay)
                SizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
                      color: Config.BACKGROUND_COLOR,
                    ),
                    height: 300.0,
                    child: createTimeChart(series),
                  )
                ),
              if (boolWeek)
                SizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
                      color: Config.BACKGROUND_COLOR,
                    ),
                    height: 300.0,
                    child: createLineChart(series),
                  )
                ),
            ]),
          ),
        ));
  }
}

charts.LineChart createLineChart(var series) {
  charts.LineChart lineChart;
  //TODO Anzeige der Achsenbeschriftung
  return lineChart = charts.LineChart(series,
      animate: false,
      domainAxis: new charts.NumericAxisSpec(
          // Set the initial viewport by providing a new AxisSpec with the
          // desired viewport, in NumericExtents.
          viewport: new charts.NumericExtents(2.0, 5.0)));
}

charts.TimeSeriesChart createTimeChart(var series) {
  charts.TimeSeriesChart timeChart;
  return timeChart = charts.TimeSeriesChart(series,
      animate: false,
      domainAxis: new charts.DateTimeAxisSpec(
          tickProviderSpec: charts.DayTickProviderSpec(increments: [1])));
}

class EnergyWeek {
  final int week;
  final double power;
  final charts.Color color = new charts.Color(r: 41, g: 148, b: 195);
  EnergyWeek(this.week, this.power);
}

class EnergyDay {
  final DateTime day;
  final double power;
  final charts.Color color = new charts.Color(r: 41, g: 148, b: 195);
  EnergyDay(this.day, this.power);
}
