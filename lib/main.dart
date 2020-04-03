import 'package:Vobe/widgets/pages/LoginWidget.dart';
import 'package:Vobe/widgets/VobeTheme.dart';
import 'package:Vobe/bin/VobeData.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

void main() async {
  runApp(VobeApp());
}

class VobeApp extends StatefulWidget {
  VobeData data;

  VobeApp() {
    data = VobeData();
    data.httpLink = HttpLink(uri: 'https://gql.vobe.io');
    data.gqlClient = GraphQLClient(link: data.httpLink, cache: InMemoryCache());
  }

  @override
  _VobeAppState createState() => _VobeAppState();
}

class _VobeAppState extends State<VobeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vobe',
        theme: VobeTheme().defaultTheme(),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: LoginWidget(widget.data),
        ));
  }
}
