import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:windfarmville/data/maintenance/manufacturer.dart';
import 'package:windfarmville/data/maintenance/turbine.dart';
import 'package:windfarmville/data/users/owner.dart';
import 'package:windfarmville/data/utility/address.dart';
import 'package:windfarmville/data/utility/geo_coordinate.dart';
import 'package:windfarmville/data/utility/unique_id.dart';

class Config {
  static const String name = "WindTech";

  static const Color MAIN_COLOR = Color.fromRGBO(41, 148, 195, 1); // Blau - ACCENT
  static const Color BACKGROUND_COLOR = Colors.white; // Weiß - COUNTER
  static const Color LIGHT_BLUE = Color.fromRGBO(181, 209, 226, 1); // Hellblau
  static const Color BEIGE = Color.fromRGBO(209, 189, 174, 1); //Beige
  static const Color BUTTON_COLOR =  Color.fromRGBO(21,154,208,1);

  static const Color TURBINE_FINE = Color.fromRGBO(24, 164, 129, 1); //GRÜN
  static const Color TURBINE_WARNING = Color.fromRGBO(255, 228, 123, 1); //GELB
  static const Color TURBINE_CLOSEDDOWN = Color.fromRGBO(218, 64, 77, 1); //ROT

  static String userType = "";

  static const TextStyle BLUE_EXO2_35 = TextStyle( //LOGO
    color: MAIN_COLOR,
    fontSize: 35.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Exo2',
  );

  static const TextStyle WHITE_EXO2_22 = TextStyle( // AppBar & DrawerLogo
    color: BACKGROUND_COLOR,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontFamily: 'Exo2,'
  );

  static const TextStyle BLACK_HIND_REGULAR_18 = TextStyle( //Menu
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: 'Hind',
  );

  static const TextStyle BLACK_HIND_SEMIBOLD_18 = TextStyle( //Menu
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Hind',
  );

  static const TextStyle BLACK_HIND_SEMIBOLD_24 = TextStyle( //Menu
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'Hind',
  );

  static const TextStyle BLACK_HIND_LIGHT_14 = TextStyle( // Descriptions
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w200,
    fontFamily: 'Hind',
  );

  static const TextStyle GREY_HIND_LIGHT_30 = TextStyle( //Menu
    color: Colors.grey,
    fontSize: 30,
    fontWeight: FontWeight.w200,
    fontFamily: 'Hind',
  );

  static const TextStyle GREY_HIND_LIGHT_14 = TextStyle( //Menu
    color: Colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w200,
    fontFamily: 'Hind',
  );

  static const TextStyle GREY_HIND_LIGHT_8 = TextStyle( //Menu
    color: Colors.grey,
    fontSize: 8,
    fontWeight: FontWeight.w200,
    fontFamily: 'Hind',
  );

  static const TextStyle BLUE_HIND_SEMIBOLD_18 = TextStyle(
    color: MAIN_COLOR,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Hind',
  );

  static const TextStyle WHITE_HIND_BUTTON = TextStyle(
    color: BACKGROUND_COLOR,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    fontFamily: 'Exo2',
  );

  static var exampleTurbines = {
    {
      'name': 'Pustefix 3000',
      'note': '',
      'owner': Owner(UniqueID()),
      'state': TurbineState.warning,
      'manufacturer': Manufacturer.VESTAS,
      'currentPowerInMegaWatts': 3.14,
      'targetPowerInMegaWatts': 4.0,
      'address': Address('Germany', 'Schleswig-Holstein', 25335, 'Elmshorn',
          'Wrangelpromenade', 13),
      'location': GeoCoordinate("4123213", "123213"),
      'yearOfConstruction': 1963,
    },
    {
      'name': 'Pustefix 3001',
      'note': 'That rubber thingy is squeaking again',
      'owner': Owner(UniqueID()),
      'state': TurbineState.warning,
      'manufacturer': Manufacturer.VESTAS,
      'currentPowerInMegaWatts': 3.14,
      'targetPowerInMegaWatts': 4.0,
      'address': Address('Germany', 'Schleswig-Holstein', 25335, 'Elmshorn',
          'Wrangelpromenade', 13),
      'location': GeoCoordinate("4123213", "123213"),
      'yearOfConstruction': 1963,
    },
    {
      'name': 'Pustefix 3002',
      'note': '',
      'owner': Owner(UniqueID()),
      'state': TurbineState.fine,
      'manufacturer': Manufacturer.VESTAS,
      'currentPowerInMegaWatts': 3.14,
      'targetPowerInMegaWatts': 4.0,
      'address': Address('Germany', 'Schleswig-Holstein', 25335, 'Elmshorn',
          'Telegraph Ave.', 13),
      'location': GeoCoordinate("4123213", "123213"),
      'yearOfConstruction': 1963,
    },
    {
      'name': 'Pustefix 3003',
      'note': '',
      'owner': Owner(UniqueID()),
      'state': TurbineState.fine,
      'manufacturer': Manufacturer.VESTAS,
      'currentPowerInMegaWatts': 3.14,
      'targetPowerInMegaWatts': 4.0,
      'address': Address('Germany', 'Schleswig-Holstein', 25335, 'Elmshorn',
          'Wrangelpromenade', 13),
      'location': GeoCoordinate("4123213", "123213"),
      'yearOfConstruction': 1963,
    },
    {
      'name': 'Pustefix 3004',
      'note': '',
      'owner': Owner(UniqueID()),
      'state': TurbineState.fine,
      'manufacturer': Manufacturer.VESTAS,
      'currentPowerInMegaWatts': 3.14,
      'targetPowerInMegaWatts': 4.0,
      'address': Address('Germany', 'Schleswig-Holstein', 25335, 'Elmshorn',
          'Wrangelpromenade', 13),
      'location': GeoCoordinate("4123213", "123213"),
      'yearOfConstruction': 1963,
    },
    {
      'name': 'Pustefix 3005',
      'note': '',
      'owner': Owner(UniqueID()),
      'state': TurbineState.fine,
      'manufacturer': Manufacturer.VESTAS,
      'currentPowerInMegaWatts': 3.14,
      'targetPowerInMegaWatts': 4.0,
      'address': Address('Germany', 'Schleswig-Holstein', 25335, 'Elmshorn',
          'Wrangelpromenade', 13),
      'location': GeoCoordinate("4123213", "123213"),
      'yearOfConstruction': 1963,
    },
  };

  static var exampleOrders = {
    {
      'title': 'Rotorimpuls defekt',
      'description': 'Error 800: Der Impuls des Rotors ist defekt',
    },
  };

  static var cardOrder = {
    TurbineState.fine : ['overview', 'output_large', 'details'],
    TurbineState.warning : ['overview', 'error','order', 'output_small', 'details'],
    TurbineState.closedDown : ['overview', 'error', 'order', 'output_small', 'details'],
  };

  @deprecated
  static var dummyData = {
    {
      "commissioning_date": "2018-12-19",
      "electrical_capacity": "3,6",
      "voltage_level": "medium voltage",
      "dso": "Mitteldeutsche Netzgesellschaft Strom mbH",
      "federal_state": "Sachsen-Anhalt",
      "postcode": 6179,
      "municipality_code": 15088365,
      "municipality": "Teuschenthal",
      "address": "Flstk.: 363, Flur: 1, Gmkg.: Teutschenthal -",
      "lat": "51,44312146",
      "lon": "11,79945026",
      "current_output": 12,
      "computed_output": 125,
    },
    {
      "commissioning_date": "2018-12-19",
      "electrical_capacity": "4",
      "voltage_level": "high voltage",
      "dso": "E.DIS Netz GmbH",
      "federal_state": "Brandenburg",
      "postcode": 17291,
      "municipality_code": 12073216,
      "municipality": "Göritz",
      "address": "Gemarkung Tornow, Flur 1, Flurstück 400 siehe Straße",
      "lat": "53,28528215",
      "lon": "13,92949647",
      "current_output": 130,
      "computed_output": 133,
    },
    {
      "commissioning_date": "2018-12-20",
      "electrical_capacity": "2,35",
      "voltage_level": "medium voltage",
      "dso": "E.DIS Netz GmbH",
      "federal_state": "Mecklenburg-Vorpommern",
      "postcode": 18233,
      "municipality_code": 13072074,
      "municipality": "Neubukow",
      "address": "Gemarkung Neubukow, Flur 1, Flurstück 83 siehe Straße",
      "lat": "54,01374969",
      "lon": "11,68962555",
      "current_output": 120,
      "computed_output": 100,
    },
    {
      "commissioning_date": "2018-12-21",
      "electrical_capacity": "2,35",
      "voltage_level": "medium voltage",
      "dso": "Schleswig-Holstein Netz AG",
      "federal_state": "Schleswig-Holstein",
      "postcode": 25774,
      "municipality_code": 1051047,
      "municipality": "Hemme",
      "address": "an der B5 Flurstück 77 Gemarkung Hemme Flur 1 Außenbereich",
      "lat": "54,29390536",
      "lon": "8,98405699",
      "current_output": 0,
      "computed_output": 60,
    },
    {
      "commissioning_date": "2018-12-27",
      "electrical_capacity": "3,6",
      "voltage_level": "high voltage",
      "dso": "Avacon Netz GmbH",
      "federal_state": "Niedersachsen",
      "postcode": 49751,
      "municipality_code": 3454047,
      "municipality": "Sögel",
      "address": "Gemarkung Sögel, Flur 62, Flur 9/2 -",
      "lat": "52,84714467",
      "lon": "7,51973386",
      "current_output": 80,
      "computed_output": 100,
    },
    {
      "commissioning_date": "2018-12-28",
      "electrical_capacity": "3,45",
      "voltage_level": "medium voltage",
      "dso": "EnergieNetz Mitte GmbH",
      "federal_state": "Hessen",
      "postcode": 36289,
      "municipality_code": 6632006,
      "municipality": "Friedewald",
      "address": "Gemarkung Friedewald, Fl. 2, Flst. 5/4 Aussenbereich",
      "lat": "50,87359837",
      "lon": "9,86237485",
      "current_output": 75,
      "computed_output": 75,
    },
    {
      "commissioning_date": "2018-12-29",
      "electrical_capacity": "3,45",
      "voltage_level": "medium voltage",
      "dso": "EnergieNetz Mitte GmbH",
      "federal_state": "Hessen",
      "postcode": 36289,
      "municipality_code": 6632006,
      "municipality": "Friedewald",
      "address": "Gemarkung Friedewald, Fl. 2, Flst. 5/4 Aussenbereich",
      "lat": "50,87359837",
      "lon": "9,86237485",
      "current_output": 64,
      "computed_output": 65,
    },
    {
      "commissioning_date": "2018-12-29",
      "electrical_capacity": "3,45",
      "voltage_level": "medium voltage",
      "dso": "EnergieNetz Mitte GmbH",
      "federal_state": "Hessen",
      "postcode": 36289,
      "municipality_code": 6632002,
      "municipality": "Friedewald",
      "address": "Gemarkung Friedewald, Fl. 2, Flst. 23/9 Aussenbereich",
      "lat": "50,87359837",
      "lon": "9,86237485",
      "current_output": 99,
      "computed_output": 99,
    },
    {
      "commissioning_date": "2018-12-29",
      "electrical_capacity": "3,45",
      "voltage_level": "medium voltage",
      "dso": "EnergieNetz Mitte GmbH",
      "federal_state": "Hessen",
      "postcode": 36289,
      "municipality_code": 6632006,
      "municipality": "Friedewald",
      "address": "Gemarkung Friedewald, Fl. 2, Flst. 5/4 Aussenbereich",
      "lat": "50,87359837",
      "lon": "9,86237485",
      "current_output": 75,
      "computed_output": 125,
    },
    {
      "commissioning_date": "2018-12-29",
      "electrical_capacity": "3,45",
      "voltage_level": "medium voltage",
      "dso": "EnergieNetz Mitte GmbH",
      "federal_state": "Hessen",
      "postcode": 36289,
      "municipality_code": 6632002,
      "municipality": "Friedewald",
      "address": "Gemarkung Friedewald, Fl. 2, Flst. 23/9 Aussenbereich",
      "lat": "50,87359837",
      "lon": "9,86237485",
      "current_output": 12,
      "computed_output": 120,
    },
    {
      "commissioning_date": "2018-12-30",
      "electrical_capacity": "4,2",
      "voltage_level": "high voltage",
      "dso": "E.DIS Netz GmbH",
      "federal_state": "Brandenburg",
      "postcode": 16356,
      "municipality_code": 12060005,
      "municipality": "Blumberg",
      "address": "Gemarkung Blumberg, Flur 6, Flurstück 53 ohne",
      "lat": "52,65104248",
      "lon": "13,70815916",
      "current_output": 10,
      "computed_output": 150,
    }
  };
}