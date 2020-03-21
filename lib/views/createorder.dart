// TODO: Farb & Schriftanpassungen - Name, Standort & Verbindung!
import 'package:windfarmville/comp/menu.dart';
import 'package:flutter/material.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/config/strings.dart';
import 'package:windfarmville/data/maintenance/turbine.dart';
import 'package:windfarmville/views/text_row.dart';
import 'package:windfarmville/views/turbine_details.dart';

class CreateOrder extends StatefulWidget {
  final Turbine turbine;
  CreateOrder({Key key, @required this.turbine}) : super(key: key);

  @override
  _CreateOrderState createState() => _CreateOrderState();
}

final titleController = TextEditingController();
final descriptionController = TextEditingController();

class _CreateOrderState extends State<CreateOrder> {
  @override
  void initState() {
    titleController.text = "Rotorimpuls defekt";
    descriptionController.text =
        "Error 800: Der Impuls des Rotors ist defekt";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer().setDrawer(context),
      appBar: MyAppBar().setAppBar(Strings.CREATE_ORDER),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Config.LIGHT_BLUE,
        child: Column(
          children: <Widget>[
            _OrderDescripitionCard(),
            _DetailedInformationCard(widget.turbine),

            //Windkraftanlage hinzufügen
            Container(
              padding: EdgeInsets.only(
                    top: 7, left: 70.0, bottom: 2, right: 70.0),
                width: double.infinity,
                height: 60,
                child: new RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Config.BUTTON_COLOR,
                onPressed: () {
                  Navigator.pushNamed(context, "/orders");
                },
                child: new Text(Strings.CREATE_ORDER,
                    style: Config.WHITE_HIND_BUTTON),
              ),
            ),

            //Vorgang abbrechen
            Container(
              padding: EdgeInsets.only(
                    top: 7, left: 70.0, bottom: 2, right: 70.0),
                width: double.infinity,
                height: 60,
                child: new RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Config.BUTTON_COLOR,
                onPressed: () {
                  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TurbineDetails(widget.turbine)));
                },
                child: new Text(Strings.CANCEL,
                    style: Config.WHITE_HIND_BUTTON),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BaseCard extends Card {
  _BaseCard({Widget child})
      : super(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: child,
          ),
        );
}

class _OrderDescripitionCard extends _BaseCard {
  _OrderDescripitionCard()
      : super(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(Strings.ORDERDESCRIPTION,
                  style: Config.BLUE_HIND_SEMIBOLD_18),
              SpecialTextRow(Strings.TITLE, titleController),
              SpecialTextRow(Strings.DESCRIPTION, descriptionController),
            ],
          ),
        );
}

class SpecialTextRow extends Row {
  SpecialTextRow(
    String leftText,
    TextEditingController textEditingController, {
    TextStyle leftStyle = Config.BLACK_HIND_SEMIBOLD_18,
    rightStyle = Config.BLACK_HIND_REGULAR_18,
  }) : super(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              leftText,
              style: leftStyle,
            ),
            Flexible(
                child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textAlign: TextAlign.right,
              style: rightStyle,
              controller: textEditingController,
            )),
          ],
        );
}

class _DetailedInformationCard extends _BaseCard {
  _DetailedInformationCard(Turbine turbine)
      : super(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(Strings.DETAILS, style: Config.BLUE_HIND_SEMIBOLD_18),
              TextRow(Strings.TURBINE_ID, turbine.id.toString()),
              TextRow(Strings.OWNER_ID, turbine.owner.id.toString()),
              TextRow(Strings.ADDRESS,
                  turbine.address.toString().replaceAll(', ', '\n')),
              TextRow(Strings.LOCATION, turbine.location.toString()),
            ],
          ),
        );
}
