import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectionChecker {
  Future<bool> isConnected();
}

class ConnectionCheckerImpl extends ConnectionChecker {
  final Connectivity connectivity;

  ConnectionCheckerImpl({
    required this.connectivity,
  });

  @override
  Future<bool> isConnected() async {
    var connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
}
