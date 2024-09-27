import 'package:flutter_test/flutter_test.dart';
import 'package:greenlight_plugin/greenlight_plugin.dart';
import 'package:greenlight_plugin/greenlight_plugin_platform_interface.dart';
import 'package:greenlight_plugin/greenlight_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGreenlightPluginPlatform
    with MockPlatformInterfaceMixin
    implements GreenlightPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GreenlightPluginPlatform initialPlatform = GreenlightPluginPlatform.instance;

  test('$MethodChannelGreenlightPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGreenlightPlugin>());
  });

  test('getPlatformVersion', () async {
    GreenlightPlugin greenlightPlugin = GreenlightPlugin();
    MockGreenlightPluginPlatform fakePlatform = MockGreenlightPluginPlatform();
    GreenlightPluginPlatform.instance = fakePlatform;

    expect(await greenlightPlugin.getPlatformVersion(), '42');
  });
}
