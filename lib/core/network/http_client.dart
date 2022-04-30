import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'connection_checker.dart';

abstract class HttpClient {
  Future<http.Response> postData({
    required String url,
    required String body,
  });

  Future<http.Response> putData({
    required String url,
    required String body,
  });

  Future<http.Response> getData({
    required String url,
  });
// String getBaseUrl();
}

class HttpClientImpl extends HttpClient {
  final SharedPreferences sharedPreferences;
  final ConnectionChecker connectionChecker;

  HttpClientImpl({
    required this.sharedPreferences,
    required this.connectionChecker,
  });

  @override
  Future<http.Response> postData({
    required String url,
    required String body,
  }) async {
    await _throwExceptionIfNoConnection();

    var finalUrl = Uri.parse("getBaseUrl()" + url);

    log("Posting To: $finalUrl");
    var result = await http.post(
      finalUrl,
      //headers: _getHeaders(),
      body: body,
    );
    log("Status Code: ${result.statusCode}");
    log("Phrase: ${result.reasonPhrase.toString()}");
    return result;
  }

  @override
  Future<http.Response> putData({
    required String url,
    required String body,
  }) async {
    var finalUrl = Uri.parse("getBaseUrl()" + url);

    log("Putting To: $finalUrl");

    var result = await http.put(
      finalUrl,
      //headers: _getHeaders(),
      body: body,
    );
    log("Status Code: ${result.statusCode}");
    log("Phrase: ${result.reasonPhrase.toString()}");
    return result;
  }

  @override
  Future<http.Response> getData({
    required String url,
  }) async {
    var finalUrl = Uri.parse("getBaseUrl()" + url);

    log("Getting From: $finalUrl");
    var result = await http.get(
      finalUrl,
      //headers: _getHeaders(),
    );
    log("Status Code: ${result.statusCode}");
    log("Phrase: ${result.reasonPhrase.toString()}");
    return result;
  }

  /// helper function to check if mobile has connection
  Future<void> _throwExceptionIfNoConnection() async {
    if (!await connectionChecker.isConnected()) {
      throw Exception("No Internet Connection");
    }
  }
}
