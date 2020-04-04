/**
 * This class implements the user registration status. 
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:sgfit/controller/user_data_read_write.dart';
import 'package:sgfit/animation/fade_animation.dart';
import 'package:sgfit/view/home_screen.dart';
import 'package:sgfit/view/display_form.dart';

class Registration {
  static getRegistrationStatus() {
    var userRegistered;
    return FutureBuilder(
        future: readFromFile(),
        builder: (BuildContext context, AsyncSnapshot<String> data) {
          if (data.hasData != null) {
            userRegistered = data.data.toString();
            return Positioned(
                child: FadeAnimation(
                    1,
                    Container(
                        margin: EdgeInsets.only(top: 200),
                        child: Center(
                            child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                          textColor: Colors.blue[600],
                          color: Colors.grey[50],
                          child: Text('Tap to Continue',
                              style: TextStyle(
                                fontSize: 20,
                              )),
                          onPressed: () {
                            if (userRegistered == "1") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DisplayForm()),
                              );
                            }
                          },
                        )))));
          }
        });
  }
}
