import 'package:http/http.dart';

import '../set_up.dart';
import 'api_client.dart';

class ProductService {
  final APIClient _client = locator<APIClient>();

  Future<Response> fetchProducts({String query = ''}) async {
    return _client.get(
      "instashop/products_list_view/?q=$query",
      auth: true,
    );
  }
}
