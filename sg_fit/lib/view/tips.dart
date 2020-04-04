import 'package:flutter/material.dart';

class Tips{
  static getTipDisplay(String text){
    return         Row(children: <Widget>[
                        Container(
                          child: Column(
                              // decoration: BoxDecoration(),
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.lightbulb_outline,
                                  color: Colors.white,
                                ),
                                Text(text,
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
                          margin: const EdgeInsets.only(
                              left: 30, top: 32, right: 25),
                          width: 350,
                          height: 100,
                          padding: EdgeInsets.only(top: 4.3),
                        )
                      ]);
  }
}

