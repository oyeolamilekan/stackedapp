import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedapp/extentions/num.dart';
import 'package:stackedapp/view_models/auth/splash_view_model.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        child: ViewModelBuilder<SplashViewModel>.nonReactive(
          viewModelBuilder: () => SplashViewModel(),
          onModelReady: (onModel) => onModel.initAction(),
          builder: (context, viewModel, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator.adaptive(),
              SizedBox(
                height: 4,
              ),
              Text(
                "Loading",
                style: TextStyle(fontSize: 6.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
