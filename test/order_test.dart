import 'package:flutter_test/flutter_test.dart';
import 'package:windfarmville/data/maintenance/order.dart';
import 'package:windfarmville/data/maintenance/turbine.dart';
import 'package:windfarmville/data/users/technician.dart';
import 'package:windfarmville/data/utility/unique_id.dart';

void main(){
  group('Order field inits', (){
    UniqueID uniqueID = UniqueID();
    Turbine turbine = Turbine(UniqueID());
    Technician technician = Technician(UniqueID());
    Order order = Order(uniqueID, turbine, technician);

    test('uniqueId must be properly initiatlized', (){
      expect(uniqueID, order.id);
    });

    test('turbine must be properly initiatlized', (){
      expect(turbine, order.turbine);
    });

    test('technician must be properly initiatlized', (){
      expect(technician, order.technician);
    });
  });
}