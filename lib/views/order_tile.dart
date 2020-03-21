import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:windfarmville/data/maintenance/order.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/views/order_details.dart';

class OrderTile extends StatefulWidget {
  final Order _order;

  const OrderTile(this._order, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderTileState(_order);
}

class _OrderTileState extends State<OrderTile> {
  final Order _order;

  _OrderTileState(this._order);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Config.BACKGROUND_COLOR,
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _order.title,
                    style: Config.BLUE_HIND_SEMIBOLD_18,
                  ),
                  Text(
                    _order.creationTime.toIso8601String().substring(0, 10),
                    style: Config.GREY_HIND_LIGHT_14,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  _order.description,
                  style: Config.BLACK_HIND_LIGHT_14,
                ),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OrderDetails(_order)));
        },
      ),
    );
  }
}
