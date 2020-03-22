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
import 'package:sgfit/view/home_screen.dart';
import 'package:sgfit/view/chatbot_display.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DietTrackerDashboard extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Water Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String caloriesConsumed = "0";
  int control_flag = 0;
  Future<WeatherDetails> tempdata;
  Future<Album> futureAlbum;
  final myController = TextEditingController();

  void initState() {
    super.initState();
    tempdata = getWeatherDetails();
    getDailyCalories();
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
    if(control_flag == 1){
      final calsToAdd = double.parse(caloriesConsumed) + newCals;
      prefs.setDouble('calories', calsToAdd);
    }
    control_flag = 0;
    getDailyCalories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
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
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        disabledColor: Colors.white,
                        tooltip: 'Navigation menu',
                        onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                        },
                        iconSize: 50.0,
                        padding: EdgeInsets.only(left: 10, top: 40),
                      ),
                      IconButton(
                        icon: Icon(Icons.cloud),
                        tooltip: 'Navigation menu',
                        onPressed: null,
                        alignment: Alignment.topRight,
                        iconSize: 50.0,
                        padding: EdgeInsets.only(left: 180, top: 40),
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
                  margin: const EdgeInsets.only(top: 40, left: 15),
                ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container (
                        child: FutureBuilder<Album>(
                            future: futureAlbum,
                            builder: (context, snapshot) {                              
                              if (snapshot.hasData) {
                                saveCalories(snapshot.data.calories);
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                    SizedBox(height: 75),
                                    Center(
                                      child: Text(
                                        '$caloriesConsumed',style: TextStyle(color: Colors.white, fontSize: 60),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Calories", style: TextStyle(color: Colors.white, fontSize: 30,fontFamily: 'Montserrat')
                                      ),
                                    ),
                                  ]
                                  ),
                                );
                              }
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                  SizedBox(height: 60),
                                  Center(
                                    child: Text(
                                      "$caloriesConsumed",style: TextStyle(color: Colors.white, fontSize: 60),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "Calories", style: TextStyle(color: Colors.white, fontSize: 30,fontFamily: 'Montserrat')
                                    ),
                                  ),
                                ]),
                              );
                            }),
                        margin: const EdgeInsets.only(top: 40),
                        width: 250,
                        height: 250,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 6)),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:Center(
                        child: Container(                                                        
                        child: IconButton(                      
                        icon: Icon(Icons.refresh),
                        tooltip: 'Reset diet tracker value',
                        color: Colors.white,
                        padding: EdgeInsets.only(left: 0),
                        onPressed:() {
                          reset();
                        },
                        iconSize: 50.0,
                        )
                      ),
                    ),
                    ),
                    ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 23),
                                onPressed: null,
                                disabledColor: Colors.white,
                                child: Text('Enter Food',
                                    style: TextStyle(
                                      color: Colors.cyan[700],
                                      fontSize: 25,
                                    )),

                                //textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.cyan[700],
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              padding: EdgeInsets.only(top: 60, left: 15)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                              child: FlatButton(
                            
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                onPressed: null,
                                disabledColor: Colors.white,
                                child: Container(
                                  width: 200,
                                  child: TextField(
                                    textCapitalization:
                                        TextCapitalization.words,
                                    controller: myController,
                                    style: TextStyle(
                                        color: Colors.cyan[700], fontSize: 25),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter food here',
                                      hintStyle: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.grey[500]),
                                    ),
                                  ),
                                ),

                                //textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.cyan[100],
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              padding: EdgeInsets.only(top: 60, right: 15)),
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    futureAlbum = fetchAlbum(myController.text);
                                    control_flag = 1;
                                  });
                                },
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),

          
                                disabledColor: Colors.white,
                                child: Text(
                                    '    Confirm Entered Food',
                                    style: TextStyle(
                                      color: Colors.cyan[700],
                                      fontSize: 18,
                                    )),

                                //textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.cyan[700],
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              padding: EdgeInsets.only(top: 10, left: 15,right:15)),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         Container(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FlutterFactsDialogFlow()),
                        );
                      },
                                disabledColor: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                        '         Talk to your \n'
                                        'Personal Nutritionist \n '
                                        '              Today!',
                                        style: TextStyle(
                                          color: Colors.cyan[700],
                                          fontSize: 18,
                                        ),
                                        ),
                                        Container(
                          child: IconButton(
                            onPressed:null,
                            icon: Icon(Icons.chat),
                            iconSize: 40,
                            alignment: Alignment.centerLeft,
                          ),
                        )
                                  ],
                                ),

                                //textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.cyan[700],
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              padding: EdgeInsets.only(top: 10, left: 15,right:15)),
                        
                      ])
                ]),
          ),
        ),
      ),
    );
  }
}
