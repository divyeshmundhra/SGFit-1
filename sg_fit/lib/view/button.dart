/**
 * This class implements the floating Nutrition Chatbot button in the Diet
 * Tracker Dashoboard.
 * 
 * @author Divyesh Mundhra
 * 
 */

import 'package:flutter/material.dart';
import 'package:sgfit/view/chatbot_display.dart';

class Button {
  static getChatbotButton(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
      width: 90,
      height: 90,
      child: FloatingActionButton(
          shape: CircleBorder(side: BorderSide(color: Colors.white)),
          child: Icon(
            Icons.chat,
            size: 50,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FlutterFactsDialogFlow()),
            );
          }),
    );
  }
}
