// import 'greenlight_plugin_platform_interface.dart';

// class GreenlightPlugin {
//   Future<String?> getPlatformVersion() {
//     return GreenlightPluginPlatform.instance.getPlatformVersion();
//   }
// }

import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:greenlight_plugin/greenlight_methodcall_handler.dart';

/// Greenlight flutter class that sets the communication with the SDK
class GreenlightPlugin {
  static final MethodChannel _channel = const MethodChannel('channels.alkami.com/greenlight')
    ..setMethodCallHandler(GreenlightMethodCallHandler().handler);

  /// Launches the Greenlight SDK
  static Future<bool?> launchSDK({
    required String familyUid,
    required bool isProduction,
    int? initialChildId,
    Map<String, dynamic>? themeData,
  }) async {
    try {
      final bool? isLaunched = await _channel.invokeMethod('launchSDK', <String, dynamic>{
        'familyUid': familyUid,
        'isProduction': isProduction,
        'initialChildId': initialChildId,
        'themeData': themeData,
      });
      log(
        'Greenlight: SDK launched - familyUid=$familyUid, isProduction=$isProduction, initialChildId=$initialChildId',
      );
      return isLaunched;
    } on PlatformException catch (error) {
      log('Greenlight: error - $error');
      return false;
    }
  }
}
