import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedapp/view_models/auth/sign_out_view_model.dart';
import 'package:stackedapp/widgets/button.dart';

class SignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<SignOutViewModel>.nonReactive(
        viewModelBuilder: () => SignOutViewModel(),
        builder: (context, viewModel, child) => Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sad to see you go budy, do stay safe.",
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              STACKEDButton(
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: viewModel.logOutAction,
              )
            ],
          ),
        ),
      ),
    );
  }
}
