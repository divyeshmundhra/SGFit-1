/**
 * This class implements the one-time registration of the user when they launch
 * the application for the first time and input details which include Height,
 * Weight and Age.
 *
 * @author Jay Gupta
 */
import 'package:flutter/material.dart';
import 'package:sgfit/controller/user_data_read_write.dart';
import 'package:sgfit/view/home_screen.dart';
import 'package:sgfit/view/toast_message.dart';
import 'package:sgfit/view/appbar.dart';
import 'package:sgfit/animation/fade_animation.dart';
import 'package:sgfit/controller/input_validator.dart';
import 'package:sgfit/view/text_field.dart';

class DisplayForm extends StatefulWidget {
  State createState() => RegistrationPageState();
}

class RegistrationPageState extends State<DisplayForm> {
  String _value;
  final formKey = GlobalKey<FormState>();
  var _name = new TextEditingController();
  var _age = new TextEditingController();
  var _height = new TextEditingController();
  var _weight = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBar(
            "Register", Colors.blue[600], Colors.grey[50]),
        backgroundColor: Colors.grey[50],
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          0.2,
                          Container(
                            height: 220,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/logo_full.png'))),
                          )),
                      FadeAnimation(
                          0.5,
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                              child: Container(
                                  child: Center(
                                      child: Text(
                                          "To get started, we'll need to know some details!",
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, .5),
                                                blurRadius: 20.0,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: Column(children: <Widget>[
                                        TextFields.getTextField(
                                            _name,
                                            TextInputType.text,
                                            TextInputAction.done,
                                            "Name"),
                                        TextFields.getTextField(
                                            _age,
                                            TextInputType.number,
                                            TextInputAction.done,
                                            "Age"),
                                        Container(
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey[100])),
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: DropdownButton<String>(
                                                items: [
                                                  DropdownMenuItem<String>(
                                                    child: Text('Male',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        )),
                                                    value: 'Male',
                                                  ),
                                                  DropdownMenuItem<String>(
                                                    child: Text('Female',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        )),
                                                    value: 'Female',
                                                  ),
                                                  DropdownMenuItem<String>(
                                                    child: Text('Others',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        )),
                                                    value: 'Others',
                                                  ),
                                                ],
                                                onChanged: (String value) {
                                                  setState(() {
                                                    _value = value;
                                                  });
                                                },
                                                hint: Text('Select Gender',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[400])),
                                                value: _value,
                                              ),
                                            )),
                                        TextFields.getTextField(
                                            _weight,
                                            TextInputType.number,
                                            TextInputAction.done,
                                            "Weight (KG)"),
                                        TextFields.getTextField(
                                            _height,
                                            TextInputType.number,
                                            TextInputAction.done,
                                            "Height (CM)"),
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
                                        if (InputValidator.isEmpty(_age.text) ||
                                            InputValidator.isEmpty(
                                                _weight.text) ||
                                            InputValidator.isEmpty(
                                                _name.text) ||
                                            InputValidator.isEmpty(
                                                _height.text)) {
                                          ToastMessage.showErrorToast(
                                              "All fields must be filled.");
                                        } else if (!InputValidator.validateName(
                                            _name.text)) {
                                          ToastMessage.showErrorToast(
                                              "Name should be less than 15 characters.");
                                        } else if (!InputValidator.validateAge(
                                            int.parse(_age.text))) {
                                          ToastMessage.showErrorToast(
                                              "Enter a Valid Age.");
                                        } else if (!InputValidator
                                            .validateHeight(
                                                int.parse(_height.text))) {
                                          ToastMessage.showErrorToast(
                                              "Enter a Valid Height.");
                                        } else if (!InputValidator
                                            .validateWeight(
                                                int.parse(_weight.text))) {
                                          ToastMessage.showErrorToast(
                                              "Enter a Valid Weight.");
                                        } else {
                                          writeToFileAge(_age.text);
                                          writeToFileHeight(_height.text);
                                          writeToFileWeight(_weight.text);
                                          writeToFileisRegistered("1");
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()),
                                          );
                                        }
                                      },
                                      color: Colors.blue[600],
                                      child: Center(
                                          child: Text("Register",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20))))
                                ],
                              )))
                    ]))))));
  }
}
