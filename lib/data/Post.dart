import 'Owner.dart';

class Post {
  final String id;
  final List<Post> children;
  final String date;
  final Owner owner;
  final String text;

  Post({this.id, this.children, this.date, this.owner, this.text});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      children: json['children'] != null
          ? (json['children'] as List).map((i) => Post.fromJson(i)).toList()
          : null,
      date: json['date'],
      owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['date'] = this.date;
    data['text'] = this.text;

    if (this.children != null)
      data['children'] = this.children.map((v) => v.toJson()).toList();
    if (this.owner != null) data['owner'] = this.owner.toJson();

    return data;
  }
}
