import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

import '../../../../../common/config/app_colors.dart';
import '../../../../../common/config/shared_data.dart';
import '../../../../../common/local_data.dart';
import '../../../../domain/models/comment_info.dart';
import 'comment_tree_widget.dart';

class CommentUiWidget extends StatefulWidget {
  const CommentUiWidget({super.key});

  @override
  State<CommentUiWidget> createState() => _CommentUiWidgetState();
}

class _CommentUiWidgetState extends State<CommentUiWidget> {
  final formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  final TextEditingController commentController = TextEditingController();
  int? _id;
  List<CommentInfo> addReplyById(List<CommentInfo> comments, int id, CommentInfo reply) {
    for (var comment in comments) {
      if (comment.id == id) {
        if (comment.replies == null) {
          comment.replies = Replies(repliesList: []);
        }
        comment.replies!.repliesList!.add(reply);
        print(comment.replies!.repliesList?.first.content);
        break;
      }
      if (comment.replies?.repliesList != null) {
        comment.replies!.repliesList = addReplyById(comment.replies!.repliesList!, id, reply);
      }
    }
    return comments;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        child: CommentBox(
          userImage: CommentBox.commentImageParser(imageURLorPath: "https://ix-www.imgix.net/case-study/unsplash/woman-hat.jpg?ixlib=js-3.8.0&w=400&auto=compress%2Cformat&dpr=1&q=75",),
          child: commentChild(SharedData.shared.comments),
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          withBorder: false,
          sendButtonMethod: () {
            if(_id != null){
              print(_id);
              setState(() {
                CommentInfo newReply = CommentInfo(id: 2254, content: commentController.text, userName: "User4",isLiked: false,avatar: "https://ix-www.imgix.net/case-study/unsplash/woman-hat.jpg?ixlib=js-3.8.0&w=400&auto=compress%2Cformat&dpr=1&q=75",);
                List<CommentInfo> newData = addReplyById(SharedData.shared.comments ?? [], _id ?? 0,newReply);
                SharedData.shared.updateCommentsInfo(comments: newData);
                _id = null;

              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            }
            else if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                CommentInfo value = CommentInfo(avatar: "https://ix-www.imgix.net/case-study/unsplash/woman-hat.jpg?ixlib=js-3.8.0&w=400&auto=compress%2Cformat&dpr=1&q=75", id: 2, content: commentController.text, userName: "user",);
                LocaleData.comments.insert(0, value);
                SharedData.shared.updateCommentsInfo(comments: LocaleData.comments);
                _id = null;
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          focusNode:_focusNode ,
          formKey: formKey,
          commentController: commentController,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }

  Widget commentChild(data) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: CommentWidget(
              commentContent: SharedData.shared.comments?[i],
              onReplay: (id) {
                setState(() {
                  _id = id;
                });
                FocusScope.of(context).requestFocus(_focusNode);
              },
            ),
          )
      ],
    );
  }
}
