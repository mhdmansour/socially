import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socially_app/common/config/app_colors.dart';
import 'package:socially_app/common/config/app_constants/app_vectors.dart';

class TagsWidget extends StatelessWidget {
  final List<String>? tags;

  TagsWidget({this.tags});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double totalWidth = 0;
        int visibleTags = 0;

        // Estimate space for each tag and determine how many can fit
        for (int i = 0; i < (tags?.length ?? 0); i++) {
          // Calculate the width of the tag widget
          double tagWidth = _estimateTagWidth(tags?[i] ?? "");

          // Check if the current tag can fit within the available screen width
          if (totalWidth + tagWidth < screenWidth) {
            totalWidth += tagWidth;
            visibleTags++;
          } else {
            break;
          }
        }

        return Row(
          children: [
            // Display visible tags
            for (int i = 0; i < visibleTags; i++) _buildTag(tags?[i] ?? ""),

            // If there are hidden tags, show the "+x" indicator
            if (visibleTags < (tags?.length ?? 0)) _buildMoreTagsIndicator((tags?.length ?? 0) - visibleTags),
          ],
        );
      },
    );
  }

  double _estimateTagWidth(String tag) {
    return (tag.length * 9.0) + 70.0; // Adjust based on your tag styling
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      margin: EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: AppColors.tagsContainerColor,
        borderRadius: BorderRadius.circular(20.0),
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
            Text(tag,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: "Glory",
                )),
          ],
        ),
      ),
    );
  }

  // Build the "+x" indicator
  Widget _buildMoreTagsIndicator(int remainingTags) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
          child: Container(
        // parent row
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              Align(
                  widthFactor: 0.3,
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                    margin: EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.tagsContainerColor,
                      boxShadow: [
                        BoxShadow(color: AppColors.black.withOpacity(0.10), spreadRadius: 0, blurRadius: 6, offset: const Offset(0, 1)),
                      ],
                    ),
                    child: i == 2 ? Center(child: Text("+3")) : SizedBox.shrink(),
                  ))
          ],
        ),
      )),
    );
  }
}
