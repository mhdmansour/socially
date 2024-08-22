import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app/app_routes.dart';
import '../../../common/config/app_colors.dart';
import '../../../common/config/app_constants/app_vectors.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'SplashScreen';
  static const baseRoute = '/';

  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      router();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  router() async {
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.mainTabsScreen, (route) => false, arguments: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SvgPicture.asset(AppVectors.socially),
        ),
      ),
    );
  }
}
