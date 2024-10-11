import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

void successTextHandler(String text, BuildContext context) {
  QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: text,
      backgroundColor: Colors.white,
      confirmBtnColor: Colors.blue,
      titleColor: Colors.black,
      width: MediaQuery.of(context).size.width / 20,
      confirmBtnText: 'OK',
      textColor: Colors.black);
}
