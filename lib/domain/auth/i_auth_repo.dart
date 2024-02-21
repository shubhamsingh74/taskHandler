import 'package:dartz/dartz.dart';
import 'package:quickprism/domain/auth/models/auth/auth_model.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';

abstract class IAuthRepo {
  Future<Either<MainFailures, String>> sendOtp({required String phone});
  Future<Either<MainFailures, String>> verifyOtp(
      {required String phone, required String otp});
  // Future<Either<MainFailures, AuthModel>> userSignUp({
  //   required String name,
  //   required String businessName,
  //   required String phone,
  //   required String userType,
  //   required String email,
  //   required String panNo,
  //   required String gstNo,
  //   required int pin,
  //   required String street,
  //   required String city,
  //   required String state,
  // });

  Future<Either<MainFailures, AuthModel>> signIn({
    required String phone,
    required String otp,
  });

  // Future<Either<MainFailures, List<CategoryModel>>> getCategories();
}
