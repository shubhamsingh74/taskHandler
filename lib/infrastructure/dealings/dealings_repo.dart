import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/core/api_endpoints.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';
import 'package:quickprism/domain/dealings/i_dealing_repo.dart';
import 'package:quickprism/domain/dealings/models/create_requisition/create_requisition_model.dart';
import 'package:quickprism/infrastructure/network_client.dart';

@LazySingleton(as: IDealingRepo)
class DealingsRepo extends IDealingRepo {
  final _networkServices = NetworkClient();

  @override
  Future<Either<MainFailures, CreateRequisitionModel>> createRequisition(
      {required CreateRequisitionModel body}) async{
    body.toJson().toString().log("create bodyyy");
    try {
      var response = await _networkServices.createPostRequest(
          url: ApiEndPoints.createRequisition, data: body.toJson());
      response.data.toString().log("The requisition created");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(CreateRequisitionModel());
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? "Something went wrong"));
      }
    } catch (e) {
      e.toString().log("createe error");
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

}
