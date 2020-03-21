import 'package:windfarmville/data/maintenance/order.dart';
import 'package:windfarmville/data/users/user.dart';
import 'package:windfarmville/data/utility/unique_id.dart';

class Technician extends User{
  List<Order> _orders;

  Technician(UniqueID userID) : super(userID)
  {
    _orders = [];
  }

  List<Order> orders(){
    List <Order> clone = [];
    clone.addAll(_orders);
    return clone;
  }

  @override
  void changeProfile() {

  }
}