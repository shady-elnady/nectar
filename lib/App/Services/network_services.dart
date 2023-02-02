import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkService {
  Future<bool> get isConnected;
}

class NetworkConnection implements NetworkService {
  final InternetConnectionChecker connectionChecker;

  NetworkConnection(this.connectionChecker);
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
