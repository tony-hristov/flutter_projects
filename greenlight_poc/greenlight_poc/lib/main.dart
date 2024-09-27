import 'package:flutter/material.dart';
import 'package:greenlight_plugin/greenlight_plugin.dart';
import 'package:greenlight_poc/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GreenlightPage(),
    );
  }
}

class GreenlightPage extends StatelessWidget {
  const GreenlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Greenlight test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: const Text(
                'START GREENLIGHT SDK',
              ),
              onPressed: () async {
                await GreenlightPlugin.launchSDK(
                    familyUid: kGLFamilyId, isProduction: kIsProduction, initialChildId: kGLChildId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
