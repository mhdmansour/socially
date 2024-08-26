import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socially_app/common/config/app_constants/app_vectors.dart';

class HomeNotificationWidget extends StatelessWidget {
  const HomeNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: SvgPicture.asset(AppVectors.notification));
  }
}
