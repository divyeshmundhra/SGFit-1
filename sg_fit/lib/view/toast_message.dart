import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastMessage {
  static void showErrorToast(String errormsg) {
    Fluttertoast.showToast(
        msg: errormsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue[600],
        textColor: Colors.white);
  }
}
