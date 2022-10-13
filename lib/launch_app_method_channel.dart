import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'launch_app_platform_interface.dart';

/// An implementation of [LaunchAppPlatform] that uses method channels.
class MethodChannelLaunchApp extends LaunchAppPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('launch_app');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<int?> launch(String packageName) async {
    final int? resultCode = await methodChannel
        .invokeMethod<int>('launch', {"packageName": packageName});

    return resultCode;
  }
}
