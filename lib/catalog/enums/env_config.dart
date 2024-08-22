import 'package:easy_localization/easy_localization.dart';

enum EnvironmentType { staging, production }

extension EnvironmentTypeExtension on EnvironmentType {
  String get title {
    switch (this) {
      case EnvironmentType.staging:
        return 'staging'.tr();
      case EnvironmentType.production:
        return 'production'.tr();
    }
  }
}
