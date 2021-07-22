import 'dart:async';

import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:timehub/globals.dart' as globals;
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/rss_feed.dart';

final DateFormat formatter = DateFormat('d MMMM');
final DateFormat formatterTime = DateFormat('HH:mm');
var forecastIcon;

void getWeather() async {
  Weather weather = await globals.weatherFactory
      .currentWeatherByCityName(globals.weatherLocation);
  globals.weather = weather;
  globals.currentWeather = weather.weatherDescription;
  globals.currentWeatherId = weather.weatherConditionCode;
  globals.currentWeatherTemp = weather.temperature;
  globals.currentWeatherTempFeel = weather.tempFeelsLike;
  globals.weatherIcon = getWeatherIcon(weather.weatherIcon, Colors.black);
  globals.forecast = await globals.weatherFactory
      .fiveDayForecastByCityName(globals.weatherLocation);
  print(globals.weatherLocation);
}

getWeatherIcon(requestedIcon, reqColor) {
  //set icon
  if (requestedIcon.toString() == '01d') {
    globals.currentWeatherId = Icon(Ionicons.sunny_outline);
  } else if (requestedIcon.toString() == '02d') {
    return Icon(
      Ionicons.partly_sunny_outline,
      size: 50,
      color: reqColor,
    );
  } else if (requestedIcon == '03d') {
    return Icon(
      Ionicons.cloud_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '04d') {
    return Icon(
      Ionicons.cloud_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '09d') {
    return Icon(
      Ionicons.rainy_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '10d') {
    return Icon(
      Ionicons.rainy_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '11d') {
    return Icon(
      Ionicons.thunderstorm_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '13d') {
    return Icon(
      Ionicons.snow_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '50d') {
    return Icon(
      Ionicons.cloud_outline,
      size: 50,
      color: reqColor,
    );
  } else if (requestedIcon == '01n') {
    return Icon(
      Ionicons.sunny_outline,
      size: 50,
      color: reqColor,
    );
  } else if (requestedIcon == '02n') {
    return Icon(
      Ionicons.cloud_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '03n') {
    return Icon(
      Ionicons.cloud_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '04n') {
    return Icon(
      Ionicons.cloud_outline,
      size: 50,
      color: reqColor,
    );
  } else if (requestedIcon == '09n') {
    return Icon(
      Ionicons.rainy_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '10n') {
    return Icon(
      Ionicons.rainy_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '11n') {
    return Icon(
      Ionicons.thunderstorm_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '13n') {
    return Icon(
      Ionicons.snow_outline,
      color: reqColor,
      size: 50,
    );
  } else if (requestedIcon == '50d') {
    return Icon(
      Ionicons.cloud_outline,
      color: reqColor,
      size: 50,
    );
  } else {
    return Icon(Ionicons.eye_off);
  }
}

class Feed1 {
  final _targetUrl = Uri.parse('https://www.becompany.ch/en/blog/feed.xml');
}

final targetUrl = Uri.parse('https://www.becompany.ch/en/blog/feed.xml');

void getFeedRss() async {
  /*final AtomFeed feed = await Feed1().getFeed();*/
  print(await http.read(targetUrl));
}
