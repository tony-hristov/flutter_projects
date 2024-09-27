import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'greenlight_plugin_method_channel.dart';

abstract class GreenlightPluginPlatform extends PlatformInterface {
  /// Constructs a GreenlightPluginPlatform.
  GreenlightPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static GreenlightPluginPlatform _instance = MethodChannelGreenlightPlugin();

  /// The default instance of [GreenlightPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelGreenlightPlugin].
  static GreenlightPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GreenlightPluginPlatform] when
  /// they register themselves.
  static set instance(GreenlightPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
