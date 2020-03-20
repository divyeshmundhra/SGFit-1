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

class WelcomeScreen extends StatelessWidget {
  var userRegistered;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[900],
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
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Center(child: Text("You are Registered")));
                      } else {
                        return Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child:
                                Center(child: Text("You are not Registered")));
                      }
                    }
                  }),
              Container(
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/reg_page_logo.png'))),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        child: Container(
                            margin: EdgeInsets.only(top: 170),
                            child: Center(
                                child: RaisedButton(
                              textColor: Colors.black,
                              color: Colors.cyan[300],
                              child: Text('Tap to Continue'),
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
                            )))),
                  ],
                ),
              )
            ]),
          ),
        )));
  }
}
