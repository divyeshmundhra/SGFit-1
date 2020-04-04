/**
 * This class implements all the buttons. 
 * 
 * @author Divyesh Mundhra, Jay Gupta
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

  static getChoiceButton(
      context, double widthBtn, String text, IconData symbol, Object o) {
    return Container(
        child: RaisedButton(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.white)),
      padding: EdgeInsets.fromLTRB(widthBtn, 20, widthBtn, 20),
      textColor: Colors.white,
      color: Colors.blue[600],
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => o),
        );
      },
      child: Column(children: <Widget>[
        Icon(
          symbol,
          color: Colors.white,
          size: 100,
        ),
        Text(text, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
      ]),
    ));
  }

  static getRaisedButton(context, double widthBtn, String text, Object o) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.white)),
      padding: EdgeInsets.fromLTRB(widthBtn, 10, widthBtn, 10),
      textColor: Colors.white,
      color: Colors.blue[400],
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => o),
        );
      },
      child: Column(children: <Widget>[
        Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
      ]),
    );
  }
}
