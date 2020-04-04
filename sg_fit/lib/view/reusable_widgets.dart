/**
 * This class implements the UI features of the Nutrition Chatbot.
 * 
 * @author Divyesh Mundhra
 * 
 */

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

  static mstyle(String text, Color color, double number) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: number, fontWeight: FontWeight.w700),
    );
  }

  static waterTrackerAppBar(){
    return AppBar(
              title: Text(
                "Water Tracker",
                style: ReusableWidgets2.kstyle(Colors.white, 18),
              ),
              backgroundColor: Colors.blue[800],
              leading: new Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    try {
                      Navigator.pop(context); //close the popup
                    } catch (e) {}
                  },
                );
              }),
              brightness: Brightness.light,
            );
  }
}
