import 'package:flutter/material.dart';
import 'package:socially_app/catalog/view/home/view/components/home_page_header.dart';
import '../../../../common/config/app_colors.dart';
import '../../../../common/local_data.dart';
import 'components/home_post_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        extendBody: true,
        body: SafeArea(
          child: NestedScrollView(
              floatHeaderSlivers: false,
              physics: BouncingScrollPhysics(),
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                    const HomeScreenHeader(),
                  ],
              body: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
                            child: HomePostWidget(postInfo: LocaleData.localePost[index]),
                          );
                        },
                        childCount: LocaleData.localePost.length,
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
