class CommentInfo{
  int? id;
  String? avatar;
  String? userName;
  String? content;
  Replies? replies;
  bool? isLiked;
  CommentInfo({this.id, this.content, this.userName,this.avatar, this.replies,this.isLiked});

  CommentInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    userName = json['user_name'];
    content = json['content'];
    isLiked = json['is_liked'];

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['avatar'] = avatar;
    data['user_name'] = userName;
    data['content'] = content;
    data['is_liked'] = isLiked;
    return data;
  }
}


class Replies{
  List<CommentInfo>? repliesList;

  Replies({this.repliesList});

  Replies.fromJson(Map<String, dynamic> json) {
    if (json['replies'] != null) {
      repliesList = <CommentInfo>[];
      json['replies'].forEach((v) {
        repliesList!.add(CommentInfo.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (repliesList != null) {
      data['replies'] = repliesList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}