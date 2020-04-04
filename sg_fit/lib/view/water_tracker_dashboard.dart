/**
 * This class implements the Water Tracker dashboard feature of our application.
 * Daily Water Intake is calculated based on various factors using Age, Weight, 
 * Height, etc.
 *
 * @author Swathi Kumar Vembu, Nishka Khendry
 */
import 'package:flutter/material.dart';
import 'package:sgfit/view/popup.dart';
import 'package:sgfit/controller/popup_content.dart';
import 'package:sgfit/model/weather_details.dart';
import 'package:sgfit/model/tips.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sgfit/controller/user_data_read_write.dart';
import 'package:sgfit/view/appbar.dart';
import 'package:sgfit/view/toast_message.dart';
import 'package:sgfit/controller/input_validator.dart';
import 'package:sgfit/view/tips_display.dart';
import 'package:sgfit/view/reusable_widgets.dart';
import 'dart:math';
import 'package:sgfit/view/containers.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Display(title: 'Water Tracker'),
    );
  }
}

class Display extends StatefulWidget {
  Display({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> with TickerProviderStateMixin {
  AnimationController animationResetController;
  Future<WeatherDetails> tempdata;

  // @override
  void initState() {
    getdaily();
    super.initState();
    animationResetController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500), upperBound: pi * 2);
    tempdata = getWeatherDetails();
  }

  Future<dynamic> getdaily() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final waterdaily = prefs.get('waterconsumed');
    if (waterdaily != null) {
      setState(() {
        globals.waterconsumedi = waterdaily;
        waterconsumeds = waterdaily.toString();
      });
    } else {
      setState(() {
        globals.waterconsumedi = 0;
        waterconsumeds = "0";
      });
    }
  }

  String waterconsumeds = '0';
  String finaltarget = '0';
  String tip = globals.tips;
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  Future<dynamic> reset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globals.waterconsumedi = 0;
      waterconsumeds = "0";
    });
    await prefs.setInt('waterconsumed', 0);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  showPopup(BuildContext context, Widget widget, String title,
      {BuildContext popupContext}) {
    Navigator.push(
      context,
      PopupLayout(
        top: 140,
        left: 55,
        right: 55,
        bottom: 140,
        child: PopupContent(
          content: Scaffold(
            appBar: ReusableWidgets2.waterTrackerAppBar(),
            resizeToAvoidBottomPadding: false,
            body: widget,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _popupBodyWorkout() {
    return Container(
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Containers.containerWorkout("How long is your workout?"),
                Containers.containerWorkoutTime(myController1),
                Containers.containerWorkout("Rate the Intensity"),
                Containers.containerWorkoutTime(myController2),
                Container(
                  child: FloatingActionButton.extended(
                      onPressed: () {
                        if (!InputValidator.validateWorkoutDuration(
                            int.parse(myController1.text))) {
                          ToastMessage.showErrorToast(
                              "Please enter valid Workout Details");
                        } else if (!InputValidator.validateWorkoutIntensity(
                            int.parse(myController2.text))) {
                          ToastMessage.showErrorToast(
                              "Please enter valid Workout Details");
                        } else {
                          globals.workoutmins = int.parse(myController1.text);
                          globals.workoutintensity =
                              int.parse(myController2.text);
                          setState(() {
                            finaltarget = globals.target.toString();
                          });

                          try {
                            Navigator.pop(context); //close the popup
                          } catch (e) {}
                        }
                      },
                      label:
                          ReusableWidgets2.mstyle('Confirm', Colors.white, 19),
                      backgroundColor: Colors.blue[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      )),
                  margin: const EdgeInsets.only(top: 30),
                ),
              ],
            ))));
  }

  Widget _popupBodyContainer() {
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Containers.container1(context),
                Containers.container2(context),
              ]),
              Row(children: <Widget>[
                Containers.container3(context),
                Containers.container4(context),
              ]),
              Row(children: <Widget>[
                Containers.container5(context),
                Containers.container6(context),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int age = 0;
    int weight = 0;
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Water Tracker", Colors.grey[50], Colors.blue[800]),
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
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.cloud),
                            tooltip: 'Navigation menu',
                            onPressed: null,
                            alignment: Alignment.topRight,
                            iconSize: 50.0,
                            padding: EdgeInsets.only(left: 280, top: 5),
                            disabledColor: Colors.white,
                          ),
                          Container(
                            child: FutureBuilder<WeatherDetails>(
                              future: tempdata,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data.temp.toString() + '°C',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                }

                                // By default, show a loading spinner.
                                return CircularProgressIndicator();
                              },
                            ),
                            margin: const EdgeInsets.only(top: 5, left: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 30),
                                Text(
                                  '$waterconsumeds' + ' ml',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 55,
                                  ),
                                ),
                                FutureBuilder(
                                    future: readFromFileWeight(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<String> data) {
                                      if (data.hasData != null) {
                                        weight =
                                            int.parse(data.data.toString());
                                        return SizedBox(height: 0);
                                      }
                                    }),
                                FutureBuilder(
                                    future: readFromFileAge(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<String> data) {
                                      if (data.hasData != null) {
                                        age = int.parse(data.data.toString());
                                        return SizedBox(height: 0);
                                      }
                                    }),
                                FutureBuilder<WeatherDetails>(
                                  future: tempdata,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      double a =
                                          (snapshot.data.temp.toInt() * 6.5) +
                                              (globals.workoutintensity * 75) +
                                              (globals.workoutmins * 0.845) -
                                              (age * 0.15) +
                                              (weight * 28.4) +
                                              (globals.gender * 200);
                                      globals.target = a.toInt();
                                      finaltarget = globals.target.toString();
                                      return Text(
                                        'of ' + '$finaltarget' + 'ml',
                                        style: ReusableWidgets2.kstyle(
                                            Colors.white, 20),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }

                                    // By default, show a loading spinner.
                                    return CircularProgressIndicator();
                                  },
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(bottom: 40),
                            width: 250,
                            height: 250,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border:
                                    Border.all(color: Colors.white, width: 6)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  child: RotationTransition(
                                      turns: Tween(begin: 0.0, end: 0.2)
                                          .animate(animationResetController),
                                      child: IconButton(
                                        icon: Icon(Icons.refresh),
                                        tooltip: 'Reset Water Intake',
                                        color: Colors.white,
                                        padding: EdgeInsets.only(left: 0),
                                        onPressed: () {
                                          reset();
                                          animationResetController.forward(
                                              from: 0.0);
                                        },
                                        iconSize: 50.0,
                                      ))),
                              Text(" Reset Water Intake",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  ))
                            ]),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: FlatButton.icon(
                            onPressed: () {
                              showPopup(context, _popupBodyContainer(),
                                  'CHOOSE A CONTAINER');
                            },
                            label: Text('Change Container',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300,
                                )),
                            icon: Icon(
                              Icons.local_drink,
                              color: Colors.white,
                              size: 50.0,
                            ),
                          ),
                        ),
                      ]),
                      Row(children: <Widget>[
                        Container(
                            width: 210,
                            height: 130,
                            child: FlatButton(
                              color: Colors.white,
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                setState(() {
                                  globals.waterconsumedi =
                                      globals.waterconsumedi +
                                          globals.containersize;
                                  waterconsumeds =
                                      (globals.waterconsumedi).toString();
                                });

                                await prefs.setInt(
                                    'waterconsumed', globals.waterconsumedi);
                              },
                              disabledColor: Colors.white,
                              child: Text('CONFIRM WATER INTAKE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[500],
                                    fontSize: 18,
                                  )),
                              shape: ReusableWidgets2.border(Colors.blue[500]),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                            ),
                            padding: EdgeInsets.only(top: 35, left: 10)),
                        Container(
                            width: 190,
                            height: 130,
                            child: FloatingActionButton.extended(
                                onPressed: () {
                                  showPopup(context, _popupBodyWorkout(),
                                      'WORKOUT DETAILS');
                                  //reset();
                                },
                                backgroundColor: Colors.white,
                                label: Text('ADD WORKOUT\nDETAILS',
                                    textAlign: TextAlign.center,
                                    style: ReusableWidgets2.kstyle(
                                        Colors.blue[500], 18)),
                                shape:
                                    ReusableWidgets2.border(Colors.blue[500])),
                            padding: EdgeInsets.only(top: 35, left: 10)),
                      ]),
                      TipsDisplay.getTipDisplay('$tip'),
                    ]),
              ),
            ),
          ),
        ));
  }
}
