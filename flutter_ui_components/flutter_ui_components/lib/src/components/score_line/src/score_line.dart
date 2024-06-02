import 'package:flutter/material.dart';

import 'score_data.dart';

final List<ScoreData> _kCreditScoreRatingsList = List.unmodifiable([
  const ScoreData(color: Color(0xFFAA0000), semanticLabel: 'Very Poor'),
  const ScoreData(color: Color(0xFFE38D1C), semanticLabel: 'Poor'),
  const ScoreData(color: Color(0xFFFFC229), semanticLabel: 'Fair'),
  const ScoreData(color: Color(0xFF008800), semanticLabel: 'Good'),
  const ScoreData(color: Color(0xFF005216), semanticLabel: 'Excellent'),
]);

class ScoreLine extends StatelessWidget {
  static const _kLineHeight = 4.0;
  static const _kCircleHeight = 11.0;
  static const _kCircleBorderWidth = 3.0;

  final List<ScoreData> ratingsList;
  final int ratingIndex;

  const ScoreLine({required this.ratingsList, required this.ratingIndex, super.key});

  ScoreLine.creditScore({required this.ratingIndex, super.key}) : ratingsList = _kCreditScoreRatingsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: const Key('score_line'),
      child: Row(
        children: List.generate(ratingsList.length, (index) {
          return Flexible(
            child: Container(
              margin: index < ratingsList.length - 1
                  ? const EdgeInsets.symmetric(horizontal: 4)
                  : const EdgeInsets.only(left: 4),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    key: Key('score_line_rating_$index'),
                    height: _kLineHeight,
                    decoration: BoxDecoration(
                      color: ratingsList[index].color,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                  ),
                  if (ratingIndex == index)
                    Semantics(
                      label: ratingsList[index].semanticLabel,
                      child: Container(
                        key: Key('score_line_rating_${index}_current'),
                        height: _kCircleHeight,
                        width: _kCircleHeight,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(_kCircleHeight)),
                            border: Border.all(color: ratingsList[index].color, width: _kCircleBorderWidth)),
                      ),
                    )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
