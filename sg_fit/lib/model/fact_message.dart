/**
 * This class retreives the answer to the nutrition-related query made by the
 * user using Google DialogFlow
 *
 * @author Soham Dandapath
 */
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class FactsMessage extends StatelessWidget {
  FactsMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> botMessage(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(
          child: new Icon(
            Icons.face,
            size: 50,
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              nip: BubbleNip.leftTop,
              color: Colors.blue[600],
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> userMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(this.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            Bubble(
              margin: BubbleEdges.only(top: 10),
              nip: BubbleNip.rightTop,
              color: Colors.grey[200],
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16),
        child: CircleAvatar(
          child: new Icon(Icons.account_circle, size: 50),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ), //Text(this.name[0])
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? userMessage(context) : botMessage(context),
      ),
    );
  }
}
