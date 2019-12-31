import 'dart:convert';
import 'package:fetch_data_bloc_rxdart/model/weather_response_model.dart';
import 'package:http/http.dart' show Client;


class ApiProvider {
  Client client = Client();
  final _baseUrl ="http://jsonplaceholder.typicode.com/users/";

  Future<List<WeatherResponse>> fetchLondonWeather() async {
    final List<WeatherResponse> allUsers = [];
    final response = await client.get("$_baseUrl");

    List<dynamic> responseData = jsonDecode(response.body);
    print(responseData);

    responseData.forEach((singleUser) {
      allUsers.add(WeatherResponse(
          name: singleUser['name'],
          email:singleUser['email'],
          phone:singleUser['phone'],
      ));
    });
    return allUsers;

   /* if (response.statusCode == 200) {
      return WeatherResponse.fromJson(responseData);
    } else {
      throw Exception('Failed to load weather');
    }*/
  }
}




/*

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' show Client;
import 'package:weather_app/model/weather_response_model.dart';

class ApiProvider {
  Client client = Client();

  final _baseUrl =
      "http://jsonplaceholder.typicode.com/users/";

  Future<WeatherResponse> fetchLondonWeather() async {

    try {
      Response response = await Dio().get("http://jsonplaceholder.typicode.com/users/");
      final jsonresponse = json.decode(response.data);
      print(response);
      return WeatherResponse.fromJson(jsonresponse);

    } catch (e) {
      print(e);
    }

  }
}*/
