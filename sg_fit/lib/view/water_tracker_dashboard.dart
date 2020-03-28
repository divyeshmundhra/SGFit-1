/**
 * This class implements the Water Tracker dashboard feature of our application.
 * Daily Water Intake is calculated based on various factors using Age, Weight, 
 * Height, etc.
 *
 * @author Swathi Kumar, Nishka Khendry
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sgfit/view/popup.dart';
import 'package:sgfit/controller/popup_content.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:sgfit/model/weather_details.dart';
import 'package:sgfit/model/tips.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sgfit/controller/user_data_read_write.dart';
import 'package:sgfit/view/appbar.dart';

//void main() => runApp(MyApp());

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

class _DisplayState extends State<Display> {
  Future<WeatherDetails> tempdata;

  // @override
  void initState() {
    print('lalallalal');
    getdaily();
    super.initState();
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
    print('THIS IS WATER DAILY $waterdaily');
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
            appBar: AppBar(
              title: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.blue[800],
              leading: new Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    try {
                      Navigator.pop(context); //close the popup
                    } catch (e) {}
                  },
                );
              }),
              brightness: Brightness.light,
            ),
            resizeToAvoidBottomPadding: false,
            body: widget,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _popupBodyWorkout() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        // Row(children: <Widget>[
        Container(
          height: 125,
          padding: EdgeInsets.only(top: 90),
          child: Text(
            "How long is your workout?",
            style: TextStyle(
                color: Colors.blue[800],
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          // padding: EdgeInsets.all(2.0),
          //padding: EdgeInsets.only(bottom: 20),
          //color: Colors.grey[100],
          decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(
                  color: Colors.blue[800], width: 2, style: BorderStyle.solid)),

          child: TextField(
            textAlign: TextAlign.center,
            controller: myController1,
            keyboardType: TextInputType.number,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            style: TextStyle(color: Colors.cyan[900]),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Time in mins",
                hintStyle: TextStyle(
                  color: Colors.cyan[900],
                )),
          ),
        ),
        Container(
          height: 125,
          padding: EdgeInsets.only(top: 90),
          child: Text(
            "Rate the Intensity",
            style: TextStyle(
                color: Colors.blue[800],
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          padding: EdgeInsets.all(2.0),
          //color: Colors.grey[100],
          decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(
                  color: Colors.blue[800], width: 2, style: BorderStyle.solid)),
          child: TextField(
            textAlign: TextAlign.center,
            controller: myController2,
            keyboardType: TextInputType.number,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            style: TextStyle(color: Colors.cyan[900]),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "From 1 to 5",
                hintStyle: TextStyle(
                  color: Colors.cyan[900],
                )),
          ),
        ),
        Container(
          child: FloatingActionButton.extended(
              onPressed: () {
                globals.workoutmins = int.parse(myController1.text);
                globals.workoutintensity = int.parse(myController2.text);
                //WaterTracker.calculateTarget();
                setState(() {
                  finaltarget = globals.target.toString();
                });

                try {
                  Navigator.pop(context); //close the popup
                } catch (e) {}
              },
              label: Text('Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  )),
              backgroundColor: Colors.blue[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
              )),
          margin: const EdgeInsets.only(top: 30),
        ),

        // ]
        // ),
      ],
    );
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
                Container(
                  width: 120,
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  margin:
                      EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      globals.containersize = 100;

                      try {
                        Navigator.pop(context); //close the popup
                      } catch (e) {}
                      // Add your onPressed code here!
                    },
                    label: Text('100 ml',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        )),
                    icon: Icon(
                      FontAwesome5Solid.glass_martini,
                      color: Colors.white,
                    ),
                    //icon: Icon(FontAwesome5.getIconData("glass_martini", weight: IconWeight.Solid));
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(),
                  ),
                ),
                Container(
                  width: 120,
                  height: 90,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2)),
                  margin: EdgeInsets.only(
                    top: 28,
                  ),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      globals.containersize = 250;

                      try {
                        Navigator.pop(context); //close the popup
                      } catch (e) {}
                      // Add your onPressed code here!
                    },
                    label: Text('250 ml',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        )),
                    icon: Icon(
                      FontAwesome5Solid.coffee,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Container(
                  width: 120,
                  height: 90,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2)),
                  margin: EdgeInsets.all(20),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      globals.containersize = 350;

                      try {
                        Navigator.pop(context); //close the popup
                      } catch (e) {}
                      // Add your onPressed code here!
                    },
                    label: Text('350 ml',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        )),
                    icon: Icon(
                      FontAwesome5Solid.glass_whiskey,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(),
                  ),
                ),
                Container(
                  width: 120,
                  height: 90,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2)),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      globals.containersize = 500;

                      try {
                        Navigator.pop(context); //close the popup
                      } catch (e) {}
                      // Add your onPressed code here!
                    },
                    label: Text('500 ml',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        )),
                    icon: Icon(
                      MaterialCommunityIcons.glass_mug,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Container(
                  width: 120,
                  height: 90,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2)),
                  margin: EdgeInsets.all(20),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      globals.containersize = 750;

                      try {
                        Navigator.pop(context); //close the popup
                      } catch (e) {}
                      // Add your onPressed code here!
                    },
                    label: Text('750 ml',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        )),
                    icon: Icon(
                      FontAwesome5Solid.prescription_bottle,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(),
                  ),
                ),
                Container(
                  width: 120,
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      globals.containersize = 1000;

                      try {
                        Navigator.pop(context); //close the popup
                      } catch (e) {}
                      // Add your onPressed code here!
                    },
                    label: Text('1000 ml',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        )),
                    icon: Icon(
                      MaterialCommunityIcons.bottle_wine,
                      color: Colors.white,
                      size: 35,
                    ),
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(),
                  ),
                ),
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
      body: Container(
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
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FutureBuilder(
                                future: readFromFileWeight(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> data) {
                                  if (data.hasData != null) {
                                    weight = int.parse(data.data.toString());
                                    print(weight);
                                    return Text('');
                                  }
                                }),
                            FutureBuilder(
                                future: readFromFileAge(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> data) {
                                  if (data.hasData != null) {
                                    age = int.parse(data.data.toString());
                                    print(age);
                                    return Text('');
                                  }
                                }),
                            Text(
                              '$waterconsumeds' + ' ml',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                              ),
                            ),
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
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
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
                            border: Border.all(color: Colors.white, width: 6)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(children: <Widget>[
                    Container(
                      child: FlatButton.icon(
                        onPressed: () {
                          reset();
                        },
                        label: Text('Reset Water Intake',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w300,
                            )),
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 50.0,
                        ),

                        // backgroundColor: Colors.cyan[900],
                        shape: RoundedRectangleBorder(),
                      ),
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

                        // backgroundColor: Colors.cyan[900],
                        shape: RoundedRectangleBorder(),
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
                            print('start');
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            setState(() {
                              globals.waterconsumedi = globals.waterconsumedi +
                                  globals.containersize;
                              waterconsumeds =
                                  (globals.waterconsumedi).toString();
                              print(globals.containersize);
                            });

                            await prefs.setInt(
                                'waterconsumed', globals.waterconsumedi);
                            print('end');
                          },
                          disabledColor: Colors.white,

                          child: Text('CONFIRM WATER INTAKE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[500],
                                fontSize: 18,
                              )),

                          //textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.blue[500],
                                  width: 3,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10)),
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
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[500],
                                fontSize: 18,
                              )),

                          //textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.blue[500],
                                  width: 3,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10)),
                          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                        ),
                        padding: EdgeInsets.only(top: 35, left: 10)),
                  ]),
                  Row(children: <Widget>[
                    Container(
                      child: Column(
                          // decoration: BoxDecoration(),
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.lightbulb_outline,
                              color: Colors.white,
                            ),
                            Text('$tip',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ))
                          ] //
                          ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.white,
                      )),
                      margin:
                          const EdgeInsets.only(left: 30, top: 32, right: 25),
                      width: 350,
                      height: 100,
                      padding: EdgeInsets.only(top: 4.3),
                    )
                  ]),
                ]),
          ),
        ),
      ),
    );
  }
}
