// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: getWeatherGradient(weatherModel.weatherCondition),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: getWeatherTextColor(weatherModel.weatherCondition),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "updates at: ${weatherModel.date.split(" ")[1]}",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: getWeatherTextColor(weatherModel.weatherCondition),
              ),
              textAlign: TextAlign.center,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.network(
                    "https:${weatherModel.image!}",
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${weatherModel.temp}°C",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color:
                            getWeatherTextColor(weatherModel.weatherCondition)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "Max Temp: ${weatherModel.maxTemp}°C",
                        style: TextStyle(
                          color: getWeatherTextColor(
                              weatherModel.weatherCondition),
                        ),
                      ),
                      Text(
                        "Min Temp: ${weatherModel.minTemp}°C",
                        style: TextStyle(
                          color: getWeatherTextColor(
                              weatherModel.weatherCondition),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              weatherModel.weatherCondition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: getWeatherTextColor(weatherModel.weatherCondition),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

LinearGradient getWeatherGradient(String condition) {
  switch (condition) {
    case "Sunny":
      return const LinearGradient(
        colors: [Colors.yellow, Colors.orange],
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
      );
    case "Partly cloudy":
      return const LinearGradient(
        colors: [Colors.lightBlue, Colors.grey],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case "Cloudy":
      return const LinearGradient(
        colors: [Colors.grey, Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case "Overcast":
      return const LinearGradient(
        colors: [Colors.grey, Colors.black54],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case "Mist":
      return const LinearGradient(
        colors: [Colors.grey, Colors.white70],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    default:
      return const LinearGradient(
        colors: [Colors.blue, Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
  }
}

Color getWeatherTextColor(String condition) {
  switch (condition) {
    case "Sunny":
      return Colors.black87;
    case "Partly cloudy":
      return Colors.black87;
    case "Cloudy":
      return Colors.black87;
    case "Overcast":
      return Colors.white;
    case "Mist":
      return Colors.black87;
    default:
      return Colors.black87;
  }
}
