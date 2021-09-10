import 'package:flutter/material.dart';
import 'package:stackedapp/config/stacked_app.dart';

class NavigationsService {
  Future<T?>? pushNamed<T>(
    String route, {
    dynamic arguements,
  }) {
    return StackedApp.currentState?.pushNamed<T>(
      route,
      arguments: arguements,
    );
  }

  Future<T?>? offNamed<T>(
    String route, {
    dynamic arguements,
  }) {
    return StackedApp.currentState?.pushReplacementNamed(
      route,
      arguments: arguements,
    );
  }

  Future<T?>? offAllNamed<T>(
    String route, {
    RoutePredicate? predicate,
    dynamic arguments,
  }) {
    return StackedApp.currentState?.pushNamedAndRemoveUntil<T>(
      route,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }
}
