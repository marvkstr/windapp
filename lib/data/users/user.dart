import 'package:windfarmville/data/utility/address.dart';
import 'package:windfarmville/data/utility/unique_id.dart';

abstract class User {
  final UniqueID _id;
  String _name, _surname;
  String _password;
  String _email;
  Address _address;
  String _phoneNumber;

  User(this._id);

  UniqueID get id {
    return _id;
  }

  String get name {
    return _name;
  }

  set name(String name) {
    this._name = name;
  }

  String get surname {
    return _surname;
  }

  set surname(String surname) {
    this._surname = surname;
  }

  String get password {
    return _password;
  }

  set password(String password) {
    this._password = password;
  }

  String get email {
    return _email;
  }

  set email(String email) {
    this._email = email;
  }

  Address get address {
    return _address;
  }

  set address(Address address) {
    this._address = address;
  }

  String get phoneNumber {
    return _phoneNumber;
  }

  set phoneNumber(String phoneNumber) {
    this._phoneNumber = phoneNumber;
  }

  void changeProfile();
}
