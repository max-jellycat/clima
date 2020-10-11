import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const kPrimaryColor = Color(0xFF273C75);
const kAccentColor = Color(0xFFFBC531);
const kBoxColor = Color(0xFF192A56);

const kMenuIconSize = 32.0;
const kWeatherIconSize = 128.0;

const kCityTextStyle = TextStyle(
  fontSize: 48.0,
);

const kTempTextStyle = TextStyle(
  fontSize: 80.0,
  fontWeight: FontWeight.w700,
  color: kAccentColor,
);

const kUnitTextStyle = TextStyle(
  fontSize: 80.0,
  fontWeight: FontWeight.w700,
);

const kMessageTextStyle = TextStyle(
  fontSize: 32.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 32.0,
);
const kTextFieldStyle = TextStyle(
  fontSize: 20.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: kBoxColor,
  icon: Icon(
    CupertinoIcons.building_2_fill,
    color: kAccentColor,
  ),
  hintText: "Enter city name",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide.none,
  ),
);
