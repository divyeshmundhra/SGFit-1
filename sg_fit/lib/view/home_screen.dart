/**
 * This class implements the home screen.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[900],
        body: Container(
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.opacity),
                                    tooltip: 'Water Tracker',
                                    onPressed: () {}),
                                Text('Water Tracker'),
                              ]),
                        ],
                      ))
                ])))));
  }
}
