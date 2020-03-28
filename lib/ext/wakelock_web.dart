import 'dart:js' as js;
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class WakelockPlugin {
  bool _enabled;

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
        return _toggle(call.arguments["enable"]);
        break;
      case "enable":
        return _toggle(true);
        break;
      case "disable":
        return _toggle(false);
        break;
      case "isEnabled":
        return _enabled;
        break;
      default:
        throw PlatformException(
          code: "NotImplemented",
          details: "Unknown method: '${call.method}'",
        );
    }
  }

  bool _toggle(bool on) {
    _enabled = on;

    if (on) {
      js.context["noSleep"].callMethod("enable", []);
    } else {
      js.context["noSleep"].callMethod("disable", []);
    }

    return true;
  }
}
