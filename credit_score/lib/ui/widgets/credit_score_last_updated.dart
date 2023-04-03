import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreditScoreLastUpdated extends StatelessWidget {
  static final _dateFormat = DateFormat.yMMMd('en_US');

  final DateTime? lastUpdated;
  const CreditScoreLastUpdated({required this.lastUpdated, super.key});

  @override
  Widget build(BuildContext context) {
    if (lastUpdated == null) {
      return const SizedBox.shrink();
    }

    return Text(
      'Updated ${_dateFormat.format(lastUpdated!)}',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade700,
      ),
    );
  }
}
