import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:vobe_app/data/Post.dart';

class PostTile extends StatefulWidget {
  PostTile({this.post});

  final Post post;

  @override
  State<StatefulWidget> createState() => PostTileState();
}

class PostTileState extends State<PostTile> {
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.face,
                  size: 50,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.post.owner.username,
                        style: TextStyle(
                          fontSize: 17.5,
                          color: Colors.purple.shade300,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width - 100,
                        child: new Text(widget.post.text),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
