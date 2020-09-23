import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'dart:convert';
import 'location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationWeather() {
    double latitude;
    double longitude;
    var apiKey = 'bc24884b79beb3571eb94b5ea201096c';

    void getLocation() async {
      Location location = Location();
      await location.getCurrentLocation();
      latitude = location.latitude;
      longitude = location.longitude;
      getData();
      print('https://api.openweathermap.org/data/2'
          '.5/weather?lat=$latitude&lon=$longitude&appid'
          '=$apiKey&unit=metric');
    }
  }

  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
