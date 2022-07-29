import 'package:flutter/material.dart';
import 'package:get_hay/constants/enum.dart';


class WidgetBuilderHelper extends StatelessWidget {
  final Widget onErrorWidget;
  final Widget onLoadingWidget;
  final Widget onSuccessWidget;
  final ViewState state;

  WidgetBuilderHelper({
    this.onErrorWidget,
    this.onLoadingWidget,
    this.onSuccessWidget,
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    /// [Conditional] render widget according to state.
    switch (state) {
      case ViewState.Busy:
        return onLoadingWidget;
      case ViewState.Error:
        return onErrorWidget;
      case ViewState.Retrieved:
      default:
        return onSuccessWidget;
    }
  }
}
