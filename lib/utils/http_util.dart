import 'package:http/http.dart' as http;

class WildPulseHttp {

  static final WildPulseHttp _instance = WildPulseHttp._internal();

  factory WildPulseHttp() => _instance;

  WildPulseHttp._internal();

  final http.Client _client = http.Client();

  http.Client get client => _client;

  void close() {
    _client.close();
  }

}