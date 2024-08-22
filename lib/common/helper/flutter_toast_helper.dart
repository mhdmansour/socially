import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/svg.dart';
import '../common.dart';
import '../config/app_colors.dart';
import '../config/shared_data.dart';

class FlutterToastHelper {
  static showSuccessFlutterToast({required BuildContext context, required String message, StyledToastPosition position = StyledToastPosition.top}) {
    //bool isArabic = SharedData.shared.langType == LangType.arabic;
    bool isArabic = false;
    if (!context.mounted) {
      return;
    }
    showToastWidget(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: AppColors.green,
          ),
          child: Row(
            children: [
               SvgPicture.asset(
                      AppVectors.rightCheck,
                      color: AppColors.white,
                    ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        message,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: "Glory",
                        ),
                        textAlign: TextAlign.start,
                        textDirection:TextDirection.ltr, //SharedData.shared.langType == LangType.arabic ? TextDirection.rtl : TextDirection.ltr,
                      ))),
               InkWell(
                      onTap: () {
                        dismissAllToast();
                      },
                      child: SvgPicture.asset(
                        AppVectors.cancel,
                        color: AppColors.white,
                      ),
                    ),
            ],
          ),
        ),
      ),
      context: context,
      isIgnoring: false,
      position: position,
      reverseAnimation: StyledToastAnimation.slideToTop,
      duration: const Duration(seconds: 4),
    );
  }

  static showErrorFlutterToast({required BuildContext context, required String message, StyledToastPosition position = StyledToastPosition.top}) {
    bool isArabic = false;//SharedData.shared.langType == LangType.arabic;
    if (!context.mounted) {
      return;
    }
    showToastWidget(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: AppColors.discountColor,
          ),
          child: Row(
            children: [
             SvgPicture.asset(
                      AppVectors.cancel,
                      color:  AppColors.white.withOpacity(0),
                    ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        message,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: "Glory",
                        ),
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr, //SharedData.shared.langType == LangType.arabic ? TextDirection.rtl : TextDirection.ltr,
                      ))),

                  InkWell(
                      onTap: () {
                        dismissAllToast();
                      },
                      child: SvgPicture.asset(
                        AppVectors.cancel,
                        color: AppColors.white,
                      ),
                    ),
            ],
          ),
        ),
      ),
      context: context,
      isIgnoring: true,

      /// Need To check if ios issue solved.
      position: position,
      reverseAnimation: StyledToastAnimation.slideToTop,
      duration: const Duration(seconds: 4),
    );
  }
}
