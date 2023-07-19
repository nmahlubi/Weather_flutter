import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/weatherProvider.dart';
import 'screens/weeklyWeatherScreen.dart';
import 'screens/homeScreen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        title: 'Weather Assessment',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          WeeklyScreen.routeName: (myCtx) => WeeklyScreen(),
        },
      ),
    );
  }
}
