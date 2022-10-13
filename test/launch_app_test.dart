import 'package:flutter_test/flutter_test.dart';
import 'package:launch_app/launch_app.dart';
import 'package:launch_app/launch_app_platform_interface.dart';
import 'package:launch_app/launch_app_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLaunchAppPlatform 
    with MockPlatformInterfaceMixin
    implements LaunchAppPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LaunchAppPlatform initialPlatform = LaunchAppPlatform.instance;

  test('$MethodChannelLaunchApp is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLaunchApp>());
  });

  test('getPlatformVersion', () async {
    LaunchApp launchAppPlugin = LaunchApp();
    MockLaunchAppPlatform fakePlatform = MockLaunchAppPlatform();
    LaunchAppPlatform.instance = fakePlatform;
  
    expect(await launchAppPlugin.getPlatformVersion(), '42');
  });
}
