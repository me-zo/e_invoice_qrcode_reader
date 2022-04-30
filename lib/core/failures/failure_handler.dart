import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/core/exports.dart';

class FailureHandler {
  static Either<Failure, T> handleEither<T>(
      Either<Failure, T> Function() func, String errorMessage, {String exceptionMessage = ""}) {
    try {
      return func.call().fold<Either<Failure, T>>(
            (l) => Left(l),
            (r) => Right(r),
          );
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(
        Failure(
          message: errorMessage,
        ),
      );
    }
  }

  static T handle<T>(
      T Function() func, Failure failure) {
    try {
      return func.call();
    } catch (e) {
        throw failure;
    }
  }
}
