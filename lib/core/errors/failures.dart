
abstract class Failure {
  final String message;
  final String? title;

  Failure({required this.message, this.title});

  String get detailedMessage;

  /// returning current class name as error type
  String get errorType => runtimeType.toString();
}

/// Throw if body string return is in valid json format, which cause it has the issue when trying to decode
/// Mostly will be thrown at data layer.
class JsonFormatFailure extends Failure {
  JsonFormatFailure({required String message}) : super(message: message);

  @override
  String get detailedMessage => '$message [err: json_err]';
}

/// Mobile is not connecting to wifi or data connection
class ConnectionUnavailableFailure extends Failure {
  ConnectionUnavailableFailure({String? message}) : super(message: message ?? 'No internet connection');

  @override
  String get detailedMessage => '$message [err: conn_err]';
}

/// Thrown if server http status is 5xx
class ServerFailure extends Failure {
  int? statusCode;
  ServerFailure({int? statusCode, required String message}) : super(message: message);

  @override
  String get detailedMessage => '$message [err: server_err] [statusCode: $statusCode ?? 0]';
}

/// Thrown if the status code return is not being handled
class UnhandledServerFailure extends Failure {
  int? statusCode;
  UnhandledServerFailure({int? statusCode, required String message}) : super(message: message);

  @override
  String get detailedMessage => '$message [err: unhandle_err] [statusCode: $statusCode]';
}

/// Thrown if there is error in logic
class LogicFailure extends Failure {
  LogicFailure({required String title, required String message}) : super(title: title, message: message);

  @override
  String get detailedMessage => message;
}

/// Thrown if some exception is not being handle properly
class UnhandledFailure extends Failure {
  final String className;
  final StackTrace? stackTrace;
  UnhandledFailure({required this.className, required String message, this.stackTrace}) : super(message: message);

  @override
  String get detailedMessage => '$message ${stackTrace.toString()}\n[err: unhandle_failure] \n[className: $className]';
}

/// This failure appears when the status code is 404
class NotFoundFailure extends Failure {
  NotFoundFailure(String message) : super(message: message);

  @override
  String get detailedMessage => '$message [err: json_err]';
}

/// This failure appears when the status code is 409
class ConflictFailure extends Failure {
  ConflictFailure(String message) : super(message: message);

  @override
  String get detailedMessage => '$message [err: json_err]';
}
