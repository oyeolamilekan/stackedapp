import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedapp/services/storage.dart';

import '../../config/response.dart';
import '../../config/stacked_app.dart';
import '../../services/network/auth_service.dart';
import '../../services/navigation/navigation.dart';
import '../../services/set_up.dart';

class SignInViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();

  final Storage _storage = locator<Storage>();

  final NavigationsService _navigationsService = locator<NavigationsService>();

  final TextEditingController _emailTextEditorController =
      TextEditingController();

  final TextEditingController _passwordTextEditorController =
      TextEditingController();

  TextEditingController get emailTextEditorController =>
      _emailTextEditorController;

  TextEditingController get passwordTextEditorController =>
      _passwordTextEditorController;

  Future<void> loginAction() async {
    try {
      final email = _emailTextEditorController.text;
      final password = _passwordTextEditorController.text;

      final Map<String, String> data = {
        "email": email,
        "password": password,
      };

      setBusy(true);

      final response = await _authService.login(data);

      final Map<String, dynamic> decodedData = json.decode(response.body);

      final token = decodedData['token'];

      await _storage.setString("token", token);

      _navigationsService.pushNamed("/products");
    } catch (e) {
      final String errorMessage =
          ApiError.convertExceptionToString(e as Exception);
      StackedApp.errorSnackBar(errorMessage);
    }
    setBusy(false);
  }
}
