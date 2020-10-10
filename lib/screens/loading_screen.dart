import 'package:flutter/material.dart';
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
    double latitude = location.latitude;
    double longitude = location.longitude;

    NetworkService client = NetworkService(
      url:
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude",
    );
    dynamic data = await client.getData();

    print(data);
  }

  @override
  void initState() {
    super.initState();
    this.getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
    );
  }
}
