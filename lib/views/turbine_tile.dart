import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:windfarmville/config/strings.dart';
import 'package:windfarmville/data/maintenance/turbine.dart';
import 'package:windfarmville/config/config.dart';
import 'package:windfarmville/data/utility/icon_paddings.dart';

import 'turbine_details.dart';

class TurbineTile extends StatelessWidget {
  final Turbine _turbine;

  TurbineTile(this._turbine);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Config.BACKGROUND_COLOR,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 5, 20, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    _turbine.name,
                    style: Config.BLACK_HIND_REGULAR_18,
                  ),
                  Text(
                    _turbine.currentPowerInMegaWatts.toString() + ' ' + Strings.MEGA_WATTS,
                    style: Config.BLUE_HIND_SEMIBOLD_18,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _turbine.state.associatedColor),
                child: Padding(
                  padding: IconPaddings.getEdgeInsets(_turbine.state.associatedIcon),
                  child: Icon(
                    _turbine.state.associatedIcon,
                    size: 40,
                    color: Config.BACKGROUND_COLOR,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TurbineDetails(_turbine)));
        },
      ),
    );
  }
}
