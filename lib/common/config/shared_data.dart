import 'package:socially_app/catalog/domain/remote/auth/responses/login_response.dart';

import '../../catalog/domain/models/user_info.dart';
import '../helper/shared_preferences_helper.dart';
import 'app_config.dart';

class SharedData {
  static SharedData shared = SharedData();


  UserInfoAuth? user;
  LoginResponse? userTokens;

  clearData() {
    user = null;
    userTokens = null;
  }



  updateUserInfo({required UserInfoAuth user}){
    SharedPref().save(PrefsKeys.userTAG, user);
    SharedData.shared.user = user;
  }

  saveCurrentUser({required UserInfoAuth user, required LoginResponse? tokens, bool isRestartToken = true}) {
    SharedPref().save(PrefsKeys.userTAG, user);
    SharedPref().save(PrefsKeys.tokenTAG, tokens);
    SharedData.shared.user = user;
    SharedData.shared.userTokens = tokens;
    if (isRestartToken) {
     // resetTokens();
    }
  }

  saveCurrentTokens({required LoginResponse? tokens, bool isRestartToken = true}) {
    SharedPref().save(PrefsKeys.tokenTAG, tokens);
    SharedData.shared.userTokens = tokens;
    if (isRestartToken) {
      // resetTokens();
    }
  }



  bool isGuest() {
    return SharedData.shared.userTokens?.accessToken == null;
  }




}