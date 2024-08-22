import 'package:flutter/material.dart';
import 'package:socially_app/catalog/view/story/component/my_story_view.dart';
import '../../../common/local_data.dart';

class StoryScreen extends StatefulWidget {
  static const routeName = 'StoryScreen';

  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  PageController pageController = PageController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        itemCount: LocaleData.sampleStory.length,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemBuilder: (context, index) {
          return MyStoryView(
            storyModel: LocaleData.sampleStory[index],
            pageController: pageController,
          );
        },
      ),
    );
  }
}








