import 'package:equatable/equatable.dart';

import 'pre_approved_offer_entity.dart';

class PreApprovedOffersEntity extends Equatable {
  final List<PreApprovedOfferEntity> results;

  const PreApprovedOffersEntity({this.results = const []});

  @override
  List<Object?> get props => [];
}
