import 'package:flutter_story_presenter/flutter_story_presenter.dart';

class StoryModel {
  String userName;
  String userProfile;
  List<StoryItem> stories;

  StoryModel({
    required this.userName,
    required this.userProfile,
    required this.stories,
  });
}