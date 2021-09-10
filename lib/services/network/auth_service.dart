import 'package:http/http.dart';

import 'api_client.dart';
import '../set_up.dart';

class AuthService {
  final APIClient _client = locator<APIClient>();

  Future<Response> login(Map data) async {
    return _client.post(
      "auth/login/",
      data,
    );
  }
}
