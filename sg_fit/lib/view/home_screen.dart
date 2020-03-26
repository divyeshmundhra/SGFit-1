/**
 * This class implements the home screen.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:sgfit/view/help.dart';
import 'package:sgfit/view/update_particulars.dart';
import 'package:sgfit/view/diet_tracker_dashboard.dart';
import 'package:sgfit/animation/fade_animation.dart';
import 'package:sgfit/view/diettrackertry.dart';

import 'water_tracker_dashboard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.20;
    double _width_small = MediaQuery.of(context).size.width * 0.10;

    return new Scaffold(
        appBar: AppBar(
            title: Text("SGFit",
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.grey[50],
            brightness: Brightness.light,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.grey[50], //change your color here
            ),
            bottom: PreferredSize(
                child: Container(
                  color: Colors.blue[600],
                  height: 4.0,
                ),
                preferredSize: Size.fromHeight(4.0))),
        backgroundColor: Colors.grey[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FadeAnimation(
                      0.2,
                      Container(
                          child: RaisedButton(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        padding: EdgeInsets.fromLTRB(_width, 20, _width, 20),
                        textColor: Colors.white,
                        color: Colors.blue[600],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Display()),
                          );
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
                      ))),
                  SizedBox(height: 20),
                  FadeAnimation(
                      0.4,
                      Container(
                          child: RaisedButton(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        padding: EdgeInsets.fromLTRB(
                            _width + 12, 20, _width + 12, 25),
                        textColor: Colors.white,
                        color: Colors.blue[600],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DietTrackerDashboard()),
                          );
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
                      ))),
                  SizedBox(height: 40),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    padding: EdgeInsets.fromLTRB(_width, 10, _width, 10),
                    textColor: Colors.white,
                    color: Colors.blue[400],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Help()),
                      );
                    },
                    child: Column(children: <Widget>[
                      Text("ABOUT",
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
                    color: Colors.blue[400],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateParticulars()),
                      );
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
