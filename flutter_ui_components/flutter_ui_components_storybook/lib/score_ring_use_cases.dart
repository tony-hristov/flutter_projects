// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const _kMaxScore = 100.0;
const _kScoreRingWidgetSize = 50.0;
const _kStrokeWith = 3.5;
const _kImageSize = 25.0;

const _kScoreRingWidgetSizeLarge = 230.0;
const _kStrokeWithLarge = 10.0;
const _kImageSizeLarge = 105.0;

const _kIconSgvAssetNameHome = 'assets/home_loan_home_icon.svg';
const _kIconSgvAssetNameValue = 'assets/home_loan_value_icon.svg';
const _kIconSgvAssetNameEquity = 'assets/home_loan_equity_icon.svg';
const _kIconSgvAssetNameOffer = 'assets/home_loan_offer_icon.svg';

const _kStrokeColorHome = Color(0xFF008800);
const _kStrokeColorValue = Color(0xFF2E90FA);
const _kStrokeColorEquity = Color(0xFF16B364);
const _kStrokeColorOffer = Color(0xFFEF6820);
const _kStrockeFillColor = Color(0xFFD0D5DD);

const List<double> _kScoreValues = [30, 75, 90];

@widgetbook.UseCase(name: 'ScoreRing: Multiple Variants', type: ScoreRing)
Widget scoreRing_default(BuildContext context) {
  return const ScoreRingDemo();
}

class ScoreRingDemo extends StatefulWidget {
  const ScoreRingDemo({super.key});

  @override
  State<ScoreRingDemo> createState() => _ScoreRingDemoState();
}

class _ScoreRingDemoState extends State<ScoreRingDemo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Home
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(_kScoreValues.length, (index) => Text('${_kScoreValues[index].toString()}%')),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScoreRing(
                  maxScore: _kMaxScore,
                  score: 35,
                  size: _kScoreRingWidgetSizeLarge,
                  imageSize: _kImageSizeLarge,
                  strokeWidth: _kStrokeWithLarge,
                  strokeColor: _kStrokeColorHome,
                  strokeFullCircleColor: _kStrockeFillColor,
                  iconSgvAssetName: _kIconSgvAssetNameHome,
                  ringDirectionType: RingDirectionType.clockwise,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                _kScoreValues.length,
                (index) => ScoreRing(
                  maxScore: _kMaxScore,
                  score: _kScoreValues[index],
                  size: _kScoreRingWidgetSize,
                  imageSize: _kImageSize,
                  strokeWidth: _kStrokeWith,
                  strokeColor: _kStrokeColorHome,
                  strokeFullCircleColor: _kStrockeFillColor,
                  iconSgvAssetName: _kIconSgvAssetNameHome,
                  ringDirectionType: RingDirectionType.clockwise,
                ),
              ),
            ),

            // Value
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(_kScoreValues.length, (index) => Text('${_kScoreValues[index].toString()}%')),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScoreRing(
                  maxScore: _kMaxScore,
                  score: 50,
                  size: _kScoreRingWidgetSizeLarge,
                  imageSize: _kImageSizeLarge,
                  strokeWidth: _kStrokeWithLarge,
                  strokeColor: _kStrokeColorValue,
                  strokeFullCircleColor: _kStrockeFillColor,
                  iconSgvAssetName: _kIconSgvAssetNameValue,
                  ringDirectionType: RingDirectionType.counterclockwise,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                _kScoreValues.length,
                (index) => ScoreRing(
                  maxScore: _kMaxScore,
                  score: _kScoreValues[index],
                  size: _kScoreRingWidgetSize,
                  imageSize: _kImageSize,
                  strokeWidth: _kStrokeWith,
                  strokeColor: _kStrokeColorValue,
                  strokeFullCircleColor: _kStrockeFillColor,
                  iconSgvAssetName: _kIconSgvAssetNameValue,
                  ringDirectionType: RingDirectionType.counterclockwise,
                ),
              ),
            ),

            // Equity
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(_kScoreValues.length, (index) => Text('${_kScoreValues[index].toString()}%')),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScoreRing(
                  maxScore: _kMaxScore,
                  score: 60,
                  size: _kScoreRingWidgetSizeLarge,
                  imageSize: _kImageSizeLarge,
                  strokeWidth: _kStrokeWithLarge,
                  strokeColor: _kStrokeColorEquity,
                  strokeFullCircleColor: _kStrockeFillColor,
                  iconSgvAssetName: _kIconSgvAssetNameEquity,
                  ringDirectionType: RingDirectionType.counterclockwise,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                _kScoreValues.length,
                (index) => ScoreRing(
                  maxScore: _kMaxScore,
                  score: _kScoreValues[index],
                  size: _kScoreRingWidgetSize,
                  imageSize: _kImageSize,
                  strokeWidth: _kStrokeWith,
                  strokeColor: _kStrokeColorEquity,
                  strokeFullCircleColor: _kStrockeFillColor,
                  iconSgvAssetName: _kIconSgvAssetNameEquity,
                  ringDirectionType: RingDirectionType.counterclockwise,
                ),
              ),
            ),

            // Offer
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(_kScoreValues.length, (index) => Text('${_kScoreValues[index].toString()}%')),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScoreRing(
                  maxScore: _kMaxScore,
                  score: 19,
                  size: _kScoreRingWidgetSizeLarge,
                  imageSize: _kImageSizeLarge,
                  strokeWidth: _kStrokeWithLarge,
                  strokeColor: _kStrokeColorOffer,
                  strokeFullCircleColor: _kStrockeFillColor,
                  iconSgvAssetName: _kIconSgvAssetNameOffer,
                  ringDirectionType: RingDirectionType.counterclockwise,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                _kScoreValues.length,
                (index) => ScoreRing(
                  maxScore: _kMaxScore,
                  score: _kScoreValues[index],
                  size: _kScoreRingWidgetSize,
                  imageSize: _kImageSize,
                  strokeWidth: _kStrokeWith,
                  strokeColor: _kStrokeColorOffer,
                  strokeFullCircleColor: _kStrockeFillColor,
                  iconSgvAssetName: _kIconSgvAssetNameOffer,
                  ringDirectionType: RingDirectionType.counterclockwise,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
