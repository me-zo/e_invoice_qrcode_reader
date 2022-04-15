abstract class POSException implements Exception {}

class ConnectionUnavailableException implements POSException {}

class ApiLogicException implements POSException {
  final String errorCode;
  final String? title;
  final String? message;

  ApiLogicException({required this.errorCode, this.title, this.message});

  @override
  String toString() => 'ApiLogicException(errorCode: $errorCode, title: $title, message: $message)';
}

class ServerErrorException implements POSException {
  final int statusCode;
  final String body;

  ServerErrorException({required this.statusCode, required this.body});

  @override
  String toString() => 'ServerErrorException(statusCode: $statusCode, body: $body)';
}

class UnhandledServerErrorException implements POSException {
  final int statusCode;
  final String body;

  UnhandledServerErrorException({required this.statusCode, required this.body});

  @override
  String toString() => 'UnhandledServerErrorException(statusCode: $statusCode, body: $body)';
}
