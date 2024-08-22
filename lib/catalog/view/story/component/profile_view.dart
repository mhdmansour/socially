import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socially_app/catalog/domain/models/story_info.dart';
import 'package:socially_app/common/config/app_colors.dart';
import 'package:socially_app/common/config/app_constants/app_vectors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
    required this.storyModel,
  });

  final StoryModel storyModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white.withOpacity(0.7),
                  ),
                  padding: const EdgeInsets.all(1),
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: AppColors.storyTextColor,
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      storyModel.userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Glory",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '1d',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Glory",
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppVectors.storyDownload),
            )
          ],
        ),
      ),
    );
  }
}