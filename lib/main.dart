import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:socially_app/common/common.dart';
import '../../out-buildings/dependency_injector.dart' as di;
import 'app/my_app.dart';
import 'catalog/enums/easyLoading_helper.dart';
import 'catalog/enums/env_config.dart';
import 'common/config/app_config.dart';
import 'out-buildings/development_tools_wrapper.dart';
var environmentType = EnvironmentType.staging;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  runApp(
    const DevToolsWrapper(
      MyApp(),
    ),
  );
}

Future<void> initializeApp() async {
  await EasyLocalization.ensureInitialized();

  if (PrefsKeys.init == false) {
    await di.init();
    PrefsKeys.init = true;
  }
  ///custom loading dialog
  await EasyLoadingHelper.shared.init();



  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor, // status bar color
      statusBarBrightness: Brightness.dark
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);



}


