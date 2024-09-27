import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'greenlight_plugin_platform_interface.dart';

/// An implementation of [GreenlightPluginPlatform] that uses method channels.
class MethodChannelGreenlightPlugin extends GreenlightPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('channels.alkami.com/greenlight');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
