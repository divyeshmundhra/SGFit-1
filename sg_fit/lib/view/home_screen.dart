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
import 'package:sgfit/view/appbar.dart';
import 'package:sgfit/view/button.dart';
import 'package:sgfit/view/water_tracker_dashboard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthBtn = MediaQuery.of(context).size.width * 0.20;
    double widthSmallBtn = MediaQuery.of(context).size.width * 0.10;

    return new Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "SGFit", Colors.blue[600], Colors.grey[50]),
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
                      Button.getChoiceButton(context, widthBtn, "Water Tracker",
                          Icons.opacity, Display())),
                  SizedBox(height: 20),
                  FadeAnimation(
                    0.4,
                    Button.getChoiceButton(context, widthBtn + 12,
                        "Diet Tracker", Icons.fastfood, DietTrackerDashboard()),
                  ),
                  SizedBox(height: 40),
                  Button.getRaisedButton(context, widthBtn, "ABOUT", Help()),
                  SizedBox(height: 20),
                  Button.getRaisedButton(context, widthSmallBtn,
                      "UPDATE PARTICULARS", UpdateParticulars()),
                ],
              )
            ],
          ),
        ));
  }
}
