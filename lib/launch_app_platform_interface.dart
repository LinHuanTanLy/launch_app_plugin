import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'launch_app_method_channel.dart';

abstract class LaunchAppPlatform extends PlatformInterface {
  /// Constructs a LaunchAppPlatform.
  LaunchAppPlatform() : super(token: _token);

  static final Object _token = Object();

  static LaunchAppPlatform _instance = MethodChannelLaunchApp();

  /// The default instance of [LaunchAppPlatform] to use.
  ///
  /// Defaults to [MethodChannelLaunchApp].
  static LaunchAppPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LaunchAppPlatform] when
  /// they register themselves.
  static set instance(LaunchAppPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int?> launch(String packageName) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
