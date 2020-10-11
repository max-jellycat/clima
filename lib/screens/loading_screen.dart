import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/utils/constants.dart';
import 'package:clima/utils/router.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    dynamic data = await WeatherService().getLocationWeather();

    Navigator.pushNamed(
      context,
      LocationScreenRoute,
      arguments: LocationScreenArguments(data),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: kAccentColor,
          size: 100.0,
        ),
      ),
    );
  }
}
