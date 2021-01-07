import 'package:flutter/material.dart';

class TextUtils extends Text {
  TextUtils(String text, {color: Colors.white, textScaleFactor: 1.2})
      : super(text,
            textScaleFactor: textScaleFactor,
            style: new TextStyle(color: color),
            textAlign: TextAlign.center);
}
