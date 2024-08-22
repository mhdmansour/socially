import 'package:flutter/material.dart';
import 'package:socially_app/catalog/domain/models/post_info.dart';
import 'package:socially_app/catalog/view/home/view/components/post_slider_widget.dart';
import 'package:socially_app/catalog/view/home/view/components/tags_widget.dart';
import 'package:socially_app/common/common.dart';
import 'package:socially_app/common/widgets/custom_cached_image.dart';
import '../../../../../common/widgets/Image_waiting_shimmer.dart';
import 'post_bottom_widget.dart';
import 'post_text_widget.dart';

class HomePostWidget extends StatelessWidget {
  PostInfo? postInfo = PostInfo();

  HomePostWidget({super.key, this.postInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.25), spreadRadius: 0, blurRadius: 9, offset: const Offset(2, 3)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            _buildPostHeader(userName: postInfo?.userName, userImage: postInfo?.userImage, date: postInfo?.date, taggedUsers: postInfo?.taggedUsers),
            const SizedBox(height: 12),
            _postImages(postInfo?.images, context),
            (postInfo?.images?.length ?? 0) > 0 ? const SizedBox(height: 12) : const SizedBox.shrink(),
            PostTextWidget(
              content: postInfo?.content,
              withDivider: !((postInfo?.images?.length ?? 0) > 0),
            ),
            TagsWidget(
              tags: postInfo?.tags ?? [],
            ),
            (postInfo?.tags?.length ?? 0) > 0 ? const SizedBox(height: 16) : const SizedBox.shrink(),
            PostBottomWidget(isSaved: postInfo?.isSaved, numberOfComment: postInfo?.commentCount, numberOfLikes: postInfo?.likeCount),
          ],
        ),
      ),
    );
  }

  Widget _buildPostHeader({String? userImage, String? userName, String? date, List<String>? taggedUsers}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.white,
          child: CustomCachedImage(
            imageUrl: userImage ?? "",
            height: 25,
            width: 25,
            radius: 12,
            boxFit: BoxFit.cover,
            placeholderWidget: const ImageWaitingShimmer(height: 22),
            errorWidget: Image.asset(AppImages.test1, fit: BoxFit.cover, width: 22, height: 22),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: Row(
          children: [
            Text(
              userName ?? "",
              style: TextStyle(fontFamily: "Glory", fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.primaryColor),
            ),
            taggedUsers != null
                ? Text(
                    "${" .With " + (taggedUsers?[0] ?? "")}",
                    style: TextStyle(fontFamily: "Glory", fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.postTextColor),
                  )
                : const SizedBox.shrink()
          ],
        )),
        Text(date ?? "",
            style: TextStyle(fontFamily: "Glory", fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.primaryColor.withOpacity(0.6))),
      ],
    );
  }

  Widget _postImages(List<String>? postImages, BuildContext context) {
    return (postImages?.length ?? 0) > 0
        ? (postImages?.length ?? 0) == 3
            ? _buildThreeImages(postImages ?? [], context)
            : PostSliderWidget(
                radius: 23,
                height: 200,
                images: postImages,
              )
        : const SizedBox.shrink();
  }

  Widget _buildThreeImages(List<String> imageUrls, BuildContext context) {
    return Container(
      width: double.infinity, // Adjust according to your layout needs
      height: 300, // Adjust the height as needed
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          // First column with a single image
          Expanded(
            flex: 1, // Adjust the flex values as needed
            child: Column(
              children: [
                Expanded(
                    child: CustomCachedImage(
                  imageUrl: imageUrls[0],
                  width: double.infinity,
                  height: 360,
                  radius: 20,
                  boxFit: BoxFit.cover,
                  placeholderWidget: const ImageWaitingShimmer(height: 360),
                  errorWidget: Image.asset(AppImages.test1, fit: BoxFit.cover, width: 300, height: 300),
                )),
              ],
            ),
          ),
          const SizedBox(width: 0.0), // Space between the columns
          // Second column with two images
          Expanded(
            flex: 1, // Adjust the flex values as needed
            child: Column(
              children: [
                Expanded(
                  child: CustomCachedImage(
                    imageUrl: imageUrls[1],
                    width: MediaQuery.sizeOf(context).width * 0.40,
                    height: 360,
                    radius: 20,
                    boxFit: BoxFit.cover,
                    placeholderWidget: const ImageWaitingShimmer(height: 360),
                    errorWidget: Image.asset(AppImages.test1, fit: BoxFit.cover, width: 300, height: 300),
                  ),
                ),
                const SizedBox(height: 4.0), // Space between the two images
                Expanded(
                  child: CustomCachedImage(
                    imageUrl: imageUrls[2],
                    width: MediaQuery.sizeOf(context).width * 0.40,
                    height: 360,
                    radius: 20,
                    boxFit: BoxFit.cover,
                    placeholderWidget: const ImageWaitingShimmer(height: 360),
                    errorWidget: Image.asset(AppImages.test1, fit: BoxFit.cover, width: 300, height: 300),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
