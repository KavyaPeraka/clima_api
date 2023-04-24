import 'package:flutter/material.dart';
import 'widgets/widget_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'widgets/main_widget.dart';


Future<WeatherInfo> fetchWeather() async {
  final zipCode = "523187";
  final apiKey = "0647ad6b415f728553f00e5b33a59a98";
  final requestUrl =
      "https://api.openweathermap.org/data/2.5/weather?zip=${zipCode},IN&units=imperial&appid=${apiKey}";

  final response = await http.get(Uri.parse(requestUrl));

  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else
    throw Exception("Error loading reqest URL info");
}

class WeatherInfo {
  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weather;
  final int humidity;
  final double windSpeed;

  WeatherInfo(
      {required this.location,
      required this.temp,
      required this.tempMax,
      required this.tempMin,
      required this.humidity,
      required this.weather,
      required this.windSpeed});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
        location: json['name'],
        temp: json['main']['temp'],
        tempMax: json['main']['temp_max'],
        tempMin: json['main']['temp_min'],
        humidity: json['main']['humidity'],
        weather: json['weather'][0]['description'],
        windSpeed: json['wind']['speed']);
  }
}

void main() {
  runApp(MaterialApp(
    title: 'weather app',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   late Future<WeatherInfo> futureWeather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureWeather =  fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherInfo>(
        future: futureWeather,
        builder: (context, snapshot ) {
          if(snapshot.hasData){
              return MainWidget(
                location: snapshot.data!.location,
                temp: snapshot.data!.temp,
                tempMax: snapshot.data!.tempMax,
                tempMin: snapshot.data!.tempMin,
                humidity: snapshot.data!.humidity,
                weather: snapshot.data!.weather,
                windSpeed: snapshot.data!.windSpeed,

              );
          } else if(snapshot.hasError){
              return Center(
                child: Text("${snapshot.error}"),
              );
          }
          return CircularProgressIndicator();

        }

      )
    );
  }
}
