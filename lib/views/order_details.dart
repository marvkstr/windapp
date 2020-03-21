import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:windfarmville/comp/menu.dart';
import 'package:windfarmville/config/strings.dart';
import 'package:windfarmville/data/maintenance/order.dart';
import 'package:windfarmville/data/utility/date_time_formatter.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/views/chat.dart';
import 'package:windfarmville/views/text_row.dart';

class OrderDetails extends StatefulWidget {
  final Order _order;

  OrderDetails(this._order) {
    _order.maintenanceTime =
        _order.creationTime.add(new Duration(days: 20, hours: 2, minutes: 22 )); // TODO remove if properly implemented
  }

  @override
  _OrderDetailsState createState() => _OrderDetailsState(_order);
}

class _OrderDetailsState extends State<OrderDetails> {
  final Order _order;

  _OrderDetailsState(this._order);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer().setDrawer(context),
      appBar: MyAppBar().setAppBar(_order.title),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(10),
        color: Config.LIGHT_BLUE,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _DescriptionCard(_order.description),
            _DateCard(_order.creationTime, _order.maintenanceTime),
            _OpenChatCard(context),
            _DetailedInformationCard(_order),
          ],
        ),
      ),
    );
  }
}

class _BaseCard extends Card {
  _BaseCard(Widget widget)
      : super(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: widget,
          ),
        );
}

class _DescriptionCard extends _BaseCard {
  _DescriptionCard(String description)
      : super(Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Strings.DESCRIPTION,
              style: Config.BLUE_HIND_SEMIBOLD_18,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                  description,
                style: Config.BLACK_HIND_LIGHT_14,
              ),
            ),
          ],
        ));
}

class _DateCard extends _BaseCard {
  _DateCard(DateTime creationTime, DateTime maintenanceTime)
      : super(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _getTitle(Strings.CREATED_ON),
                  _getTitle(Strings.DUE_TO),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  _getDate(creationTime),
                  _getDate(maintenanceTime),
                ],
              ),
              Column(
                children: <Widget>[
                  _getAt(),
                  _getAt(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  _getTime(creationTime),
                  _getTime(maintenanceTime),
                ],
              ),
            ],
          ),
        );

  static Widget _getTitle(String content) {
    return Text(
      content,
      style: Config.BLACK_HIND_SEMIBOLD_18,
    );
  }

  static Widget _getDate(DateTime dateTime) {
    return Text(
      DateTimeFormatter.formatDate(dateTime),
      style: Config.BLACK_HIND_REGULAR_18,
    );
  }

  static _getAt() {
    return Text(
      Strings.AT,
      style: Config.BLACK_HIND_SEMIBOLD_18,
    );
  }

  static Widget _getTime(DateTime dateTime) {
    return Text(
      DateTimeFormatter.formatTime(dateTime),
      style: Config.BLACK_HIND_REGULAR_18,
    );
  }
}

class _OpenChatCard extends Card {
  _OpenChatCard(BuildContext context)
      : super(
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        Strings.CHAT,
                        style: Config.BLUE_HIND_SEMIBOLD_18,
                      ),
                      Text(
                        Strings.GET_IN_TOUCH,
                        style: Config.BLACK_HIND_REGULAR_18,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Config.BUTTON_COLOR,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () async {
              FirebaseUser user = await FirebaseAuth.instance.currentUser();
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ChatScreen(user: user,)
              ));
            },
          ),
        );
}

class _DetailedInformationCard extends _BaseCard {
  _DetailedInformationCard(Order _order)
      : super(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                Strings.DETAILS,
                style: Config.BLUE_HIND_SEMIBOLD_18,
              ),
              TextRow(Strings.ORDER_ID, _order.id.toString()),
              TextRow(Strings.TURBINE_ID, _order.turbine.id.toString()),
              TextRow(Strings.TECHNICIAN_ID, _order.technician.id.toString()),
            ],
          ),
        );
}
