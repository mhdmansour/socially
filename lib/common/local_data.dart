import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story_presenter/flutter_story_presenter.dart';
import 'package:socially_app/catalog/view/story/component/text_overlay_view.dart';

import '../catalog/domain/models/comment_info.dart';
import '../catalog/domain/models/post_info.dart';
import '../catalog/domain/models/story_info.dart';

class LocaleData {
  static List<PostInfo> localePost = [
    PostInfo(
      commentCount: 1320,
      content:
          "Stopped by @zoesugg today with goosey girl to see @kyliecosmetics & @kylieskin 💕 wow what a dream!!!!!!!! It’s the best experience we have!",
      date: "2 d ago",
      isSaved: false,
      likeCount: 21,
      images: [],
      taggedUsers: ["Zoe Sugg"],
      userImage: "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      userName: "Kylie Jenner",
    ),
    PostInfo(
        commentCount: 1320,
        content: "This is one of the best experiences that I’ve ever had in my life! the mountain view here is emazing.",
        date: "2 d ago",
        images: [
          "https://ix-www.imgix.net/case-study/unsplash/unsplash-screen01.png?ixlib=js-3.8.0&auto=compress%2Cformat&w=1800",
          "https://ix-www.imgix.net/case-study/unsplash/woman-hat.jpg?ixlib=js-3.8.0&w=400&auto=compress%2Cformat&dpr=1&q=75",
          "https://ix-www.imgix.net/case-study/unsplash/woman-hat.jpg?ixlib=js-3.8.0&w=400&auto=compress%2Cformat&dpr=1&q=75",
          "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        ],
        isSaved: false,
        likeCount: 21,
        userImage: "https://ix-www.imgix.net/case-study/unsplash/woman-hat.jpg?ixlib=js-3.8.0&w=400&auto=compress%2Cformat&dpr=1&q=75",
        userName: "Alex Strohl",
        tags: ['Alberta', 'Cold', 'Meditation', 'Relax', 'Nature', 'Mindfulness', 'Yoga']),
    PostInfo(
      commentCount: 1320,
      date: "2 d ago",
      images: [
        "https://ix-www.imgix.net/case-study/unsplash/woman-hat.jpg?ixlib=js-3.8.0&w=400&auto=compress%2Cformat&dpr=1&q=75",
        "https://ix-www.imgix.net/case-study/unsplash/unsplash-screen01.png?ixlib=js-3.8.0&auto=compress%2Cformat&w=1800",
        "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
      ],
      isSaved: false,
      likeCount: 21,
      userImage: "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      userName: "Jana Alex",
    ),
    PostInfo(
      commentCount: 1320,
      date: "2 d ago",
      images: [
        "https://ix-www.imgix.net/case-study/unsplash/header.png?ixlib=js-3.8.0&auto=format%2Ccompress&fit=crop&crop=top&usm=10&ar=1920%3A780&w=1446"
      ],
      isSaved: false,
      likeCount: 21,
      userImage: "https://ix-www.imgix.net/case-study/unsplash/woman-hat.jpg?ixlib=js-3.8.0&w=400&auto=compress%2Cformat&dpr=1&q=75",
      userName: "John Jenner",
    ),
  ];

  static List<StoryModel> sampleStory = [
    StoryModel(
      userName: 'Kaival Patel',
      userProfile: 'https://avatars.githubusercontent.com/u/39383435?v=4',
      stories: [
        StoryItem(
          storyItemType: StoryItemType.custom,
          thumbnail: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(
                radius: 15,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )),
          customWidget: (p0) => TextOverlayView(
            controller: p0,
          ),
          imageConfig: StoryViewImageConfig(
            fit: BoxFit.contain,
            progressIndicatorBuilder: (p0, p1, p2) => const Center(
              child: CupertinoActivityIndicator(),
            ),
          ),
        ),
      ],
    ),
  ];

  static List<CommentInfo> comments = [
    CommentInfo(
        avatar: "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        userName: 'John Doe',
        content: 'This is an amazing post! Thanks for sharing.',
        id: 1,
        isLiked: true,
        replies: Replies(repliesList: [
          CommentInfo(
              avatar: "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              userName: 'Jane Smith',
              content: 'I completely agree with the points mentioned here.',
              isLiked: false,
              id: 2),
          CommentInfo(
              avatar: "https://ix-www.imgix.net/case-study/unsplash/woman-hat.jpg?ixlib=js-3.8.0&w=400&auto=compress%2Cformat&dpr=1&q=75",
              userName: 'Mike Johnson',
              content: 'Could you please elaborate more on this topic?',
              isLiked: true,
              id: 3),
          CommentInfo(
              avatar: "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              userName: 'Emily Brown',
              content: 'I have some questions about the methods you mentioned.',
              isLiked: false,
              id: 4),
        ])),
    CommentInfo(
        avatar: "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        userName: 'Laura Wilson',
        content: 'Thank you for this detailed explanation!',
        isLiked: true,
        id: 5),
    CommentInfo(
        avatar: "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        userName: 'David Miller',
        content:  'Can you provide some more examples?',
        isLiked: false,
        id: 6),
    CommentInfo(
        avatar: "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        userName: 'James Anderson',
        content: 'Loved the content! Keep up the great work.',
        isLiked: true,
        id: 7,
        replies: Replies(repliesList: [
    CommentInfo(
    avatar: "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        userName: 'Olivia Taylor',
        content: 'This post is a must-read for everyone interested in this topic.',
        isLiked: false,
        id: 2),
    CommentInfo(
        avatar: "https://ix-www.imgix.net/case-study/unsplash/woman-hat.jpg?ixlib=js-3.8.0&w=400&auto=compress%2Cformat&dpr=1&q=75",
        userName: 'Mike Johnson',
        content: 'Could you please elaborate more on this topic?',
        isLiked: true,
        id: 3),
    CommentInfo(
        avatar: "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        userName: 'Emily Brown',
        content: 'I have some questions about the methods you mentioned.',
        isLiked: false,
        id: 4),
  ])
    ),
  ];
}
