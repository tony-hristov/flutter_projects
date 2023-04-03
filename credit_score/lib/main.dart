import 'package:credit_score/ui/models/credit_rating_type.dart';
import 'package:credit_score/ui/models/credit_score_display_view_model.dart';
import 'package:credit_score/ui/widgets/credit_score_display_card.dart';
import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: CreditScoreDisplayCard(
              viewModel: CreditScoreDisplayViewModel(
                score: 750,
                rating: CreditRatingType.excellent,
                lastUpdated: DateTime.parse('2023-03-23'),
                scoreChange: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
