import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter/provider/weatherProvider.dart';

class RequestError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text(
            'No location found',
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
            child: Text(
              "Please make sure that you enable location in your device  or check your device internet connection",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            child: Text('Please return home'),
            onPressed: () =>
                Provider.of<WeatherProvider>(context, listen: false)
                    .getWeatherData(isRefresh: true),
          ),
        ],
      ),
    );
  }
}
