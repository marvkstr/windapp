import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:windfarmville/data/users/owner.dart';
import 'package:windfarmville/data/utility/address.dart';
import 'package:windfarmville/data/utility/geo_coordinate.dart';
import 'package:windfarmville/data/utility/unique_id.dart';
import 'package:windfarmville/config/config.dart';
import 'manufacturer.dart';

class Turbine {
  /*
  // Old attributes
  String commissioningDate;
  String electricalCapacity;
  String voltageLevel;
  String dso;
  String federalState;
  String postcode;
  String municipalityCode;
  String municipality;
  String addressOld;
  String lat;
  String lon;
  int currentOutput;
  int computedOutput;
  */

  // New attributes
  final UniqueID _id;

  String _name;
  String _note;

  Owner _owner;
  TurbineState _state = TurbineState.fine;
  Manufacturer _manufacturer;

  double _currentPowerInMegaWatts; // TODO maybe power history? <- wind speed?
  double _targetPowerInMegaWatts;

  Address _address;
  GeoCoordinate _location;

  int _yearOfConstruction;

  Turbine(this._id);

  UniqueID get id {
    return _id;
  }

  String get name {
    return _name;
  }

  double get wind_speed => 40;

  set name(String name) {
    this._name = name;
  }

  String get note {
    return _note;
  }

  set note(String note) {
    this._note = note;
  }

  Owner get owner {
    return _owner;
  }

  set owner(Owner owner) {
    this._owner = owner;
  }

  TurbineState get state {
    return _state;
  }

  set state(TurbineState state) {
    this._state = state;
  }

  Manufacturer get manufacturer {
    return _manufacturer;
  }

  set manufacturer(Manufacturer manufacturer) {
    this._manufacturer = manufacturer;
  }

  double get currentPowerInMegaWatts {
    return _currentPowerInMegaWatts;
  }

  set currentPowerInMegaWatts(double currentPowerInWegaWatts) {
    this._currentPowerInMegaWatts = currentPowerInWegaWatts;
  }

  double get targetPowerInMegaWatts {
    return _targetPowerInMegaWatts;
  }

  set targetPowerInMegaWatts(double targetPowerInMegaWatts) {
    this._targetPowerInMegaWatts = targetPowerInMegaWatts;
  }

  Address get address {
    return _address;
  }

  set address(Address address) {
    this._address = address;
  }

  GeoCoordinate get location {
    return _location;
  }

  set location(GeoCoordinate location) {
    this._location = location;
  }

  int get yearOfConstruction {
    return _yearOfConstruction;
  }

  set yearOfConstruction(int yearOfConstruction) {
    this._yearOfConstruction = yearOfConstruction;
  }
}

class TurbineState {
  static final fine = TurbineState('Fine', Config.TURBINE_FINE, Icons.check, 0);
  static final warning = TurbineState('Warning', Config.TURBINE_WARNING, Icons.warning, 1);
  static final closedDown = TurbineState('Shut Down', Config.TURBINE_CLOSEDDOWN, Icons.not_interested, 2);

  final String associatedString;
  final Color associatedColor;
  final IconData associatedIcon;
  final int sortCode;
  TextStyle associatedTextStyle;

  static List<TurbineState> registeredStates = [];

  TurbineState(this.associatedString, this.associatedColor, this.associatedIcon, this.sortCode)
      : associatedTextStyle = TextStyle(color: associatedColor, fontSize: 18) {
    registeredStates.add(this);
  }

  /// Returns all registered Turbine State sorted as defined
  static List<TurbineState> getAll() {
    List<TurbineState> clone = [];
    clone.addAll(registeredStates);
    clone.sort((b, a) => a.sortCode.compareTo(b.sortCode));
    return clone;
  }
}
