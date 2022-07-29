import 'package:flutter/cupertino.dart';

class DisableWidget extends StatelessWidget {
  //decorator pattern

  final bool disabled;
  final Widget child;

  const DisableWidget({
    Key key,
    this.disabled,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.4 : 1,
      child: AbsorbPointer(
        absorbing: disabled,
        child: this.child,
      ),
    );
  }
}
