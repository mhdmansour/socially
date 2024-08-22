import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socially_app/common/config/app_constants/app_images.dart';

import '../../../../../common/config/app_constants/app_vectors.dart';

class HomePageTitle extends StatelessWidget {
  const HomePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 23, width: 144, child: SvgPicture.asset(AppVectors.socially));
  }
}
