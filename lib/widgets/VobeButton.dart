import 'package:flutter/material.dart';

class VobeButton extends StatelessWidget {
  VobeButton({
    @required this.text,
    @required this.onClick,
    this.borderRadius: 5,
    this.fontSize: 20,
  }) : assert(text != null);

  final String text;
  final VoidCallback onClick;
  final double borderRadius;
  final double fontSize;

  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: onClick,
        padding: EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        color: Color(0xFF7554ff),
        textColor: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      );
}
