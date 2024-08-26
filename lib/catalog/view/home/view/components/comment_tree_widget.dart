import 'package:flutter/material.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:like_button/like_button.dart';
import 'package:socially_app/common/config/app_colors.dart';
import '../../../../domain/models/comment_info.dart';

class CommentWidget extends StatefulWidget {
  CommentInfo? commentContent;
  final Function(int? commentId) onReplay;

  CommentWidget({super.key, this.commentContent, required this.onReplay});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  List<CommentInfo> updateIsLikedById(List<CommentInfo> comments, int id, bool isLiked) {
    for (var comment in comments) {
      if (comment.id == id) {
        comment.isLiked = isLiked;
        break;
      }
      if (comment.replies?.repliesList != null) {
        comment.replies!.repliesList = updateIsLikedById(comment.replies!.repliesList!, id, isLiked);
      }
    }
    return comments;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CommentTreeWidget<CommentInfo, CommentInfo>(
        CommentInfo(
            avatar: widget.commentContent?.avatar ?? "",
            userName: widget.commentContent?.userName ?? "user",
            content: widget.commentContent?.content ?? ""),
        [
          ...?widget.commentContent?.replies?.repliesList?.map((comment) {
            return CommentInfo(
                avatar: comment.avatar,
                userName: comment.userName,
                content: comment.content,
                id: comment.id,
                replies: comment.replies,
                isLiked: comment.isLiked);
          }).toList(),
        ],
        treeThemeData: TreeThemeData(
            lineColor: widget.commentContent?.replies?.repliesList?.isNotEmpty ?? false ? AppColors.primaryColor : Colors.transparent, lineWidth: 3),
        avatarRoot: (context, data) => PreferredSize(
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(data.avatar ?? ""),
          ),
          preferredSize: Size.fromRadius(18),
        ),
        avatarChild: (context, data) => PreferredSize(
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(data.avatar ?? ""),
          ),
          preferredSize: Size.fromRadius(12),
        ),
        contentChild: (context, data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.userName ?? "user",
                      style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.w600, color: AppColors.primaryColor, fontFamily: "Glory"),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${data.content}',
                      style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.w300, color: AppColors.primaryColor, fontFamily: "Glory"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 0,
                    ),
                    LikeButton(
                      size: 20,
                      likeCount: 20,
                    ),
                  ],
                ),
              )
            ],
          );
        },
        contentRoot: (context, data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.userName ?? "user",
                      style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w600, color: AppColors.primaryColor, fontFamily: "Glory"),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${data.content}',
                      style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.w300, color: AppColors.primaryColor, fontFamily: "Glory"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    LikeButton(
                      size: 20,
                      likeCount: 12,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    GestureDetector(
                        onTap: () {
                          widget.onReplay(widget.commentContent?.id ?? 0);
                        },
                        child: Text(
                          'Reply',
                          style: TextStyle(color: Colors.grey[700], fontFamily: "Glory"),
                        )),
                  ],
                ),
              )
            ],
          );
        },
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    );
  }
}
