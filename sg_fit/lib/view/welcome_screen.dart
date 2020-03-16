/**
 * This class decides the welcome screen of application. If the user is not registerd,
 * then they are redirected to the one-time-registration page.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:sgfit/view/display_form.dart';

class WelcomeScreen extends StatelessWidget {
  
  final bool userRegistered = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(43,93,255, 1),
      body: Center(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/reg_page_logo.png'))
              ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(top: 170),
                    child: Center(
                      child: RaisedButton(
                        textColor: Colors.white,
                    color: Colors.blue,
                  
          child: Text('Tap to Continue'),
          onPressed: () {
            if(!userRegistered) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DisplayForm()),
            );
            }
          },
          
        )
                      )
                  )
                ),
              ],
            ),
            )
          ]
          ),
          ),
        )
      )
    );  
  }
}