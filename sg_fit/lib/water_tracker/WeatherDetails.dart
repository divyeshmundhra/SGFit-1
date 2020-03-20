// import 'dart:async';
// //import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<String> getWeatherDetails() async {
//   final response =
//       await http.get('https://api.data.gov.sg/v1/environment/24-hour-weather-forecast',
//       headers: {
//         "Accept": "application/json"
//       });
    
//   print(response.body);

//   String a = response.body;
//   String b = a.substring(298,300);
//   print("b is $b");

//   return b;
// }


import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<WeatherDetails> getWeatherDetails() async {
  final response =
      await http.get('https://api.data.gov.sg/v1/environment/24-hour-weather-forecast',
      headers: {
        "Accept": "application/json"
      });
    
  print(response.body.toString());
  //Map<String, dynamic> data = jsonDecode(response.body);

  //print("THIS IS ${data["items"][0]["general"]["temperature"]["high"]}");

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
      temp: json["items"][0]["general"]["temperature"]["high"]
    );
  }
}