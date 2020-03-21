import 'package:windfarmville/data/maintenance/turbine.dart';
import 'package:windfarmville/data/users/user.dart';
import 'package:windfarmville/data/utility/unique_id.dart';

class Owner extends User{
  List<Turbine> _turbines;

  Owner(UniqueID userID) : super(userID)
  {
    _turbines = [];
  }

  /// Returns a list with all turbines in possession of this owner
  ///
  /// Note that this is a shallow clone
  /// Changes to the list will not effect the actual list of turbines
  /// Changes to the individual turbines will effect those
  List<Turbine> get turbines{
    List <Turbine> clone = [];
    clone.addAll(_turbines);
    return clone;
  }

  void addTurbine(Turbine turbine){
    if (turbine.owner != null) throw ArgumentError("The turbine " + turbine.id.toString() + " has already been assigned to the owner " + id.toString());

    _turbines.add(turbine);
    turbine.owner = this;
  }

  void removeTurbine(int index){
    if (index < 0) throw ArgumentError("Index may not be smaller than 0: index = " + index.toString());
    if (index >= _turbines.length) throw ArgumentError("Index must be smaller than length: index = " + index.toString() + " >= " + _turbines.length.toString());

    var toRemove = _turbines[index];
    _turbines.remove(toRemove);
    toRemove.owner = null;
  }

  @override
  void changeProfile() {

  }
}