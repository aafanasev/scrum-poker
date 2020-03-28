import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class WakelockPlugin {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      "wakelock",
      const StandardMethodCodec(),
      registrar.messenger,
    );

    final WakelockPlugin plugin = WakelockPlugin();

    channel.setMethodCallHandler(plugin._handleMethodCall);
  }

  Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case "toggle":
        _toggle(call.arguments["enable"]);
        break;
      case "enable":
        _toggle(true);
        break;
      case "disable":
        _toggle(false);
        break;
      case "isEnabled":
        return true;
        break;
    }
  }

  void _toggle(bool on) {
    print("asd $on");
  }
}
