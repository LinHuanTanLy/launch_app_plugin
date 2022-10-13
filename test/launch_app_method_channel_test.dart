import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:launch_app/launch_app_method_channel.dart';

void main() {
  MethodChannelLaunchApp platform = MethodChannelLaunchApp();
  const MethodChannel channel = MethodChannel('launch_app');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
