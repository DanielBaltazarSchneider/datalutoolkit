import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static final AppInfo _singleton = AppInfo._internal();

  factory AppInfo() {
    return _singleton;
  }

  AppInfo._internal();

  PackageInfo? packageInfo;

  String? appName;
  String? packageName;
  String? version;
  String? buildNumber;

  Future<void> getInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo!.appName;
    packageName = packageInfo!.packageName;
    version = packageInfo!.version;
    buildNumber = packageInfo!.buildNumber;
  }
}
