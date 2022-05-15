import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_invoice_qrcode_reader/core/fixtures/app_keys.dart';

import 'errors.dart';

class ErrorHandler {
  static Future<Either<Failure, T>> handleFuture<T>(
    Future<Either<Failure, T>> Function() func,
  ) async {
    try {
      return await func.call();
    } on Exception catch (e) {
      return Left(_mapExceptionToFailure(e));
    } catch (e) {
      log(e.toString());
      return Left(
        Failure(
          message: AppKeys.error,
        ),
      );
    }
  }

  static Either<Failure, T> handle<T>(
    Either<Failure, T> Function() func,
  ) {
    try {
      return func.call();
    } on Exception catch (e) {
      return Left(_mapExceptionToFailure(e));
    } catch (e) {
      return Left(
        Failure(
          message: AppKeys.error,
        ),
      );
    }
  }

  /// maps possible exceptions to be shown in the form of a failure message
  static Failure _mapExceptionToFailure(Exception exception) {
    log(exception.toString());
    switch (exception.runtimeType) {
      case InvalidQrCodeException:
        exception as InvalidQrCodeException;
        return Failure(
          message: exception.message,
          failureAction: FailureActions.workAround,
        );
      default:
        return Failure(
          message: AppKeys.error,
        );
    }
  }
}
