import '../../Models/weather_model.dart';

class WeatherStates {}

class WeatherIntialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  WeatherModel weatherModel;
  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherStates {}
