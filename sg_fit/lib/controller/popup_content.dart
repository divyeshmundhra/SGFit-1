/**
 * This class implements the pop-up of the Water Tracker Dashboard.
 *
 * @author Swathi Kumar Vembu, Nishka Khendry
 */
import 'package:flutter/material.dart';

class PopupContent extends StatefulWidget {
  final Widget content;

  PopupContent({
    Key key,
    this.content,
  }) : super(key: key);

  _PopupContentState createState() => _PopupContentState();
}

class _PopupContentState extends State<PopupContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.content,
    );
  }
}
