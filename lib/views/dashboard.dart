import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:windfarmville/comp/menu.dart';
import 'package:windfarmville/config/strings.dart';
import 'package:windfarmville/data/maintenance/turbine.dart';
import 'package:windfarmville/data/utility/unique_id.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/views/turbine_tile.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<_TileSection> _tileSections = [];

  _DashboardState() {
    List<Turbine> turbines = [];

    for (var dataSet in Config.exampleTurbines) {
      var turbine = Turbine(UniqueID());
      turbine.name = dataSet['name'];
      turbine.note = dataSet['note'];
      turbine.owner = dataSet['owner'];
      turbine.state = dataSet['state'];
      turbine.manufacturer = dataSet['manufacturer'];
      turbine.currentPowerInMegaWatts = dataSet['currentPowerInMegaWatts'];
      turbine.targetPowerInMegaWatts = dataSet['targetPowerInMegaWatts'];
      turbine.address = dataSet['address'];
      turbine.location = dataSet['location'];
      turbine.yearOfConstruction = dataSet['yearOfConstruction'];

      turbines.add(turbine);
    }

    setSections(turbines);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer().setDrawer(context),
      appBar: MyAppBar().setAppBar(Strings.TURBINES),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Config.LIGHT_BLUE,
        child: ListView(
          children: _tileSections,
        ),
      ),
    );
  }

  void setSections(List<Turbine> turbines) {
    for (var state in TurbineState.getAll()) {
      List<TurbineTile> turbineTiles = [];
      for (var turbine in turbines) {
        if (state == turbine.state) {
          turbineTiles.add(TurbineTile(turbine));
        }
      }

      if (turbines.length == 0) {
        continue;
      }

      _TileSection tileSection = _TileSection(
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( state.associatedString,
              style: Config.BLACK_HIND_SEMIBOLD_18,
              )
            ],
          ),
        ),
        turbineTiles,
      );

      _tileSections.add(tileSection);
    }
  }

  @deprecated
  List<Turbine> sortTurbines(List<Turbine> turbines){
    turbines.sort((b, a) => a.state.sortCode.compareTo(b.state.sortCode));
    return turbines;
  }
}

class _TileSection extends StatefulWidget {
  final Widget _title;
  final List<TurbineTile> _turbineTiles;

  _TileSection(this._title, this._turbineTiles);

  @override
  State<StatefulWidget> createState() => _TileSectionState(_title, _turbineTiles);
}

class _TileSectionState extends State<_TileSection> {
  final Widget _title;
  final List<TurbineTile> _turbineTiles;

  _TileSectionState(this._title, this._turbineTiles);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _title,
        Column(
          children: _turbineTiles,
        )
      ],
    );
  }

}