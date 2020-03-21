import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:windfarmville/comp/menu.dart';
import 'package:windfarmville/config/strings.dart';
import 'package:windfarmville/data/maintenance/order.dart';
import 'package:windfarmville/data/maintenance/turbine.dart';
import 'package:windfarmville/data/users/technician.dart';
import 'package:windfarmville/data/utility/unique_id.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/views/order_tile.dart';

class OrderBoard extends StatefulWidget {
  List<OrderTile> _orderTiles = [];

  OrderBoard() {
    for (var dataSet in Config.exampleOrders) {
      Order order = Order(UniqueID(), Turbine(UniqueID()), Technician(UniqueID()));
      order.title = dataSet['title'];
      order.description = dataSet['description'];
      _orderTiles.add(OrderTile(order));
    }
  }

  @override
  State<StatefulWidget> createState() => _OrderBoardState(_orderTiles);
}

class _OrderBoardState extends State<OrderBoard> {
  final List<OrderTile> _orderTiles;

  _OrderBoardState(this._orderTiles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer().setDrawer(context),
      appBar: MyAppBar().setAppBar(Strings.ORDERS),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Config.LIGHT_BLUE,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _orderTiles,
        ),
      ),
    );
  }
}
