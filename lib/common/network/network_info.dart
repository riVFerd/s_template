import 'package:connectivity_plus/connectivity_plus.dart';


class NetworkInfo {
  const NetworkInfo(this.checker);

  final Connectivity checker;

  Future<List<ConnectivityResult>> getStatus() => checker.checkConnectivity();

  Future<bool> isConnected() async {
    final status = await getStatus();
    if (status.isEmpty || status.first == ConnectivityResult.none) return false;
    return true;
  }
}