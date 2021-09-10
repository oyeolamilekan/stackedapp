import 'package:stacked/stacked.dart';

import '../../services/navigation/navigation.dart';
import '../../services/set_up.dart';
import '../../services/storage.dart';

class SignOutViewModel extends BaseViewModel {
  final NavigationsService _navigationsService = locator<NavigationsService>();

  final Storage _storage = locator<Storage>();

  void logOutAction() async {
    await _storage.resetStorage();
    _navigationsService.offAllNamed("/sign_in");
  }
}
