
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:socially_app/catalog/view/second/view/second_screen.dart';
import '../../common/helper/flutter_toast_helper.dart';
import '../../common/widgets/custom_bottom_navigation_bar.dart';
import 'home/view/home_screen.dart';
import 'profile/view/profile_screen.dart';

class MainTabsScreen extends StatefulWidget {
  static const routeName = 'MainTabsScreen';
  final int? currentIndex;
  const MainTabsScreen({super.key, this.currentIndex});


  @override
  State<MainTabsScreen> createState() => _MainTabsScreenState();
}

class _MainTabsScreenState extends State<MainTabsScreen> with WidgetsBindingObserver {
  int _currentIndex = 0;

  late GlobalKey<ScaffoldState> _scaffoldKey;

  bool? isEvent;

  PageController? _controller;
  void _changeIndex(int newIndex ) {
    if (newIndex == _currentIndex) return;
    if(newIndex != 1){
      isEvent = true;
    }
    setState(() {
      _currentIndex = newIndex;
      _controller?.jumpToPage(_currentIndex);

    });
  }

  void _changeBottomSheetStatus() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }







  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    if(widget.currentIndex != 0 && widget.currentIndex != null){
      _currentIndex = widget.currentIndex!;
    }
    _controller = PageController(initialPage: _currentIndex);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  DateTime? currentBackPressTime;
  Future<bool> _onBackPressed() {
    if (_currentIndex != 0) {
      _changeIndex(0);
      return Future.value(false);
    }
    isEvent = true;
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      FlutterToastHelper.showSuccessFlutterToast(context: context, message: 'press_again_to_exit'.tr());
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                const HomeScreen(),
                const SecondScreen(),
                const ProfileScreen(),


                /*ProductsScreen(isEvent: isEvent ?? true),
                const CartScreen(), //non-used item to increase space between bar items
                const FavoriteScreen(),
                const AccountScreen(),*/
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        changeBottomSheetStatus: _changeBottomSheetStatus,
        changeIndex: _changeIndex,
        // isBottomSheetOpen: false,
      ),
    );
  }
}
