import 'package:flutter/material.dart';
import 'package:aula01_app/utils/util.dart';

class DefaultButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;

  DefaultButton(this.text,
      {@required this.onPressed, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: color,
        child: Text(
          text,
          style: TextStyle(color: colorConvert("#e60935")),
        ),
        onPressed: onPressed);
  }
}
