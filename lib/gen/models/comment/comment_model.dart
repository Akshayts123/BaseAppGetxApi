class comment_model {
  comment_model({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  factory comment_model.fromJson(Map<String, dynamic> json){
    return comment_model(
      postId: json["postId"],
      id: json["id"],
      name: json["name"],
      email: json["email"],
      body: json["body"],
    );
  }

}
