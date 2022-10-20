import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementation extends NetworkInfo {
  final InternetConnectionChecker dataConnectionChecker;

  NetworkInfoImplementation({
    required this.dataConnectionChecker,
  });

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
