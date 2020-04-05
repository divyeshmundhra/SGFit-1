/**
 * This class checks if the device is connected to the internet.
 *
 * @author Jay Gupta
 */

import 'dart:io';

class Network {
  static checkNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Future<int>.value(1);
      }
    } on SocketException catch (_) {
      return Future<int>.value(0);
    }
  }
}
