import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectionProvider = StreamProvider((ref) {
  Stream<bool> isConnected = Connectivity().onConnectivityChanged.map((event) {
    print(event.first);
    if (event.first != ConnectivityResult.none &&
        event.first != ConnectivityResult.other) {
      return true;
    } else {
      return false;
    }
  });
  return isConnected;
});
