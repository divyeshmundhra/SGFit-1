/**
 * This class implements the help page.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:sgfit/animation/fade_animation.dart';
import 'package:sgfit/view/appbar.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "About", Colors.blue[600], Colors.grey[50]),
        backgroundColor: Colors.grey[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FadeAnimation(
                      0.5,
                      Container(
                          height: 320,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/logo_full.png'))),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                  child: Container(
                                      margin: EdgeInsets.only(top: 260),
                                      child: Center(
                                          child: Text("SGFit v1.0",
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue[600]))))),
                            ],
                          ))),
                  FadeAnimation(
                      0.8,
                      RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.grey[50])),
                        padding: EdgeInsets.fromLTRB(_width, 0, _width, 20),
                        textColor: Colors.blue[600],
                        color: Colors.grey[50],
                        onPressed: () {
                          // Navigator.push(
                          //  context,
                          // MaterialPageRoute(builder: (context) => DisplayForm()),
                          //);
                        },
                        child: Column(children: <Widget>[
                          Text(
                            "SGFit application aims to facilitate and encourage fitness, hydration and nutritional food intake throughout Singapore. ",
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          Text("Creators",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text("Jay Gupta", style: TextStyle(fontSize: 15)),
                          Text("Divyesh Mundhra",
                              style: TextStyle(fontSize: 15)),
                          Text("Swathi Kumar", style: TextStyle(fontSize: 15)),
                          Text("Soham Dandapath",
                              style: TextStyle(fontSize: 15)),
                          Text("Ritik Bhatia", style: TextStyle(fontSize: 15)),
                          Text("Nishka Khendry", style: TextStyle(fontSize: 15))
                        ]),
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
