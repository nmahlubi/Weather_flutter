import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter/provider/weatherProvider.dart';

import '../helper/utils.dart';

class SevenDayForecast extends StatelessWidget {
  Widget dailyWidget(dynamic weather, BuildContext context) {
    final dayOfWeek = DateFormat('EEE').format(weather.date);
    return Container(
      color:Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              dayOfWeek,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 20),
            child:
                MapString.mapStringToIcon(context, '${weather.condition}', 35),
          ),
          Text(
            '${weather.condition}',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20.0),
          child: Text(
            'Next 7 Days',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            child: ListView(
              padding: const EdgeInsets.all(25.0),
              shrinkWrap: true,
              children: [
                SizedBox(height: 15),
                Consumer<WeatherProvider>(builder: (context, weatherProv, _) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: weatherProv.sevenDayWeather
                          .map((item) => dailyWidget(item, context))
                          .toList(),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
