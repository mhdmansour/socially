import 'package:flutter/material.dart';
import 'package:socially_app/catalog/view/splash/splash_screen.dart';
import 'package:socially_app/catalog/view/story/story_screen.dart';
import '../catalog/view/home/view/home_screen.dart';
import '../catalog/view/main_tabs_screen.dart';
import '../catalog/view/profile/view/profile_screen.dart';
import '../catalog/view/second/view/second_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Widget getScreenByName({required RouteSettings settings}) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return const SplashScreen();
      case AppRoutes.homeScreen:
        return const HomeScreen();
      case AppRoutes.profileScreen:
        return const ProfileScreen();
      case AppRoutes.secondScreen:
        return const SecondScreen();
      case AppRoutes.mainTabsScreen:
        return MainTabsScreen(
          currentIndex: settings.arguments as int,
        );
      case AppRoutes.storyScreen:
        return const StoryScreen();
      default:
        return const Scaffold(
          body: SafeArea(
            child: Text(
              'Route Error',
            ),
          ),
        );
    }
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return getScreenByName(settings: settings);
        },
        settings: settings);
  }

  static Route<dynamic> onUnknownRoute(
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      builder: (
        buildContext,
      ) =>
          const Scaffold(
        body: SafeArea(
          child: Text(
            'Route Error',
          ),
        ),
      ),
      settings: null,
    );
  }
}
