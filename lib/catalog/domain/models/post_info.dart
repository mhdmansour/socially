class PostInfo{
  String? userName;
  String? userImage;
  String? date;
  String? content;
  int? likeCount;
  int? commentCount;
  List<String>? images;
  bool? isSaved;
  List<String>? taggedUsers;
  List<String>? tags;

  PostInfo({this.images,
  this.content,
    this.date,
    this.commentCount,
    this.isSaved,
    this.likeCount,
    this.taggedUsers,
    this.userImage,
    this.userName,
    this.tags
  });
}