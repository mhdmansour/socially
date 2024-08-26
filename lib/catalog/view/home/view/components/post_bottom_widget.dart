import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socially_app/common/common.dart';
import 'package:socially_app/common/config/app_constants/app_vectors.dart';

import '../../../../../common/helper/bottom_sheet_helper.dart';
import 'comment_ui_widget.dart';

class PostBottomWidget extends StatelessWidget {
  int? numberOfComment;
  int? numberOfLikes;
  bool? isSaved;

  PostBottomWidget({super.key, this.isSaved, this.numberOfComment, this.numberOfLikes});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 4, right: 4),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(AppVectors.favorite),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    numberOfLikes.toString() ?? "",
                    style: TextStyle(fontFamily: "Glory", fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.postTextColor),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        print("sdf");
                        BottomSheetHelper.showModalSheet(context, CommentUiWidget(),true);
                      },
                      child: SvgPicture.asset(AppVectors.comment)),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    numberOfComment.toString() ?? "",
                    style: TextStyle(fontFamily: "Glory", fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.postTextColor),
                  )
                ],
              ),
            ),
            SvgPicture.asset(AppVectors.bookmark)
          ],
        ),
      ),
    );
  }
}
