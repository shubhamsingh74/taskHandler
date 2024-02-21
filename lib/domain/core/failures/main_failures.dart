import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_failures.freezed.dart';

@freezed
class MainFailures with _$MainFailures {
  const factory MainFailures.clientFailure({required String errorMessage}) =
      _ClientFailure;

  const factory MainFailures.serverFailure({required String errorMessage}) =
      _ServerFailure;

  // String errorMessageValue() {
  //   return map(
  //     clientFailure: (value) => value.errorMessage,
  //     serverFailure: (value) => value.errorMessage,
  //   );
  // }
}
