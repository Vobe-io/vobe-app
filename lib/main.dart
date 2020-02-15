import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vobe_app/data/Post.dart';
import 'package:http/http.dart' as http;
import 'package:vobe_app/widgets/Vobe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<Post> posts = [];

  try {
    var request = (await http.post("https://api.vobe.io", body: {}));
    ((jsonDecode(request.body) as Map<String, dynamic>)["posts"] as List<dynamic>)
        .forEach((ps) => posts.add(Post.fromJson(ps)));
  }catch(e){
    print('ERROR -- ' + e);
  }


  runApp(VobeApp(
    posts: posts,
  ));
}
