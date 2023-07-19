import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UvIndex {
  static String mapUviValueToString({required dynamic uvi}) {
    String uvIndex;
    if (uvi <= 2) {
      return uvIndex = 'Low';
    } else if (uvi <= 5) {
      return uvIndex = 'Medium';
    } else if (uvi <= 7) {
      return uvIndex = 'High';
    } else if (uvi <= 10) {
      return uvIndex = 'Very High';
    } else if (uvi >= 11) {
      return uvIndex = 'Extreme';
    } else {
      uvIndex = 'Unknown';
    }
    return uvIndex;
  }
}

class MapString {
  static Widget mapInputToWeather(BuildContext context, String input) {
    String text;
    switch (input) {
      case 'Tornado':
        text = 'Tornado';
        break;
      case 'Thunderstorm':
        text = 'Thunderstorm';
        break;
      case 'Drizzle':
        text = 'Drizzly';
        break;
      case 'Rain':
        text = 'Raining';
        break;
      case 'Snow':
        text = 'Snowing';
        break;
      case 'Mist':
        text = 'Misty';
        break;
      case 'fog':
        text = 'Foggy';
        break;
      case 'Smoke':
        text = 'Smoky';
        break;
      case 'Squall':
        text = 'Squally';
        break;
      case 'Haze':
        text = 'Hazy';
        break;
      case 'Dust':
        text = 'Dusty';
        break;
      case 'Sand':
        text = 'Sandy';
        break;
      case 'Ash':
        text = 'Ashy';
        break;
      case 'Clear':
        text = "Sunny";
        break;
      case 'Clouds':
        text = "Cloudy";
        break;
      default:
        text = "No Info";
    }
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }


  static Widget mapStringToIcon(
      BuildContext context,
      String input,
      double iconSize,
      ) {
    String iconPath;
    switch (input) {
      case 'Thunderstorm':
        iconPath = 'assets/icons/rain@3x.png';
        break;
      case 'Clear Sky':
        iconPath = 'assets/icons/clear.png';
        break;
      case 'Clear':
        iconPath = 'assets/icons/clear@2x.png';
        break;
      case 'Party Sunny':
        iconPath = 'assets/icons/partly-sunny.png';
        break;
      case 'Party Cloudy':
        iconPath = 'assets/icons/partly-sunny@3x.png';
        break;
      case 'Heavy rain':
        iconPath = 'assets/icons/rain@3x.png';
        break;
      case 'Rain':
        iconPath = 'assets/icons/rain@2x.png';
        break;
      default:
        iconPath = 'assets/images/lighthouse.png';
        break;
    }

    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.transparent,
        BlendMode.srcIn,
      ),
      child: Image.asset(
        iconPath,
        width: 100.0,
        height: 50.0,
    ));

  }

}


