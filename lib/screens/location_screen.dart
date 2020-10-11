import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  String icon;
  String city;
  String message;

  WeatherService weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    this.updateUI(widget.data);
  }

  void updateUI(dynamic data) {
    if (data == null) {
      this.temperature = 0;
      this.icon = "alien";
      this.message = "Unable to get weather";
      this.city = "Error";
      return;
    }
    this.setState(() {
      this.temperature = data["main"]["temp"].toInt();
      this.icon = weatherService.getWeatherIcon(data["weather"][0]["id"]);
      this.city = data["name"];
      this.message = weatherService.getMessage(this.temperature);
    });
  }

  void onLocationIconPressed() async {
    dynamic data = await weatherService.getLocationWeather();
    this.updateUI(data);
  }

  void onCityIconPressed() async {
    dynamic cityName = await Navigator.pushNamed(context, 'city');
    if (cityName != null) {
      dynamic data = await weatherService.getCityWeather(cityName);
      this.updateUI(data);
    }
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
                      onPressed: onLocationIconPressed,
                      child: Icon(
                        CupertinoIcons.location_fill,
                        size: kMenuIconSize,
                        color: kAccentColor,
                      ),
                    ),
                    FlatButton(
                      onPressed: onCityIconPressed,
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
                      SizedBox(height: 48.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            SvgPicture.asset(
                              'images/wi-${this.icon}.svg',
                              color: Colors.white,
                              width: kWeatherIconSize,
                              height: kWeatherIconSize,
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
                      textAlign: TextAlign.center,
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
