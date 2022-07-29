import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  final String alertText;
  final Widget trailingWidget;
  final EdgeInsets trailingWidgetPadding;
  const AlertBox({
    Key key,
    @required this.alertText,
    @required this.trailingWidget,
    this.trailingWidgetPadding = const EdgeInsets.all(12.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            margin: EdgeInsets.all(12),
            height: 40,
            color: Colors.red.withOpacity(0.4),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      alertText,
                      style: TextStyle(
                        color: Colors.red.shade800,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: trailingWidgetPadding,
                  child: trailingWidget,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
