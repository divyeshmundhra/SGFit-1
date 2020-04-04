/**
 * This class decides the welcome screen of application. If the user is not
 * registerd, then they are redirected to the one-time-registration page.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:sgfit/controller/registration.dart';

class WelcomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: Center(
            child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                height: 340,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo_full.png'))),
                child: Stack(
                  children: <Widget>[Registration.getRegistrationStatus()],
                ),
              )
            ]),
          ),
        )));
  }
}
