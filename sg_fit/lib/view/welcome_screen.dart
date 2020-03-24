/**
 * This class decides the welcome screen of application. If the user is not
 * registerd, then they are redirected to the one-time-registration page.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:sgfit/view/display_form.dart';
import 'package:sgfit/view/home_screen.dart';
import 'package:sgfit/controller/user_data_read_write.dart';
import 'package:sgfit/animation/fade_animation.dart';

class WelcomeScreen extends StatelessWidget {
  var userRegistered;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: Center(
            child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              FutureBuilder(
                  future: readFromFile(),
                  builder: (BuildContext context, AsyncSnapshot<String> data) {
                    if (data.hasData != null) {
                      userRegistered = data.data.toString();
                      if (userRegistered == "1") {
                        return Container(
                          height: 0,
                          width: 0,
                        );
                      } else {
                        return Container(
                          height: 0,
                          width: 0,
                        );
                      }
                    }
                  }),
              Container(
                height: 340,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo_full.png'))),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        child: FadeAnimation(
                            1,
                            Container(
                                margin: EdgeInsets.only(top: 290),
                                child: Center(
                                    child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white)),
                                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                                  textColor: Colors.white,
                                  color: Colors.blue[600],
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
                                            builder: (context) =>
                                                DisplayForm()),
                                      );
                                    }
                                  },
                                ))))),
                  ],
                ),
              )
            ]),
          ),
        )));
  }
}
