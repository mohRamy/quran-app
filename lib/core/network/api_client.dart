import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
class ApiClient extends GetConnect implements GetxService {
  late GetStorage box;
  late Map<String, String> _mainHeaders;
  ApiClient({
    required this.box,
  }) {
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  void updateHeaders(String token) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  Future<http.Response> getData(String uri,
      {Map<String, String>? headers}) async {
    http.Response response = await http.get(
      Uri.parse(uri),
      headers: headers ?? _mainHeaders,
    );
    return response;
  }

  Future<http.Response> postData(String uri, Object? body) async {
    http.Response res = await http.post(
      Uri.parse(uri),
      body: body,
      headers: _mainHeaders,
    );
    return res;
  }

  Future<http.Response> updateData(String uri) async {
    http.Response res = await http.put(
      Uri.parse(uri),
      headers: _mainHeaders,
    );
    return res;
  }
}
