import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:greenlight_plugin/constants.dart';

const _kMethodFetchNewToken = 'fetchNewToken';
const _kMethodGreenlightError = 'greenlightError';
const _kMethodGreenlightEvent = 'greenlightEvent';
const _kMethodOnGreenlightSdkStart = 'onGreenlightSdkStart';
const _kMethodOnGreenlightSdkClose = 'onGreenlightSdkClose';
const _kEventTypeSendMoney = 'sendMoney';
const _kEventTypeUserInteraction = 'userInteraction';

/// Provides an entry point [handler] for method channel callbacks from the SDK.
class GreenlightMethodCallHandler {
  /// An entry point for method channel callbacks from the SDK.
  ///
  /// Handles the following methods:
  ///
  /// - `fetchNewToken` - gets user token from the API via call to Greenlight
  /// - `greenlightError` - handle/log error from Greenlight SDK, such as error message
  /// - `greenlightEvent` - handle/log event from Greenlight SDK, such as "eventType"
  ///    of "sendMoney" or "userInteraction"
  Future<dynamic> handler(MethodCall methodCall) async {
    try {
      switch (methodCall.method) {
        case _kMethodFetchNewToken:
          return {
            'accessToken': kGLTokenValue,
            'expiresIn': kGLTokenExpiresIn,
            'tokenType': kGLTokenType,
          };
        case _kMethodGreenlightError:
          final String errorMessage = methodCall.arguments['errorMessage'];
          log('Greenlight: error - $errorMessage on $_kMethodGreenlightError');
          return;
        case _kMethodGreenlightEvent:
          final String eventType = methodCall.arguments['eventType'];
          log('Greenlight: received event $eventType in $_kMethodGreenlightEvent');
          switch (eventType) {
            case _kEventTypeSendMoney:
              log('Greenlight: Event type $_kEventTypeSendMoney received');
            case _kEventTypeUserInteraction:
              log('Greenlight: Event type $_kEventTypeUserInteraction received');
          }
          return;
        case _kMethodOnGreenlightSdkStart:
          // Pause the session upon start of the Greenlight SDK.
          // The session will be resumed upon closing the Greenlight SDK
          log('Greenlight: SdkStarted. Time to pause session');
          return;
        case _kMethodOnGreenlightSdkClose:
          // Resume the session upon close of the Greenlight SDK.
          // The session is paused upon start of the Greenlight SDK
          log('Greenlight: SdkStarted. Time to resume session');
          return;
        default:
          log('Greenlight: error - ${methodCall.method} does not have a handler');
          throw MissingPluginException('notImplemented');
      }
    } catch (error) {
      log('Greenlight: error - $error');
    }
    return;
  }
}
