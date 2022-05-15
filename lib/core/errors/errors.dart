
class InvalidQrCodeException implements Exception {
  final String message;

  InvalidQrCodeException(this.message);

  @override
  String toString() => "$runtimeType Message: $message";
}

enum FailureActions {
  display,
  workAround,
}

class Failure {
  final String message;
  final FailureActions failureAction;

  Failure({
    this.failureAction = FailureActions.display,
    required this.message,
  });
}
