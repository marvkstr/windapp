import 'package:flutter/cupertino.dart';
import 'package:windfarmville/comp/menu.dart';
import 'package:flutter/material.dart';
import 'package:windfarmville/config/strings.dart';
import 'package:windfarmville/data/maintenance/turbine.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/data/utility/icon_paddings.dart';
import 'package:windfarmville/views/createorder.dart';
import 'package:windfarmville/views/statistic.dart';
import 'package:windfarmville/views/text_row.dart';

class TurbineDetails extends StatefulWidget {
  final Turbine _turbine;

  TurbineDetails(this._turbine);

  @override
  _TurbineDetailState createState() => _TurbineDetailState(_turbine);
}

class _TurbineDetailState extends State<TurbineDetails> {
  final Turbine _turbine;
  _TurbineDetailState(this._turbine);

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> _cards = {};

    _cards['overview'] = _OverviewCard(_turbine);
    _cards['output_small'] = Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: _OutputCard(_turbine, 30, Config.BLACK_HIND_REGULAR_18),
        ),
        Expanded(
          flex: 5,
          child: _WindSpeedCard(_turbine, 30, Config.BLACK_HIND_REGULAR_18),
        ),
        Expanded(
          flex: 2,
          child: _StatisticsCard(context, _turbine, 20),
        ),
      ],
    );
    _cards['output_large'] = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _OutputCard(_turbine, 45, Config.BLACK_HIND_SEMIBOLD_24),
              _WindSpeedCard(_turbine, 45, Config.BLACK_HIND_SEMIBOLD_24),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: _StatisticsCard(context, _turbine, 35),
        ),
      ],
    );
    _cards['error'] = _NoteCard(_turbine);
    _cards['order'] = _CreateOrderCard(context, _turbine);
    _cards['details'] = _DetailedInformationCard(_turbine);

    List<Widget> _getCards() {
      List<Widget> cards = [];
      for (String key in Config.cardOrder[_turbine.state]) {
        cards.add(_cards[key]);
      }
      return cards;
    }

    return Scaffold(
      drawer: MyDrawer().setDrawer(context),
      appBar: MyAppBar().setAppBar(_turbine.name),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(10),
        color: Config.LIGHT_BLUE,
        child: ListView(
          children: _getCards(),
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

class _OverviewCard extends _BaseCard {
  _OverviewCard(Turbine turbine)
      : super(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextRow(Strings.MANUFACTURER, turbine.manufacturer.name),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Strings.STATE,
                    style: Config.BLACK_HIND_SEMIBOLD_18,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: turbine.state.associatedColor),
                      child: Padding(
                        padding: IconPaddings.getEdgeInsets(
                            turbine.state.associatedIcon),
                        child: Icon(turbine.state.associatedIcon,
                            color: Config.BACKGROUND_COLOR, size: 30),
                      )),
                ],
              ),
            ],
          ),
        );
}

class _OutputCard extends _BaseCard {
  _OutputCard(Turbine turbine, double iconSize, TextStyle textStyle)
      : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.battery_charging_full,
                color: Config.MAIN_COLOR,
                size: iconSize,
              ),
              Text(
                turbine.currentPowerInMegaWatts.toString() +
                    ' ' +
                    Strings.MEGA_WATTS,
                style: textStyle,
              ),
            ],
          ),
        );
}

class _WindSpeedCard extends _BaseCard {
  _WindSpeedCard(Turbine turbine, double iconSize, TextStyle textStyle)
      : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.clear_all,
                color: Config.MAIN_COLOR,
                size: iconSize,
              ),
              Text(
                turbine.wind_speed.toString() +
                    ' ' +
                    Strings.KILOMETRES_PER_HOUR,
                style: textStyle,
              ),
            ],
          ),
        );
}

class _StatisticsCard extends Card {
  _StatisticsCard(BuildContext context, Turbine turbine, double iconSize)
      : super(
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Config.BUTTON_COLOR),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.timeline,
                      color: Colors.white,
                      size: iconSize,
                    ),
                  )),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          StatisticScreen(windanlagenName: turbine.name)));
            }, //
          ),
        );
}

class _NoteCard extends _BaseCard {
  _NoteCard(Turbine turbine)
      : super(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Strings.ERROR,
                style: Config.BLUE_HIND_SEMIBOLD_18,
              ),
              Text(
                turbine.note,
                style: Config.BLACK_HIND_LIGHT_14,
              )
            ],
          ),
        );
}

class _CreateOrderCard extends Card {
  _CreateOrderCard(BuildContext context, Turbine turbine)
      : super(
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Strings.CREATE_AN_ORDER,
                    style: Config.BLACK_HIND_SEMIBOLD_18,
                  ),
                  Icon(
                    Icons.add_circle,
                    color: Config.MAIN_COLOR,
                    size: 40,
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateOrder(turbine: turbine)));
            },
          ),
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

class TileDecoration {
  setTileDecoration(Color color) {
    return new BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: 5.0, // has the effect of softening the shadow
          spreadRadius: 1.0, // has the effect of extending the shadow
          offset: Offset(
            2.0, // horizontal, move right 10
            2.0, // vertical, move down 10
          ),
        )
      ],
      color: Colors.white,
      borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
      border: new Border.all(
          color: Colors.grey, width: 0.5, style: BorderStyle.solid),
    );
  }
}
