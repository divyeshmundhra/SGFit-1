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
import 'package:sgfit/view/appbar.dart';
import 'package:sgfit/controller/input_validator.dart';
import 'package:sgfit/view/text_field.dart';

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
        appBar: ReusableWidgets.getAppBar(
            "Update Details", Colors.blue[600], Colors.grey[50]),
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
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                              child: Container(
                                  child: Center(
                                      child: Text(
                                          "Update the desired fields below",
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
                                            _age,
                                            TextInputType.number,
                                            TextInputAction.done,
                                            "Age"),
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
                                        if (InputValidator.isEmpty(_age.text) &&
                                            InputValidator.isEmpty(
                                                _weight.text) &&
                                            InputValidator.isEmpty(
                                                _height.text)) {
                                          ToastMessage.showErrorToast(
                                              "Any one of the fields should be filled.");
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
                    ]))))));
  }
}
