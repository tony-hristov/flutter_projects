import 'package:flutter/material.dart';

Widget createMaterialApp(Widget widget) {
  final key = GlobalKey<NavigatorState>();
  return MaterialApp(
    navigatorKey: key,
    home: Scaffold(
      body: widget,
    ),
    // localizationsDelegates: null,
    // supportedLocales: const [
    //   Locale('en', ''), // English, no country code
    //   Locale('es', '')
    // ],
  );
}
