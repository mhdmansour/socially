import '../../catalog/enums/env_config.dart';
import '../../main.dart';

class APIUrls {

  static String get baseUrl  {
    switch(environmentType){
      case EnvironmentType.production:
        return "";
      case EnvironmentType.staging:
        return "https://api.escuelajs.co";
    }
  }

  static const String withoutApiVersion = "/api/";
  static const String apiVersion1 = "/api/v1/";


  /// ****************  Auth & Profile ****************
  static const String login = apiVersion1  + "auth/login";



}