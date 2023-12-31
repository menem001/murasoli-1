import 'dart:io';

class CheckInternet {
  static Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return  true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
    return false;
  }
}
