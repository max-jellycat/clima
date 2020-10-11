import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utils/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/widgets/box.dart';

class LocationScreen extends StatefulWidget {
  final dynamic data;

  LocationScreen({this.data});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  IconData icon;
  String city;
  String message;

  @override
  void initState() {
    super.initState();
    WeatherModel weatherModel = WeatherModel();
    this.temperature = widget.data["main"]["temp"].toInt();
    this.icon = weatherModel.getWeatherIcon(widget.data["weather"][0]["id"]);
    this.city = widget.data["name"];
    this.message = weatherModel.getMessage(this.temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Icon(
                        CupertinoIcons.location_fill,
                        size: kMenuIconSize,
                        color: kAccentColor,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Icon(
                        CupertinoIcons.building_2_fill,
                        size: kMenuIconSize,
                        color: kAccentColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Box(
                  color: kBoxColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          this.city,
                          textAlign: TextAlign.center,
                          style: kCityTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "${this.temperature}",
                                  style: kTempTextStyle,
                                ),
                                Text(
                                  "°",
                                  style: kUnitTextStyle,
                                ),
                              ],
                            ),
                            Icon(
                              this.icon,
                              size: 120.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: Text(
                      this.message,
                      style: kMessageTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
