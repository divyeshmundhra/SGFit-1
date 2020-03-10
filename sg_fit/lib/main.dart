import 'package:flutter/material.dart';
import 'package:sgfit/view/LogoDisplay.dart';

void main() => runApp(Startup());

class Startup extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "SGFit",
      home: LogoDisplay()
    );
  }
}