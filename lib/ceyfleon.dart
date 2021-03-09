
import 'dart:async';

import 'package:flutter/services.dart';

class Ceyfleon {
  static const MethodChannel _channel =
      const MethodChannel('ceyfleon');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
