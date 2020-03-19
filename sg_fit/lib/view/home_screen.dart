/**
 * This class implements the home screen.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:sgfit/view/help.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.20;
    double _width_small = MediaQuery.of(context).size.width * 0.10;

    return new Scaffold(
        backgroundColor: Colors.cyan[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(_width, 20, _width, 20),
                    textColor: Colors.white,
                    color: Colors.cyan[700],
                    onPressed: () {
                      // Navigator.push(
                      //  context,
                      // MaterialPageRoute(builder: (context) => DisplayForm()),
                      //);
                    },
                    child: Column(children: <Widget>[
                      Icon(
                        Icons.opacity,
                        color: Colors.white,
                        size: 100,
                      ),
                      Text("Water Tracker",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))
                    ]),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding:
                        EdgeInsets.fromLTRB(_width + 12, 20, _width + 12, 25),
                    textColor: Colors.white,
                    color: Colors.cyan[700],
                    onPressed: () {
                      // Navigator.push(
                      //  context,
                      // MaterialPageRoute(builder: (context) => DisplayForm()),
                      //);
                    },
                    child: Column(children: <Widget>[
                      Icon(
                        Icons.fastfood,
                        color: Colors.white,
                        size: 100,
                      ),
                      Text("Diet Tracker",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))
                    ]),
                  ),
                  SizedBox(height: 40),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(_width, 10, _width, 10),
                    textColor: Colors.white,
                    color: Colors.cyan[900],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Help()),
                      );
                    },
                    child: Column(children: <Widget>[
                      Text("HELP",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ]),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding:
                        EdgeInsets.fromLTRB(_width_small, 10, _width_small, 10),
                    textColor: Colors.white,
                    color: Colors.cyan[900],
                    onPressed: () {
                      // Navigator.push(
                      //  context,
                      // MaterialPageRoute(builder: (context) => DisplayForm()),
                      //);
                    },
                    child: Column(children: <Widget>[
                      Text("UPDATE PARTICULARS",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ]),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
