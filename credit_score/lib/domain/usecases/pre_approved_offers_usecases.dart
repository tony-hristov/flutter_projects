import 'package:credit_score/domain/entities/pre_approved_offers_entity.dart';
import 'package:credit_score/domain/failures/failures.dart';
import 'package:credit_score/domain/repositories/pre_approved_offers_repo.dart';
import 'package:dartz/dartz.dart';

class PreApprovedOffersUseCases {
  final PreApprovedOffersRepo preApprovedOffersRepo;

  PreApprovedOffersUseCases({required this.preApprovedOffersRepo});

  Future<Either<Failure, PreApprovedOffersEntity>> getPreApprovedOffers() {
    return preApprovedOffersRepo.getPreApprovedOffersFromDataSource();
  }
}
