import 'package:dartz/dartz.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';
import 'package:quickprism/domain/dealings/models/create_requisition/create_requisition_model.dart';

abstract class IDealingRepo {
  Future<Either<MainFailures, CreateRequisitionModel>> createRequisition(
      {required CreateRequisitionModel body});
}