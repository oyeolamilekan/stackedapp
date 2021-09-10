import 'dart:convert';

import 'package:stacked/stacked.dart';

import '../../config/enums.dart';
import '../../config/response.dart';
import '../../config/stacked_app.dart';
import '../../models/products.dart';
import '../../services/network/product_service.dart';
import '../../services/set_up.dart';

class ProductViewModel extends BaseViewModel {
  final ProductService _productService = locator<ProductService>();

  Appstate appstate = Appstate.loading;

  List<Products> products = [];

  Future<void> fetchProducts() async {
    try {
      final response = await _productService.fetchProducts();
      Map<String, dynamic> decodedData = jsonDecode(response.body);
      products = Products.resolveList(decodedData['results']);
      appstate = Appstate.none;
      notifyListeners();
    } catch (e) {
      final String errorMessage =
          ApiError.convertExceptionToString(e as Exception);
      StackedApp.errorSnackBar(errorMessage);
    }
  }
}
