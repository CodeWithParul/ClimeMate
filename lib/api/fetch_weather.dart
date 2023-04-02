import 'dart:convert';

import 'package:my_weather_app/api/api_key.dart';
import 'package:my_weather_app/model/weather/current.dart';
import 'package:my_weather_app/model/weather/daily.dart';
import 'package:my_weather_app/model/weather/hourly.dart';
import 'package:my_weather_app/model/weather/weather.dart';
import 'package:http/http.dart' as http;

class FetchWeatherApi {
  WeatherData? weatherData;
  // processing the data from response to Json
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));
    return weatherData!;
  }
}

String apiURL(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$apiKey&units=metric";
  return url;
}
