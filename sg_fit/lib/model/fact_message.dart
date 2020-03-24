import 'package:flutter/material.dart';

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
          child: new Icon(Icons.face),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.blue[600],
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
            Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              padding: EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(color: Colors.black),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          child: new Icon(Icons.account_circle),
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
