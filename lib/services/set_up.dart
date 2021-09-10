import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network/auth_service.dart';
import 'navigation/navigation.dart';
import 'network/api_client.dart';
import 'network/product_service.dart';
import 'storage.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final instance = await SharedPreferences.getInstance();

  locator.registerLazySingleton<SharedPreferences>(() => instance);
  locator.registerLazySingleton<Storage>(() => Storage());
  locator.registerLazySingleton<APIClient>(() => APIClient());
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<NavigationsService>(() => NavigationsService());
  locator.registerLazySingleton<ProductService>(() => ProductService());
}
