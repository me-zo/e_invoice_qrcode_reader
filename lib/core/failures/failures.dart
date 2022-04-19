
abstract class Failure {
  final String message;

  Failure({required this.message});

  String get detailedMessage;
}

class InvalidScanFailure extends Failure {
  final StackTrace? stackTrace;
  InvalidScanFailure({required String message, this.stackTrace}): super(message: message);

  @override
  String get detailedMessage => "$message \nStack Trace: ${stackTrace.toString()}";

}

class UnhandledFailure extends Failure {
  final StackTrace? stackTrace;
  UnhandledFailure({required String message, this.stackTrace}) : super(message:message);

  @override
  String get detailedMessage => "$message \nStack Trace: ${stackTrace.toString()}";
}

