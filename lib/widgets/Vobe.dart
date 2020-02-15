import 'package:flutter/material.dart';
import 'package:vobe_app/VobeThemes.dart';
import 'package:vobe_app/data/Post.dart';

import 'FABBottomAppBar.dart';
import 'PostTile.dart';

class VobeApp extends StatefulWidget {
  final List<Post> posts;

  VobeApp({this.posts});

  @override
  _VobeAppState createState() => _VobeAppState();
}

class _VobeAppState extends State<VobeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vobe',
      theme: VobeThemes.themes()['dark'],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          backgroundColor: Colors.purple.shade400,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          elevation: 2.0,
        ),
        body: ListView(
          children: <Widget>[
            for (var post in widget.posts) PostTile(post: post)
          ],
        ),
        bottomNavigationBar: FABBottomAppBar(
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: (_) => print(_),
          items: [
            FABBottomAppBarItem(iconData: Icons.face),
            FABBottomAppBarItem(iconData: Icons.settings),
          ],
        ),
      ),
    );
  }
}
