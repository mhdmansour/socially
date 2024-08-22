import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/common/common.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.changeIndex,
    required this.changeBottomSheetStatus,
  });

  final int currentIndex;
  final Function changeIndex;
  final Function changeBottomSheetStatus;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  // late OfferListBloc _offerListBloc;

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      height: bottomPadding > 20.0 ? null : 84,
      decoration: BoxDecoration(

        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.12),
              spreadRadius: 5,
              blurRadius: 12,
              offset: const Offset(0, 2)),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: widget.currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          unselectedLabelStyle: const TextStyle(
            color: Color(0xffA0A0A0),
            fontFamily: "Glory",
            fontSize: 0,
          ),
          selectedLabelStyle: const TextStyle(fontSize: 0),

          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppVectors.homeUnselected,
              ),
              activeIcon: SvgPicture.asset(
                AppVectors.homeSelected,
              ),
              label: '',
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppVectors.exploreUnselected,
              ),
              activeIcon: SvgPicture.asset(
                AppVectors.exploreSelected,
              ),
              label: '',
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppVectors.profileUnselected,
              ),
              activeIcon: SvgPicture.asset(
                AppVectors.profileSelected,
              ),
              label: '',
              backgroundColor: Colors.transparent,
            ),

          ],
          onTap: (index) {
             widget.changeIndex(index);

          },
        ),
      ),
    );
  }
}
