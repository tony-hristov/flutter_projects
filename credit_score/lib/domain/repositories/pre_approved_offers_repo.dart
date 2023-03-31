import 'package:credit_score/domain/entities/pre_approved_offers_entity.dart';
import 'package:credit_score/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class PreApprovedOffersRepo {
  Future<Either<Failure, PreApprovedOffersEntity>> getPreApprovedOffersFromDataSource();
}
