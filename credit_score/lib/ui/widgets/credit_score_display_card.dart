import 'package:credit_score/ui/models/credit_score_display_view_model.dart';
import 'package:flutter/material.dart';

import 'credit_score_change_indicator.dart';
import 'credit_score_last_updated.dart';

class CreditScoreDisplayCard extends StatelessWidget {
  final CreditScoreDisplayViewModel viewModel;
  const CreditScoreDisplayCard({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Credit Score'.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            )),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              viewModel.score.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 8),
            CreditScoreChangeIndicator(scoreChange: viewModel.scoreChange),
          ],
        ),
        const SizedBox(height: 12),
        CreditScoreLastUpdated(lastUpdated: viewModel.lastUpdated),
      ],
    );
  }
}
