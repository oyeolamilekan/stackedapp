import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stackedapp/config/stacked_app.dart';

import 'routing/routes.dart';
import 'services/set_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedApp.navigationKey,
      title: 'Stacked Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/splash",
      routes: routes,
    );
  }
}
