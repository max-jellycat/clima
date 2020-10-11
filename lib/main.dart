import 'package:flutter/material.dart';
import 'package:clima/utils/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Spartan',
      ),
      initialRoute: LoadingScreenRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
