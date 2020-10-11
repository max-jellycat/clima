import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkService {
  String url;

  NetworkService({this.url});

  Future<dynamic> getData() async {
    try {
      String apiUrl = DotEnv().env['API_URL'];
      String apiKey = DotEnv().env['API_KEY'];
      Response res = await get("$apiUrl${this.url}&appid=$apiKey");

      if (res.statusCode == 200) {
        dynamic data = jsonDecode(res.body);
        return data;
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void setUrl(String url) {
    this.url = url;
  }
}
