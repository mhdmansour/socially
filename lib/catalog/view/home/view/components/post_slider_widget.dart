import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:socially_app/common/config/app_colors.dart';
import 'package:socially_app/common/config/app_constants/app_images.dart';
import 'package:socially_app/common/widgets/Image_waiting_shimmer.dart';

import '../../../../../common/widgets/custom_cached_image.dart';

class PostSliderWidget extends StatefulWidget {
  const PostSliderWidget({Key? key, required this.images, required this.height, required this.radius, this.padding}) : super(key: key);

  final List<String?>? images;
  final double height;
  final double? radius;
  final double? padding;

  @override
  _PostSliderWidgetState createState() => _PostSliderWidgetState();
}

class _PostSliderWidgetState extends State<PostSliderWidget> {
  int _currentIndex = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return widget.images?.isNotEmpty == true
        ? Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CarouselSlider.builder(
                          itemCount: widget.images?.length,
                          carouselController: _controller,
                          itemBuilder: (context, index, realIndex) {
                            return GestureDetector(
                              onTap: () {},
                              child:
                                  // Image.asset(AppImages.testImage),
                                  Container(
                                margin: EdgeInsetsDirectional.only(
                                    start: (widget.padding ?? 0.0) > 0.0 ? (widget.padding ?? 0.0) : 0.0,
                                    end: (widget.padding ?? 0.0) > 0.0 ? (widget.padding ?? 0.0) : 0.0),
                                child: CustomCachedImage(
                                  imageUrl: widget.images?[index] ?? '',
                                  width: double.infinity,
                                  height: double.infinity,
                                  radius: (widget.radius ?? 0.0) > 1 ? widget.radius : 0,
                                  placeholderWidget: const ImageWaitingShimmer(height: double.infinity),
                                  errorWidget: Image.asset(AppImages.test1, fit: BoxFit.cover),
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            aspectRatio: widget.height / 200,
                            viewportFraction: 1,
                            enableInfiniteScroll: (widget.images?.length ?? 0) > 1 ? true : false,
                            reverse: false,
                            autoPlay: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.2,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        (widget.images?.length ?? 0) > 1
                            ? Positioned(
                                bottom: 12,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    widget.images!.length,
                                    (index) {
                                      return Container(
                                        width: 6.0,
                                        height: 6.0,
                                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _currentIndex == index ? AppColors.white : AppColors.white.withOpacity(0.5)),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
