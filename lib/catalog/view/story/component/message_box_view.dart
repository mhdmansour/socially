import 'package:flutter/material.dart';
import 'package:flutter_story_presenter/flutter_story_presenter.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/config/app_constants/app_vectors.dart';

class MessageBoxView extends StatelessWidget {
  const MessageBoxView({
    super.key,
    required this.controller,
  });

  final FlutterStoryController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [],
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: SvgPicture.asset(AppVectors.storyFavorite),
            )
          ],
        ),
      ),
    );
  }
}