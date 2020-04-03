import 'package:Vobe/bin/UserSettings.dart';
import 'package:flutter/widgets.dart';

class VobeSession {
  String sessionToken;
  UserSettings settings;

  VobeSession({
    @required this.sessionToken,
  }) : assert(sessionToken.isNotEmpty);
}
