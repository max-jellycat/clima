import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utils/constants.dart';
import 'package:clima/widgets/action_button.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String city;

  void handleChange(value) {
    setState(() {
      this.city = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: kMenuIconSize,
                    color: kAccentColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  style: kTextFieldStyle,
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) => this.handleChange(value),
                ),
              ),
              ActionButton(
                  text: 'Get weather',
                  backgroundColor: kAccentColor,
                  onPressed: () {
                    Navigator.pop(context, this.city);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
