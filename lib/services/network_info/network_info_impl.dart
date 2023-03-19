import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:photolab/services/network_info/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl(this.connectionChecker);

  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
