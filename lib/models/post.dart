import 'dart:convert';

List<Post> postfromJson(String strofJson){
  return List<Post>.from(json.decode(strofJson).map((x)=>Post.fromJson(x)));
}
class Post{
  int userId;
  int id;
  String title;
  String ?body;

  Post({required this.userId,required this.id,required this.title,this.body});

  factory Post.fromJson(Map<String,dynamic> json){
    return Post(userId: json["userId"], id: json["id"], title: json["title"],body: json["body"]);
  }
}