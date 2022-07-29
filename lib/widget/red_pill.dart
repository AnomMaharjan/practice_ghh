import 'package:flutter/material.dart';

class StatefulRedPill extends StatefulWidget {
  final String text;
  final Function onChanged;

  const StatefulRedPill({Key key, @required this.text, this.onChanged})
      : super(key: key);

  @override
  _StatefulRedPillState createState() => _StatefulRedPillState();
}

class _StatefulRedPillState extends State<StatefulRedPill> {
  bool _selected = false;

  void _onTap() {
    setState(() {
      _selected = !_selected;
    });

    if (widget.onChanged != null) widget.onChanged(_selected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: _selected ? Colors.red : Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: _selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class RedPill extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const RedPill({
    Key key,
    @required this.text,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: this.isSelected ? Colors.red : Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          this.text,
          style: TextStyle(
            color: this.isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
