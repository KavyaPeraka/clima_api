import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  //const WeatherTile({Key? key}) : super(key: key);
  WeatherTile(
      {required this.icon, required this.title, required this.subTitle});

  IconData icon;
  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon, color: Colors.purpleAccent)],
      ),
      title: Text(
       title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
      ),
    );
  }
}
