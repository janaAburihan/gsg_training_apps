class PostModel {
  String? content;
  String? image;
  bool isLiked;
  PostUser? user;
  PostModel({
    this.content,
    this.image,
    this.isLiked = false,
    this.user,
  });
}

class PostUser {
  String? name;
  String? image;
  PostUser({
    this.name,
    this.image,
  });
}
