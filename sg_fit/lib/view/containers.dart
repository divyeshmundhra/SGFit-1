import 'package:flutter/material.dart';
import 'package:sgfit/model/tips.dart' as globals;
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/services.dart';
import 'package:sgfit/view/reusable_widgets.dart';

class Containers {
  static container1(context) {
    return Container(
        width: 120,
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
        ),
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
        child: FloatingActionButton.extended(
          onPressed: () {
            globals.containersize = 100;

            try {
              Navigator.pop(context); //close the popup
            } catch (e) {}
            // Add your onPressed code here!
          },
          label: Text('100 ml',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              )),
          icon: Icon(
            FontAwesome5Solid.glass_martini,
            color: Colors.white,
          ),
          //icon: Icon(FontAwesome5.getIconData("glass_martini", weight: IconWeight.Solid));
          backgroundColor: Colors.blue[800],
          shape: RoundedRectangleBorder(),
        ));
  }

  static container2(context) {
    return Container(
      width: 120,
      height: 90,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
      margin: EdgeInsets.only(
        top: 28,
      ),
      child: FloatingActionButton.extended(
        onPressed: () {
          globals.containersize = 250;
          try {
            Navigator.pop(context); //close the popup
          } catch (e) {}
          // Add your onPressed code here!
        },
        label: Text('250 ml',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            )),
        icon: Icon(
          FontAwesome5Solid.coffee,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[800],
        shape: RoundedRectangleBorder(),
      ),
    );
  }

  static container3(context) {
    return Container(
      width: 120,
      height: 90,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
      margin: EdgeInsets.all(20),
      child: FloatingActionButton.extended(
        onPressed: () {
          globals.containersize = 350;

          try {
            Navigator.pop(context); //close the popup
          } catch (e) {}
          // Add your onPressed code here!
        },
        label: Text('350 ml',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            )),
        icon: Icon(
          FontAwesome5Solid.glass_whiskey,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[800],
        shape: RoundedRectangleBorder(),
      ),
    );
  }

  static container4(context) {
    return Container(
      width: 120,
      height: 90,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
      child: FloatingActionButton.extended(
        onPressed: () {
          globals.containersize = 500;

          try {
            Navigator.pop(context); //close the popup
          } catch (e) {}
          // Add your onPressed code here!
        },
        label: Text('500 ml',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            )),
        icon: Icon(
          MaterialCommunityIcons.glass_mug,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[800],
        shape: RoundedRectangleBorder(),
      ),
    );
  }

  static container5(context) {
    return Container(
      width: 120,
      height: 90,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
      margin: EdgeInsets.all(20),
      child: FloatingActionButton.extended(
        onPressed: () {
          globals.containersize = 750;

          try {
            Navigator.pop(context); //close the popup
          } catch (e) {}
          // Add your onPressed code here!
        },
        label: Text('750 ml',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            )),
        icon: Icon(
          FontAwesome5Solid.prescription_bottle,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[800],
        shape: RoundedRectangleBorder(),
      ),
    );
  }

  static container6(context) {
    return Container(
      width: 120,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: FloatingActionButton.extended(
        onPressed: () {
          globals.containersize = 1000;

          try {
            Navigator.pop(context); //close the popup
          } catch (e) {}
          // Add your onPressed code here!
        },
        label: Text('1000 ml',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            )),
        icon: Icon(
          MaterialCommunityIcons.bottle_wine,
          color: Colors.white,
          size: 35,
        ),
        backgroundColor: Colors.blue[800],
        shape: RoundedRectangleBorder(),
      ),
    );
  }

  static containerWorkoutTime(TextEditingController mycontroller) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(
              color: Colors.blue[800], width: 2, style: BorderStyle.solid)),
      child: TextField(
        textAlign: TextAlign.center,
        controller: mycontroller,
        keyboardType: TextInputType.number,
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        style: TextStyle(color: Colors.cyan[900]),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Time in mins",
            hintStyle: TextStyle(
              color: Colors.cyan[900],
            )),
      ),
    );
  }

  static containerWorkoutIntensity(TextEditingController mycontroller) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.all(2.0),
      //color: Colors.grey[100],
      decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(
              color: Colors.blue[800], width: 2, style: BorderStyle.solid)),
      child: TextField(
        textAlign: TextAlign.center,
        controller: mycontroller,
        keyboardType: TextInputType.number,
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        style: TextStyle(color: Colors.cyan[900]),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "From 1 to 5",
            hintStyle: TextStyle(
              color: Colors.cyan[900],
            )),
      ),
    );
  }

  static containerWorkout(String text) {
    return Container(
        height: 125,
        padding: EdgeInsets.only(top: 90),
        child: ReusableWidgets2.mstyle(text, Colors.blue[800], 18));
  }
}
