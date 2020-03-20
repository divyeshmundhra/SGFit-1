/**
 * This class implements the GovtAPI class with
 * the attributes jsonData
 *
 * @author Kumar Vembu Swathi
 */

import 'package:http/http.dart' as http;
//import 'dart:convert' show json;
import 'dart:async';

class WeatherApp
{
  Future<String> getData() async
  {
    var response = await http.get
      (
        Uri.encodeFull("https://api.data.gov.sg/v1/environment/24-hour-weatherforecast"),
        headers:
        {
          "Accept": "application/json"
        }
    );

    return response.body;
  }
}
