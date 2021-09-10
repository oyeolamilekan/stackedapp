import 'package:stacked/stacked.dart';

import '../../services/navigation/navigation.dart';
import '../../services/set_up.dart';
import '../../services/storage.dart';

class SplashViewModel extends BaseViewModel {
  final Storage _storage = locator<Storage>();

  final NavigationsService _navigationsService = locator<NavigationsService>();

  void initAction() {
    final token = _storage.getString("token");
    final routes = token == null ? "/sign_in" : "/products";
    Future.delayed(const Duration(seconds: 4), () {
      _navigationsService.offAllNamed(routes);
    });
  }
}
