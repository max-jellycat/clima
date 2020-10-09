import 'package:flutter/material.dart';

import 'package:clima/screens/loading_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Spartan',
      ),
      home: LoadingScreen(),
    );
  }
}
