import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class ReusableWidgets2 {
  static getBubble(
    String text,
  ) {
    return Bubble(
      margin: BubbleEdges.only(top: 10),
      nip: BubbleNip.rightBottom,
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }

  static border(Color color) {
    return RoundedRectangleBorder(
        side: BorderSide(color: color, width: 3, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10));
  }

  static kstyle(Color color, double number) {
    return TextStyle(
        color: color, fontSize: number, fontWeight: FontWeight.bold);
  }
}
