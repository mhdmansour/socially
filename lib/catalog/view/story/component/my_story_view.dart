import 'package:flutter/material.dart';
import 'package:flutter_story_presenter/flutter_story_presenter.dart';
import 'package:socially_app/catalog/domain/models/story_info.dart';
import 'package:socially_app/catalog/view/story/component/message_box_view.dart';
import 'package:socially_app/catalog/view/story/component/profile_view.dart';

class MyStoryView extends StatefulWidget {
  const MyStoryView({
    super.key,
    required this.storyModel,
    required this.pageController,
  });

  final StoryModel storyModel;
  final PageController pageController;

  @override
  State<MyStoryView> createState() => _MyStoryViewState();
}

class _MyStoryViewState extends State<MyStoryView> {
  late FlutterStoryController controller;

  @override
  void initState() {
    controller = FlutterStoryController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storyViewIndicatorConfig = StoryViewIndicatorConfig(
      height: 4,
      activeColor: Colors.white,
      backgroundCompletedColor: Colors.white,
      backgroundDisabledColor: Colors.white.withOpacity(0.5),
      horizontalGap: 1,
      borderRadius: 1.5,
    );

    return FlutterStoryView(
      flutterStoryController: controller,
      items: widget.storyModel.stories,
      footerWidget: MessageBoxView(controller: controller),
      storyViewIndicatorConfig: storyViewIndicatorConfig,
      initialIndex: 0,
      headerWidget: ProfileView(storyModel: widget.storyModel),
      onStoryChanged: (p0) {
        // For Custom type story need to play custom view manually
        if (widget.storyModel.stories[p0].storyItemType == StoryItemType.custom) {
          controller.playCustomWidget();
        }
      },
      onPreviousCompleted: () async {
        await widget.pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
      },
      onCompleted: () async {
        await widget.pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
        controller = FlutterStoryController();
      },
    );
  }
}