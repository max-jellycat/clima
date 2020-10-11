import 'package:flutter/material.dart';
import "package:clima/screens/loading_screen.dart";
import "package:clima/screens/location_screen.dart";
import "package:clima/screens/city_screen.dart";

const LoadingScreenRoute = 'loading';
const LocationScreenRoute = 'location';
const CityScreenRoute = 'city';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoadingScreenRoute:
      return MaterialPageRoute(builder: (context) => LoadingScreen());
    case LocationScreenRoute:
      final LocationScreenArguments args = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => LocationScreen(data: args.data),
      );
    default:
      return MaterialPageRoute(builder: (context) => CityScreen());
  }
}

class LocationScreenArguments {
  final dynamic data;

  LocationScreenArguments(this.data);
}
