import 'package:flutter/cupertino.dart';
import 'package:windfarmville/config/config.dart';

class TextRow extends Row {
  TextRow(String leftText, String rightText,
      {TextStyle leftStyle = Config.BLACK_HIND_SEMIBOLD_18,
        rightStyle = Config.BLACK_HIND_REGULAR_18})
      : super(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        leftText,
        style: leftStyle,
      ),
      Text(
        rightText,
        style: rightStyle,
        textAlign: TextAlign.right,
      ),
    ],
  );
}