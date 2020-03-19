/**
 * This is the controller class which initialises the application.
 *
 * @author XYZ
 */
import 'package:flutter/material.dart';
import 'package:sgfit/view/display_form.dart';
import 'dart:async';

import 'package:sgfit/view/home_screen.dart';

void main() async {
  runApp(Startup());
}

class Startup extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        title: "SGFit",
        theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Open Sans',
                bodyColor: Colors.white,
                displayColor: Colors.white)),
        home: HomeScreen());
  }
}
