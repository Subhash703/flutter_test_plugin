import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_plugin/flutter_test_plugin.dart';
import 'package:flutter_test_plugin/flutter_test_plugin_platform_interface.dart';
import 'package:flutter_test_plugin/flutter_test_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterTestPluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterTestPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterTestPluginPlatform initialPlatform = FlutterTestPluginPlatform.instance;

  test('$MethodChannelFlutterTestPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterTestPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterTestPlugin flutterTestPlugin = FlutterTestPlugin();
    MockFlutterTestPluginPlatform fakePlatform = MockFlutterTestPluginPlatform();
    FlutterTestPluginPlatform.instance = fakePlatform;

    expect(await flutterTestPlugin.getPlatformVersion(), '42');
  });
}
