import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../extentions/num.dart';
import '../../view_models/auth/sign_in_view_model.dart';
import '../../widgets/button.dart';
import '../../widgets/input.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hey welcome back, Sign in."),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ViewModelBuilder<SignInViewModel>.reactive(
        viewModelBuilder: () => SignInViewModel(),
        builder: (context, viewModel, child) => Container(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: [
                STACKEDTextFormField(
                  title: "Email",
                  textEditingController: viewModel.emailTextEditorController,
                  enabled: !viewModel.isBusy,
                  textCapitalization: false,
                ),
                STACKEDTextFormField(
                  title: "Password",
                  obscureText: true,
                  enabled: !viewModel.isBusy,
                  textEditingController: viewModel.passwordTextEditorController,
                  textCapitalization: false,
                ),
                SizedBox(
                  height: 2.h,
                ),
                STACKEDButton(
                  child: viewModel.isBusy ? Text("Logging in") : Text("Log in"),
                  onPressed: () {
                    viewModel.loginAction();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
