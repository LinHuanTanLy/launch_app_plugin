
import 'launch_app_platform_interface.dart';

class LaunchApp {
  Future<String?> getPlatformVersion() {
    return LaunchAppPlatform.instance.getPlatformVersion();
  }

  Future<int?> launch(String packageName) {
    return LaunchAppPlatform.instance.launch(packageName);
  }
}
