import 'package:equatable/equatable.dart';

import 'pre_approved_offer_details_entity.dart';

class PreApprovedOfferEntity extends Equatable {
  final double approvalAmount;
  final String productType;
  final String productUrl;
  final PreApprovedOfferDetailsEntity preApprovedOfferDetails;
  final bool expired;
  final double fixedRate;

  const PreApprovedOfferEntity({
    required this.approvalAmount,
    required this.productType,
    required this.preApprovedOfferDetails,
    required this.productUrl,
    required this.expired,
    required this.fixedRate,
  });

  @override
  List<Object?> get props => [approvalAmount, productType, preApprovedOfferDetails, productUrl, expired, fixedRate];
}
