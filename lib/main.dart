// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/Views/home_view.dart';

main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({
    super.key,
  });

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          final weatherModel =
              BlocProvider.of<GetWeatherCubit>(context).weatherModel;
          final weatherCondition = weatherModel?.weatherCondition;
          final appBarColor = getThemeColor(weatherCondition);

          final textColor = appBarColor.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white;

          return MaterialApp(
            theme: ThemeData(
              primarySwatch: appBarColor,
              appBarTheme: AppBarTheme(
                backgroundColor: appBarColor,
                titleTextStyle: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              iconTheme: IconThemeData(color: textColor),
            ),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.cyan;
  }
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.orange;
    case "Partly cloudy":
    case "Cloudy":
      return Colors.blueGrey;
    case "Overcast":
      return Colors.blue;
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;
    case "Patchy rain possible":
    case "Light drizzle":
    case "Light rain":
    case "Patchy light rain":
      return Colors.lightBlue;
    case "Moderate rain":
    case "Moderate or heavy rain shower":
    case "Heavy rain":
    case "Torrential rain shower":
      return Colors.blue;
    case "Patchy snow possible":
    case "Light snow":
    case "Patchy light snow":
    case "Moderate snow":
    case "Heavy snow":
      return Colors.indigo;
    case "Thundery outbreaks possible":
    case "Moderate or heavy rain with thunder":
    case "Patchy light rain with thunder":
      return Colors.deepPurple;
    case "Blowing snow":
    case "Blizzard":
      return Colors.blueGrey;
    case "Patchy sleet possible":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Sleet showers":
      return Colors.cyan;
    case "Ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.cyan;
    default:
      return Colors.blueGrey;
  }
}
