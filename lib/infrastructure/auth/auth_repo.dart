import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/domain/auth/i_auth_repo.dart';
import 'package:quickprism/domain/auth/models/auth/auth_model.dart';
import 'package:quickprism/domain/core/api_endpoints.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';
import 'package:quickprism/infrastructure/auth/auth_service.dart';
import 'package:quickprism/infrastructure/network_client.dart';


@LazySingleton(as: IAuthRepo)
class AuthRepo extends IAuthRepo {
  final _authService = AuthService();
  final _networkServices = NetworkClient();

  // Dio dio = Dio(
  //   BaseOptions(),
  // );
  // Chuck chuck = Chuck(
  //   showNotification: true,
  // );
  //
  // dio.interceptors.add(chuck.getDioInterceptor());

  @override
  Future<Either<MainFailures, String>> sendOtp({required String phone}) async {
    try {
      final Response response = await _networkServices.createPostRequest( url:  ApiEndPoints.sendOtp,
          data: {"mobile_number": int.parse(phone)});
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        final message = (response.data["message"]);

        return right(message);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, String>> verifyOtp(
      {required String phone, required String otp}) async {
    try {
      final Response response = await _networkServices.createPostRequest(url: ApiEndPoints.verifyOtp,
          data: {"mobile_number": int.parse(phone), "otp": int.parse(otp)});
      //
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
//todo implement data parsing when model available
//         final userData = AuthModel.fromJson(response.data);

        return right(response.data.toString());
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }
//
//   @override
//   Future<Either<MainFailures, AuthModel>> userSignUp({
//     required String name,
//     required String businessName,
//     required String phone,
//     required String userType,
//     required String email,
//     required String panNo,
//     required String gstNo,
//     required int pin,
//     required String street,
//     required String state,
//     required String city,
//   }) async {
//     try {
//       final Response response = await dio.post(
//         ApiEndPoints.userSignUp,
//         data: {
//           "name": name,
//           "business_name": businessName,
//           "mobile_number": phone,
//           "user_type": userType,
//           "email": email,
//           "pan": panNo,
//           "gst_no": gstNo,
//           "address": {
//             "pincode": pin,
//             "city": city,
//             "state": state,
//             "street_address": street
//           }
//         },
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         log(response.data.toString());
// //todo implement data parsing when model available
//         final authData = AuthModel.fromJson(response.data);
//         await _authService.saveUserId(authData.data.userId);
//         return right(authData);
//       } else {
//         return Left(MainFailures.serverFailure(
//             errorMessage: response.statusMessage ?? 'Something went wrong'));
//       }
//     } catch (e) {
//       return Left(MainFailures.clientFailure(errorMessage: e.toString()));
//     }
//   }

  @override
  Future<Either<MainFailures, AuthModel>> signIn({
    required String phone,
    required String otp,
  }) async {
    try {
      log('number => $phone : otp => $otp');
      final Response response = await _networkServices.createPostRequest(url : ApiEndPoints.verifyOtp,
          data: {"mobile_number": int.parse(phone), "otp": int.parse(otp)});
      //
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        final Response signinResponse = await _networkServices
            .createPostRequest(url:ApiEndPoints.userSignIn, data: {"mobile_number": phone});

        if (signinResponse.statusCode == 200 ||
            signinResponse.statusCode == 201) {
          log(signinResponse.data.toString());

          final authData = AuthModel.fromJson(signinResponse.data);
          // final authData = (response.data as List)
          //     .map((x) => AuthModel.fromJson(x))
          //     .toList();
          await _authService.saveUserId(authData.data.userId);
          return right(authData);
        } else {
          return Left(MainFailures.serverFailure(
              errorMessage:
                  signinResponse.statusMessage ?? 'Something went wrong'));
        }

        // return right(userData);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log(e.toString());

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  // @override
  // Future<Either<MainFailures, List<CategoryModel>>> getCategories() async {
  //   try {
  //     final Response response = await Dio(BaseOptions()).get(
  //       ApiEndPoints.getCategory,
  //     );
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       log(response.data.toString());
  //
  //       final categoryList = (response.data["data"] as List)
  //           .map((e) => CategoryModel.fromJson(e))
  //           .toList();
  //
  //       return right(categoryList);
  //     } else {
  //       return const Left(MainFailures.serverFailure());
  //     }
  //   } catch (e) {
  //     return const Left(MainFailures.clientFailure());
  //   }
  // }
}
