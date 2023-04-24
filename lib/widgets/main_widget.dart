import 'package:clima_api/widgets/widget_tile.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  //const MainWidget({Key? key}) : super(key: key);

  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weather;
  final int humidity;
  final double windSpeed;

  MainWidget(
      {required this.location,
      required this.tempMin,
      required this.tempMax,
      required this.temp,
      required this.windSpeed,
      required this.weather,
      required this.humidity});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          color: Colors.orangeAccent,
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${location.toString()}',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Text(
                  '${temp.toInt().toString()}\u2103',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Text('high of ${tempMax.toInt().toString()}\u2103, low of ${tempMin.toInt().toString()}\u2103',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15.0,
                      color: Colors.yellowAccent)),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: [
                WeatherTile(
                    icon: Icons.thermostat_outlined,
                    title: "Temperature",
                    subTitle: "${temp.toInt().toString()}\u2103"),
                WeatherTile(
                    icon: Icons.filter_drama_outlined,
                    title: "weather",
                    subTitle: "${weather.toString()}"),
                WeatherTile(
                    icon: Icons.wb_sunny, title: "Humidity", subTitle: "${humidity.toString()}%"),
                WeatherTile(
                    icon: Icons.waves_outlined,
                    title: "Wind Speed",
                    subTitle: "${windSpeed.toInt().toString()}MPH"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
