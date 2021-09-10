import 'package:flutter/material.dart';

import '../config/enums.dart';

class STACKEDSuspense extends StatelessWidget {
  final Appstate? appState;
  final bool optionalCondtion;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final WidgetBuilder successWidget;

  const STACKEDSuspense({
    Key? key,
    this.appState,
    this.errorWidget,
    required this.successWidget,
    this.optionalCondtion = false,
    this.loadingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (appState == Appstate.none || optionalCondtion) {
      return successWidget(context);
    } else if (appState == Appstate.loading) {
      return loadingWidget!;
    } else {
      return errorWidget ?? Container();
    }
  }
}
