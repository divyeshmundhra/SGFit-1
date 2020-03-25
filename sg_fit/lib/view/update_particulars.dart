/**
 * This class implements the Update Particulars page where the users can update
 * their Age, Weight and Height.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:sgfit/controller/user_data_read_write.dart';
import 'package:sgfit/view/toast_message.dart';
import 'package:sgfit/animation/fade_animation.dart';

class UpdateParticulars extends StatefulWidget {
  State createState() => UpdateParticularsStage();
}

class UpdateParticularsStage extends State<UpdateParticulars> {
  final formKey = GlobalKey<FormState>();
  var _age = TextEditingController();
  // var _gender = new TextEditingController();
  var _height = TextEditingController();
  var _weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Update Details",
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.grey[50],
            brightness: Brightness.light,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.blue[600], //change your color here
            ),
            bottom: PreferredSize(
                child: Container(
                  color: Colors.blue[600],
                  height: 4.0,
                ),
                preferredSize: Size.fromHeight(4.0))),
        backgroundColor: Colors.grey[50],
        body: Container(
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  FadeAnimation(
                    0.5,
                    Icon(
                      Icons.supervised_user_circle,
                      color: Colors.blue[600],
                      size: 200,
                    ),
                  ),
                  FadeAnimation(
                      0.7,
                      Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                          child: Container(
                              child: Center(
                                  child: Text("Update the desired fields below",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.blue[400])))))),
                  FadeAnimation(
                      0.7,
                      Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                255, 255, 255, .5),
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
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
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
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
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
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                  ])),
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(22.0)),
                                  onPressed: () {
                                    print(_age.text);
                                    if (_age.text.isEmpty &&
                                        _weight.text.isEmpty &&
                                        _height.text.isEmpty) {
                                      ToastMessage.showErrorToast(
                                          "Any one of the fields should be filled.");
                                    } else if (int.parse(_age.text) < 12 ||
                                        int.parse(_age.text) > 100) {
                                      ToastMessage.showErrorToast(
                                          "Enter a Valid Age.");
                                    } else if (int.parse(_height.text) < 120 ||
                                        int.parse(_height.text) > 240) {
                                      ToastMessage.showErrorToast(
                                          "Enter a Valid Height.");
                                    } else if (int.parse(_weight.text) < 20 ||
                                        int.parse(_weight.text) > 140) {
                                      ToastMessage.showErrorToast(
                                          "Enter a Valid Weight.");
                                    } else {
                                      writeToFileAge(_age.text);
                                      writeToFileHeight(_height.text);
                                      writeToFileWeight(_weight.text);
                                      ToastMessage.showErrorToast(
                                          "Details saved successfully.");
                                    }
                                  },
                                  color: Colors.blue[600],
                                  child: Center(
                                      child: Text(
                                    "Update",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )))
                            ],
                          )))
                ])))));
  }
}
