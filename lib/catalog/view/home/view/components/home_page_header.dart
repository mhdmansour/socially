import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socially_app/catalog/view/home/view/components/home_app_bar_notification_widget.dart';
import 'package:socially_app/catalog/view/home/view/components/home_page_title.dart';
import 'package:socially_app/common/config/app_colors.dart';
import 'package:socially_app/common/config/app_constants/app_images.dart';
import 'package:socially_app/common/widgets/Image_waiting_shimmer.dart';
import 'package:socially_app/common/widgets/custom_cached_image.dart';

import '../../../../../app/app_routes.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: false,
      snap: false,
      centerTitle: true,
      leadingWidth: 45,
      toolbarHeight: 160,
      backgroundColor: AppColors.primaryColor,
      title: Column(
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomePageTitle(),
                ],
              ),
              HomeNotificationWidget(),
            ],
          ),
          SizedBox(height: 12),
          Container(
            height: 76,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: const BorderRadius.all(const Radius.circular(48)),
              //border: Border.all(width: 2, color: )
            ),
            child: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(8, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.storyScreen);
                          },
                          child: Container(
                            height: 57,
                            width: 57,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, border: Border.all(color: Colors.white, width: 2)),
                            child: CustomCachedImage(
                              imageUrl:
                                  "https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                              radius: 30,
                              boxFit: BoxFit.cover,
                              placeholderWidget: const ImageWaitingShimmer(height: 22),
                              errorWidget: Image.asset(AppImages.test1, fit: BoxFit.cover, width: 22, height: 22),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
