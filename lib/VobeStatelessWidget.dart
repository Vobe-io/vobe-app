import 'package:flutter/material.dart';

import 'bin/VobeData.dart';

abstract class VobeStatelessWidget extends StatelessWidget {
  VobeStatelessWidget(this.vobeData) : assert(vobeData != null);

  VobeData vobeData;
}
