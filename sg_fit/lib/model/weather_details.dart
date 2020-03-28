/**
 * This class retreives the current weather information using the Data.Gov.Sg
 *
 * @author Ritik Bhatia, Divyesh Mundhra
 */
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<WeatherDetails> getWeatherDetails() async {
  final response = await http.get(
      'https://api.data.gov.sg/v1/environment/24-hour-weather-forecast',
      headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return WeatherDetails.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to API');
  }
}

class WeatherDetails {
  final int temp;

  WeatherDetails({this.temp});

  factory WeatherDetails.fromJson(Map<String, dynamic> json) {
    return WeatherDetails(
        temp: json["items"][0]["general"]["temperature"]["high"]);
  }
}
