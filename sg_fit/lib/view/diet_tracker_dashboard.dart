/**
 * This class implements the dashboard of the Diet Tracker feature.
 *
 * @author Divyesh Mundhra, Ritik Bhatia
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sgfit/model/nutritionix_rakuten.dart';

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
  void Function() doSomething() {
    print("hi");
  }

  Future<Album> futureAlbum;
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
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
                        icon: Icon(Icons.home),
                        disabledColor: Colors.white,
                        tooltip: 'Navigation menu',
                        onPressed: doSomething(),
                        iconSize: 50.0,
                        padding: EdgeInsets.only(left: 10, top: 40),
                      ),
                      IconButton(
                        icon: Icon(Icons.cloud),
                        tooltip: 'Navigation menu',
                        onPressed: doSomething(),
                        alignment: Alignment.topRight,
                        iconSize: 50.0,
                        padding: EdgeInsets.only(left: 180, top: 40),
                        disabledColor: Colors.white,
                      ),
                      Container(
                        child: Text(
                          '32°C',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 40),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: FutureBuilder<Album>(
                            future: futureAlbum,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Center(
                                  child: Column(children: <Widget>[
                                    SizedBox(height: 85),
                                    Center(
                                      child: Text(
                                        snapshot.data.calories.toString(),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Calories",
                                      ),
                                    ),
                                  ]),
                                );
                              }
                              return Text("");
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    futureAlbum = fetchAlbum(myController.text);
                                  });
                                },
                                disabledColor: Colors.white,
                                child: Text('Enter \nFood!',
                                    style: TextStyle(
                                      color: Colors.cyan[700],
                                      fontSize: 32,
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),

                                onPressed: null,
                                disabledColor: Colors.white,
                                child: Text(
                                    '         Talk to your \n'
                                    'Personal Nutritionist \n '
                                    '              today!',
                                    style: TextStyle(
                                      color: Colors.cyan[700],
                                      fontSize: 22,
                                    )),

                                //textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.cyan[700],
                                        width: 3,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              padding: EdgeInsets.only(top: 20, left: 15)),
                        ),
                        Container(
                          child: IconButton(
                            color: Colors.cyan,
                            icon: Icon(Icons.chat),
                            iconSize: 40,
                            alignment: Alignment.centerLeft,
                          ),
                        )
                      ])
                ]),
          ),
        ),
      ),
    );
  }
}
