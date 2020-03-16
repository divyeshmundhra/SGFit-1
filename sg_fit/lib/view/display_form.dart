/**
 * This class implements the one-time registration of the user when they launch
 * the application for the first time and input details which include Height,
 * Weight and Age.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';

class DisplayForm extends StatefulWidget {
  State createState() =>  RegistrationPageState();
}


class RegistrationPageState extends State<DisplayForm> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(43,93,255, 1),
      body: Container(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/reg_page_logo.png'))
              ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(top: 170),
                    child: Center(
                      child: Text("Welcome", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
                      )
                  )
                ),
              ],
            )
            ),
            Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                  child: Container(
                    child: Center(
                      child: Text("To get started, we'll need to know some details!", textAlign: TextAlign.center ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)
                      )
                  )
                  )
                ),
            Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
	                  Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(255, 255, 255, .5),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
                      child: Column(
	                      children: <Widget>[
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                              style: TextStyle(color: Colors.black),
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Name",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
                          Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.number,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Age",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
                          Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100])),
	                          ),
	                          child: 
                            Align(
                              alignment: Alignment.centerLeft,
                              child: DropdownButton<String>(
          items: [
            DropdownMenuItem<String>(
              child: Text('Male', style: TextStyle(
      color: Colors.black,)),
              value: 'Male',
            ),
            DropdownMenuItem<String>(
              child: Text('Female', style: TextStyle(
      color: Colors.black,)),
              value: 'Female',
            ),
            DropdownMenuItem<String>(
              child: Text('Others', style: TextStyle(
      color: Colors.black,)),
              value: 'Others',
            ),
          ],
          onChanged: (String value) {
            setState(() {
              _value = value;
            });
          },
          hint: Text('Select Gender', style: TextStyle(color: Colors.grey[400])),
          value: _value,
        ),
      )
                          ),
                          Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.number,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Weight (KG)",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
                          Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                          ),
	                          child: TextField(
                              style: TextStyle(color: Colors.black),
                              keyboardType: TextInputType.number,
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Height (CM)",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
                        ]
                    )
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      gradient: LinearGradient(
	                        colors: [
	                          Color.fromRGBO(143, 148, 251, 1),
	                          Color.fromRGBO(143, 148, 251, .6),
	                        ]
	                      )
	                    ),
                      child: Center(
                        child: Text("Register") 
                        )
                    )
          ],
        )
      )
          ]
        )
      )
    )
      )
    );
  }
}