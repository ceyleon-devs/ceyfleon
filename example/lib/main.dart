import 'package:ceyfleon_example/translate_messages.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ceyfleon/ceyfleon.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Ceyfleon.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'UK'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget> [Text('hello'.tr),
              ElevatedButton(
              onPressed: () {
                var locale = Locale('en');
                Get.updateLocale(locale);
                Get.changeTheme(ThemeData.light());
              },
                child: Text('US'),
              ),
              ElevatedButton(
              onPressed: () {
                var locale = Locale('de');
                Get.updateLocale(locale);
                Get.changeTheme(ThemeData.dark());
              },
                child: Text('Dutch'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
