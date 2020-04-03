import 'package:flutter/widgets.dart';

class Status {
  String message;
  String code;
  int icode;

  Status({
    @required this.code,
    this.message,
  }) : assert(code != null);
}
