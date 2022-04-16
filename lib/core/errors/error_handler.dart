import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';

import 'exceptions.dart';
import 'failures.dart';

mixin ErrorHandler {

  POSException getNonSuccessHttpResponseException(Response response) {
    POSException exceptionToThrow;
    switch (response.statusCode) {
      case HttpStatus.badRequest:
        exceptionToThrow = _getExceptionForLogic(response);
        break;

      case HttpStatus.unprocessableEntity:
        exceptionToThrow = _getExceptionForValidation(response);
        break;

      case HttpStatus.unauthorized:
        exceptionToThrow = _getExceptionForUnauthorised(response);
        break;

      default:
        if (response.statusCode >= 500) {
          exceptionToThrow = _getExceptionForServerError(response);
        } else {
          exceptionToThrow = _getExceptionForUnhandledError(response);
        }
        break;
    }

    return exceptionToThrow;
  }

  /// Throws [ApiLogicException] if HTTP status belongs to 400.
  POSException _getExceptionForLogic(Response response) {
    log("400 _getExceptionForLogic ${response.statusCode}");
    return _constructLogicException(response);
  }

  /// Throws [ApiLogicException] if HTTP status belongs to 401.
  POSException _getExceptionForUnauthorised(Response response) {
    log("_getExceptionForUnauthorised ${response.statusCode}");
    return _constructLogicException(response);
  }

  /// Throws [ApiLogicException] if HTTP status belongs to 403.
  POSException _getExceptionForValidation(Response response) {
    log("_getExceptionForValidation ${response.statusCode}");
    return _constructLogicException(response);
  }

  /// Throws [ServerErrorException] if HTTP status belongs to 5xx.
  POSException _getExceptionForServerError(Response response) {
    log("_getExceptionForServerError ${response.statusCode}");
    return ServerErrorException(statusCode: response.statusCode, body: response.body);
  }

  /// Throws [UnhandledServerErrorException] if HTTP status is not being handled
  POSException _getExceptionForUnhandledError(Response response) {
    log("_getExceptionForUnhandledError ${response.statusCode}");
    return UnhandledServerErrorException(statusCode: response.statusCode, body: response.body);
  }

  /// helper to construct and map the response data to [ApiLogicException]
  POSException _constructLogicException(Response response) {
    log("_constructLogicException ${response.statusCode}");
    Map<String, dynamic> json = jsonDecode(response.body);
    log(json.toString());
    return ApiLogicException(
        errorCode: json['code'], title: json['title'], message: json['message']);
  }

  Failure mapCommonExceptionToFailure(Exception exception) {
    if (exception is SocketException) {
      log("SocketException ${exception.message}");
      return ConnectionUnavailableFailure();
    }

    if (exception is FormatException) {
      log("FormatException ${exception.message}");
      return JsonFormatFailure(message: "format_failure");
    }

    if (exception is ConnectionUnavailableException) {
      log("ConnectionUnavailableException");
      return ConnectionUnavailableFailure();
    }

    if (exception is ServerErrorException) {
      log("ServerErrorException ${exception.statusCode}");
      return ServerFailure(statusCode: exception.statusCode, message: "sever_error_failure");
    }

    if (exception is UnhandledServerErrorException) {
      log("UnhandledServerErrorException ${exception.statusCode}");
      return UnhandledServerFailure(
          statusCode: exception.statusCode, message: "unhandled_server_failure");
    }
    log("UnhandledFailure ${exception.toString()}");
    return UnhandledFailure(
        className: exception.runtimeType.toString(), message: "unhandled_failure");
  }
}
