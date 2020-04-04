/**
 * This class implements the dashboard of the Diet Tracker feature.
 *
 * @author Divyesh Mundhra, Ritik Bhatia
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:sgfit/model/nutritionix_rakuten.dart';
import 'package:sgfit/model/weather_details.dart';
import 'package:sgfit/view/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sgfit/view/toast_message.dart';
import 'package:sgfit/controller/input_validator.dart';
import 'package:sgfit/view/button.dart';
import 'package:sgfit/view/reusable_widgets.dart';

class DietTrackerDashboard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController animationResetController;
  String caloriesConsumed = "0";
  int control_flag = 0;
  Future<WeatherDetails> tempdata;
  Future<Album> futureAlbum;
  final myController = TextEditingController();
  AnimationController _controller;
  Animation<double> _animation;

  void initState() {
    super.initState();
    animationResetController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: pi * 2);
    tempdata = getWeatherDetails();
    getDailyCalories();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );
    _animation = _controller;
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Future<dynamic> getDailyCalories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final dailyCals = prefs.get('calories');
    if (dailyCals != null) {
      setState(() {
        caloriesConsumed = dailyCals.toStringAsFixed(1);
      });
    } else {
      setState(() {
        caloriesConsumed = "0.0";
      });
    }
  }

  Future<dynamic> reset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      caloriesConsumed = "0.0";
    });
    await prefs.setDouble('calories', 0);
  }

  Future<dynamic> saveCalories(double newCals) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (control_flag == 1) {
      final calsToAdd = double.parse(caloriesConsumed) + newCals;
      prefs.setDouble('calories', calsToAdd);
    }
    control_flag = 0;
    getDailyCalories();
  }

  Widget _buildCircularProgressIndicator() {
    if (control_flag == 1)
      return SpinKitCircle(
        color: Colors.white,
        size: 50.0,
      );
    ;
    return SizedBox(height: 0);
  }

  @override
  Widget build(BuildContext context) {
    _animation = new Tween<double>(
      begin: _animation.value,
      end: double.parse('$caloriesConsumed'),
    ).animate(new CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: _controller,
    ));
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Diet Tracker", Colors.grey[50], Colors.blue[800]),
        backgroundColor: Colors.blue[800],
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: SingleChildScrollView(
                child: Column(
                    // Center is a layout widget. It takes a single child and positions it
                    // in the middle of the parent.
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: FutureBuilder<Album>(
                                future: futureAlbum,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    saveCalories(snapshot.data.calories);
                                    return Center(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 75),
                                            Center(
                                              child: new AnimatedBuilder(
                                                animation: _animation,
                                                builder: (BuildContext context,
                                                    Widget child) {
                                                  return new Text(
                                                    _animation.value
                                                        .toStringAsFixed(1),
                                                    style:
                                                        ReusableWidgets2.kstyle(
                                                            Colors.white, 60),
                                                  );
                                                },
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "Calories",
                                                style: ReusableWidgets2.kstyle(
                                                    Colors.white, 20),
                                              ),
                                            ),
                                          ]),
                                    );
                                  }
                                  return Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 60),
                                          Center(
                                            child: Text(
                                              "$caloriesConsumed",
                                              style: ReusableWidgets2.kstyle(
                                                  Colors.white, 60),
                                            ),
                                          ),
                                          Center(
                                            child: Text("Calories",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          _buildCircularProgressIndicator()
                                        ]),
                                  );
                                }),
                            margin: const EdgeInsets.only(top: 40),
                            width: 250,
                            height: 250,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border:
                                    Border.all(color: Colors.white, width: 6)),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                child: RotationTransition(
                                    turns: Tween(begin: 0.0, end: 0.2)
                                        .animate(animationResetController),
                                    child: IconButton(
                                      icon: Icon(Icons.refresh),
                                      tooltip: 'Reset diet tracker value',
                                      color: Colors.white,
                                      padding: EdgeInsets.only(left: 0),
                                      onPressed: () {
                                        reset();
                                        animationResetController.forward(
                                            from: 0.0);
                                      },
                                      iconSize: 50.0,
                                    ))),
                            Text("Reset Calories",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25))
                          ]),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                  child: FlatButton(
                                    onPressed: null,
                                    disabledColor: Colors.grey[50],
                                    child: Container(
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        controller: myController,
                                        style: TextStyle(
                                          color: Colors.blue[800],
                                          fontSize: 25,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Enter Food Item',
                                          hintStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    shape: ReusableWidgets2.border(
                                        Colors.blue[600]),
                                  ),
                                  padding: EdgeInsets.only(top: 10, right: 15)),
                            )
                          ]),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  decoration: new BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue[900],
                                        blurRadius:
                                            15.0, // has the effect of softening the shadow
                                        spreadRadius:
                                            2.0, // has the effect of extending the shadow
                                        offset: Offset(
                                          3.0, // horizontal, move right 10
                                          3.0, // vertical, move down 10
                                        ),
                                      )
                                    ],
                                  ),
                                  child: FlatButton(
                                    onPressed: () {
                                      if (InputValidator.isEmpty(
                                          myController.text)) {
                                        ToastMessage.showErrorToast(
                                            "Invalid Food Item!");
                                      } else {
                                        setState(() {
                                          futureAlbum =
                                              fetchAlbum(myController.text);
                                          control_flag = 1;
                                          _animation = new Tween<double>(
                                            begin: _animation.value,
                                            end: double.parse(
                                                '$caloriesConsumed'),
                                          ).animate(new CurvedAnimation(
                                            curve: Curves.fastOutSlowIn,
                                            parent: _controller,
                                          ));
                                        });
                                      }
                                      _controller.forward(from: 0.0);
                                    },
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    color: Colors.blue[500],
                                    child: Text('GET CALORIES',
                                        style: ReusableWidgets2.kstyle(
                                            Colors.white, 20)),
                                    shape:
                                        ReusableWidgets2.border(Colors.white),
                                  ),
                                  padding: EdgeInsets.only(
                                      top: 10, left: 15, right: 15)),
                            ),
                          ]),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ReusableWidgets2.getBubble(
                              'Chat with your Personal \n'
                              'Health Nutrition Expert!'),
                          SizedBox(width: 5),
                          Button.getChatbotButton(context),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}
