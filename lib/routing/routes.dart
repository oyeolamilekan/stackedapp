import '../pages/auth/sign_in.dart';
import '../pages/auth/sign_out.dart';
import '../pages/auth/splash.dart';
import '../pages/index/products.dart';

final routes = {
  "/sign_in": (_) => SignIn(),
  "/sign_out": (_) => SignOut(),
  "/splash": (_) => Splash(),
  "/products": (_) => ProductsPage(),
};
