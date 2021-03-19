import 'package:flutter_learn/helpers/constants.dart';
import 'package:http/http.dart' show Client, Response;

class ApiClient {
  final Client client = Client();

  Future<Response> getUsers() async {
    return client.get(getUri(Apis.users));
  }

  Uri getUri(String endpoint) {
    return Uri.parse('$baseUrl$endpoint');
  }
}
