import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/core/exports.dart';

class FailureHandler {
  static Either<Failure, T> handleFunction<T>(
  T Function() func, String errorMessage) {
    try {
      return Right(func.call());
    } on Exception {
      return Left(
        Failure(
          message: errorMessage,
        ),
      );
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }
}
