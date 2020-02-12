import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vobe',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.purple,
          animationDuration: const Duration(milliseconds: 200),
          items: <Widget>[
            Icon(Icons.fast_forward, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index) {},
        ),
        body: Container(color: Colors.purple),
      ),
    );
  }
}
