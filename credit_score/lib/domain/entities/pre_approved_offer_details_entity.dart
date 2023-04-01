import 'package:equatable/equatable.dart';

class PreApprovedOfferDetailsEntity extends Equatable {
  final String displayName;
  final String iconUrl;
  final String shortDescription;
  final String longDescription;

  const PreApprovedOfferDetailsEntity({
    required this.displayName,
    required this.iconUrl,
    required this.shortDescription,
    required this.longDescription,
  });

  @override
  List<Object?> get props => [displayName, iconUrl, shortDescription, longDescription];
}
