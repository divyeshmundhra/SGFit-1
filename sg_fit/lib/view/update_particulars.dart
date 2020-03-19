/**
 * This class implements the Update Particulars page where the users can update
 * their Age, Weight and Height.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:sgfit/controller/user_data_read_write.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sgfit/view/home_screen.dart';

class UpdateParticulars extends StatefulWidget {
  State createState() => UpdateParticularsStage();
}

class UpdateParticularsStage extends State<UpdateParticulars> {
  String _value;
  final formKey = GlobalKey<FormState>();
  var _age = TextEditingController();
  // var _gender = new TextEditingController();
  var _height = TextEditingController();
  var _weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[900],
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        backgroundColor: Colors.cyan[900],
        body: Container(
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  Container(
                      height: 220,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/reg_page_logo.png'))),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              child: Container(
                                  margin: EdgeInsets.only(top: 170),
                                  child: Center(
                                      child: Text("Update Details",
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold))))),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                      child: Container(
                          child: Center(
                              child: Text("Update the desired fields below",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal))))),
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
                                        color:
                                            Color.fromRGBO(255, 255, 255, .5),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    controller: _age,
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Age",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    controller: _weight,
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Weight (KG)",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    controller: _height,
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Height (CM)",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                              ])),
                          SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                              height: 50,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22.0)),
                              onPressed: () {
                                print(_age.text);
                                if (_age.text.isEmpty &&
                                    _weight.text.isEmpty &&
                                    _height.text.isEmpty) {
                                  _showErrorToast(
                                      "Any one of the fields should be filled.");
                                } else if (int.parse(_age.text) < 12 ||
                                    int.parse(_age.text) > 100) {
                                  _showErrorToast("Enter a Valid Age.");
                                } else if (int.parse(_height.text) < 120 ||
                                    int.parse(_height.text) > 240) {
                                  _showErrorToast("Enter a Valid Height.");
                                } else if (int.parse(_weight.text) < 20 ||
                                    int.parse(_weight.text) > 140) {
                                  _showErrorToast("Enter a Valid Weight.");
                                } else {
                                  writeToFileAge(_age.text);
                                  writeToFileHeight(_height.text);
                                  writeToFileWeight(_weight.text);
                                  _showErrorToast(
                                      "Detailed saved successfully.");
                                }
                              },
                              color: Colors.cyan[300],
                              child: Center(child: Text("Update")))
                        ],
                      ))
                ])))));
  }
}

void _showErrorToast(String errormsg) {
  Fluttertoast.showToast(
      msg: errormsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      textColor: Colors.black);
}
