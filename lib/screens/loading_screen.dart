import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/utils/constants.dart';
import 'package:clima/utils/router.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkService client = NetworkService(
      url:
          "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&units=metric",
    );
    dynamic data = await client.getData();

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
