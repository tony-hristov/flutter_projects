import 'package:equatable/equatable.dart';
import 'package:pretty_string/pretty_string.dart';

class FeatureFlagsEntity extends Equatable {
  final bool creditScoreEnabled;
  final bool preApprovedOffersEnabled;

  const FeatureFlagsEntity({
    required this.creditScoreEnabled,
    required this.preApprovedOffersEnabled,
  });

  @override
  List<Object?> get props => [creditScoreEnabled];

  @override
  String toString() => toPrettier();
}
