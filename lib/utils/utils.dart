import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    duration: Duration(seconds: 3),
  ));
}

navigateTo(Widget screenName, BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => screenName),
  );
}
