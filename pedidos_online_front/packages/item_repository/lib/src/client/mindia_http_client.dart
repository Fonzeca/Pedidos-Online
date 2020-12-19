
import 'package:http/http.dart' as http;

class MindiaHttpClient extends http.BaseClient{

  final http.Client _inner;

  MindiaHttpClient(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    //TODO: envairle ApiKey
    //request.headers['apikey'] = "asd";
    return _inner.send(request);
  }
}