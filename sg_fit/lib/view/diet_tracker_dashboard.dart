/**
 * This class implements the dashboard of the Diet Tracker feature.
 *
 * @author Divyesh Mundhra, Ritik Bhatia
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sgfit/model/nutritionix_rakuten.dart';
import 'package:sgfit/model/weather_details.dart';
import 'package:sgfit/view/appbar.dart';
import 'package:sgfit/view/chatbot_display.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sgfit/view/toast_message.dart';
import 'package:sgfit/controller/input_validator.dart';

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
  String caloriesConsumed = "0";
  int control_flag = 0;
  Future<WeatherDetails> tempdata;
  Future<Album> futureAlbum;
  final myController = TextEditingController();
  AnimationController _controller;
  Animation<double> _animation;

  void initState() {
    super.initState();
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
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 60,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  );
                                                },
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "Calories",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 60,
                                                  fontWeight: FontWeight.bold),
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
                                child: IconButton(
                              icon: Icon(Icons.refresh),
                              tooltip: 'Reset diet tracker value',
                              color: Colors.white,
                              padding: EdgeInsets.only(left: 0),
                              onPressed: () {
                                reset();
                              },
                              iconSize: 50.0,
                            )),
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

                                    //textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.blue[600],
                                            width: 3,
                                            style: BorderStyle.solid),
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        )),

                                    //textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white,
                                            width: 3,
                                            style: BorderStyle.solid),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  padding: EdgeInsets.only(
                                      top: 10, left: 15, right: 15)),
                            ),
                          ]),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: new BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue[900],
                                    blurRadius:
                                        20.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        2.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      3.0, // horizontal, move right 10
                                      3.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 80),
                          Bubble(
                            margin: BubbleEdges.only(top: 10),
                            nip: BubbleNip.rightBottom,
                            child: Text(
                              'Chat with your Personal \n'
                              'Health Nutrition Expert!',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          SizedBox(width: 5),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                            width: 90,
                            height: 90,
                            child: FloatingActionButton(
                                shape: CircleBorder(
                                    side: BorderSide(color: Colors.white)),
                                child: Icon(
                                  Icons.chat,
                                  size: 50,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FlutterFactsDialogFlow()),
                                  );
                                }),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}
