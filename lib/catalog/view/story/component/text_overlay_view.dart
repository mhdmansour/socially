import 'package:flutter/material.dart';
import 'package:flutter_story_presenter/flutter_story_presenter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socially_app/common/config/app_colors.dart';
import 'package:socially_app/common/config/app_constants/app_images.dart';
import 'package:socially_app/common/widgets/custom_cached_image.dart';
import '../../../../common/config/app_constants/app_vectors.dart';
import '../../../../common/widgets/Image_waiting_shimmer.dart';

class TextOverlayView extends StatelessWidget {
  const TextOverlayView({super.key, required this.controller});

  final FlutterStoryController? controller;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomCachedImage(
        imageUrl: 'https://images.pexels.com/photos/1761279/pexels-photo-1761279.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        boxFit: BoxFit.cover,
        placeholderWidget: const ImageWaitingShimmer(height: 22),
        errorWidget: Image.asset(AppImages.test1, fit: BoxFit.cover, width: 22, height: 22),
      ),
      Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.3,
          right: MediaQuery.sizeOf(context).width * 0.2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            margin: EdgeInsets.only(right: 8.0),
            decoration: BoxDecoration(
              color: AppColors.tagsContainerColor,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(color: AppColors.black.withOpacity(0.10), spreadRadius: 0, blurRadius: 6, offset: const Offset(0, 1)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppVectors.tag),
                  SizedBox(width: 5.0),
                  Text("Meditation",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: "Glory",
                      )),
                ],
              ),
            ),
          ))
    ]);
  }
}