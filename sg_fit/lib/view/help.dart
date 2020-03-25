/**
 * This class implements the help page.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.blue[600], //change your color here
          ),
        ),
        backgroundColor: Colors.grey[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.grey[50])),
                    padding: EdgeInsets.fromLTRB(_width, 20, _width, 20),
                    textColor: Colors.blue[600],
                    color: Colors.grey[50],
                    onPressed: () {
                      // Navigator.push(
                      //  context,
                      // MaterialPageRoute(builder: (context) => DisplayForm()),
                      //);
                    },
                    child: Column(children: <Widget>[
                      Icon(
                        Icons.fitness_center,
                        color: Colors.blue[400],
                        size: 100,
                      ),
                      SizedBox(height: 20),
                      Text("SGFit",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                      Text(
                        "SGFit application aims to facilitate and encourage fitness, hydration and nutritional food intake in Singapore. ",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      Text("Contact",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("Jay - JAY002@e.ntu.edu.sg",
                          style: TextStyle(fontSize: 15)),
                      Text("Divyesh - DIVYESH001@e.ntu.edu.sg",
                          style: TextStyle(fontSize: 15)),
                      Text("Swathi - SWATHI005@e.ntu.edu.sg",
                          style: TextStyle(fontSize: 15)),
                      Text("Soham - SOHAM003@e.ntu.edu.sg",
                          style: TextStyle(fontSize: 15)),
                      Text("Ritik - RITIK001@e.ntu.edu.sg",
                          style: TextStyle(fontSize: 15)),
                      Text("Nishka - NISHKA001@e.ntu.edu.sg",
                          style: TextStyle(fontSize: 15))
                    ]),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
