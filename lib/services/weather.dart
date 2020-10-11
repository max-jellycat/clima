import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  IconData getWeatherIcon(int condition) {
    if (condition < 300) {
      return CupertinoIcons.cloud_bolt;
    } else if (condition < 400) {
      return CupertinoIcons.cloud_drizzle;
    } else if (condition < 600) {
      return CupertinoIcons.cloud_heavyrain;
    } else if (condition < 700) {
      return CupertinoIcons.cloud_snow;
    } else if (condition < 800) {
      return CupertinoIcons.cloud_fog;
    } else if (condition == 800) {
      return CupertinoIcons.sun_max;
    } else if (condition <= 804) {
      return CupertinoIcons.cloud_sun;
    }

    return null;
  }

  String getMessage(int temp) {
    if (temp > 35) {
      return "Please drink a lot of 🚰!";
    } else if (temp > 30) {
      return "Did you bring your 👙?";
    } else if (temp > 25) {
      return "It's 🍦 time!";
    } else if (temp > 20) {
      return "Time for 👕 and 🩳.";
    } else if (temp < 10) {
      return "You'll need 🧣 and 🧤.";
    } else {
      return "Bring a 🧥 just in case.";
    }
  }
}
