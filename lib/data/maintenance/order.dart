import 'package:windfarmville/data/maintenance/turbine.dart';
import 'package:windfarmville/data/users/technician.dart';
import 'package:windfarmville/data/utility/unique_id.dart';


class Order{
  final UniqueID _id;

  String _title;
  String _description;

  final DateTime _creationTime;
  DateTime _maintenanceTime;

  final Turbine _turbine;
  final Technician _technician;

  Order(this._id, this._turbine, this._technician) : _creationTime = DateTime.now();

  UniqueID get id{
    return _id;
  }

  String get title{
    return _title;
  }

  set title(String title){
    this._title = title;
  }

  String get description{
    return _description;
  }

  set description(String description){
    this._description = description;
  }

  DateTime get creationTime{
    return _creationTime;
  }

  DateTime get maintenanceTime{
    return _maintenanceTime;
  }

  set maintenanceTime(DateTime maintenanceTime){
    this._maintenanceTime = maintenanceTime;
  }

  get turbine{
    return _turbine;
  }

  get technician{
    return _technician;
  }
}