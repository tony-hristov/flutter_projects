import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final Uri googleUrl = Uri.https('google.com', '/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("URL Launcher"),
      ),
      body: ListView(
        children: <Widget>[
          LaunchButton(uri: googleUrl, launchMode: LaunchMode.externalApplication),
          LaunchButton(uri: googleUrl, launchMode: LaunchMode.externalNonBrowserApplication),
          LaunchButton(uri: googleUrl, launchMode: LaunchMode.inAppBrowserView),
          LaunchButton(uri: googleUrl, launchMode: LaunchMode.inAppWebView),
          LaunchButton(uri: googleUrl, launchMode: LaunchMode.platformDefault),
        ],
      ),
    );
  }
}

class LaunchButton extends StatelessWidget {
  final Uri uri;
  final LaunchMode launchMode;
  const LaunchButton({
    required this.uri,
    required this.launchMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
      child: ListTile(
        title: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 1.0),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
            if (await canLaunchUrl(uri)) {
              await launchUrl(
                uri,
                mode: launchMode,
                browserConfiguration: const BrowserConfiguration(showTitle: false),
              );
            } else {
              throw 'Could not launch $uri)';
            }
          },
          child: Text('LaunchMode: $launchMode'),
        ),
      ),
    );
  }
}
