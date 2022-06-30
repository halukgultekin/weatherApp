import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp/blocs/weather/bloc/weather_bloc.dart';
import 'package:flutter_weatherapp/locator.dart';

import 'widgets/weather_app.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc(),
        child: WeatherApp(),
      ),
    );
  }
}
