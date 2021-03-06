import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherService {
  NetworkService client = NetworkService();

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    client.setUrl(
        "/weather?lat=${location.latitude}&lon=${location.longitude}&units=metric");
    dynamic data = await client.getData();

    return data;
  }

  Future<dynamic> getCityWeather(String city) async {
    client.setUrl("/weather?q=$city&units=metric");
    dynamic data = await client.getData();

    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'thunderstorm';
    } else if (condition < 400) {
      return 'sleet';
    } else if (condition < 600) {
      return 'rain';
    } else if (condition < 700) {
      return 'snow-wind';
    } else if (condition < 800) {
      return 'fog';
    } else if (condition == 800) {
      return 'day-sunny';
    } else if (condition <= 804) {
      return 'day-cloudy';
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
