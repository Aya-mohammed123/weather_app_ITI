import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/Models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';

  final String apiKey = "984af323bb074aadbc9204419241609";

  WeatherService(
    this.dio,
  );

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey%20&q=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;

      // return weatherModel;
    } on DioException catch (e) {
      final String errorMsg = e.response?.data['error']['message'] ??
          "oops something went wrong,please try later";
      throw Exception(errorMsg);
    } catch (e) {
      log(e.toString());
      throw Exception("oops something went wrong,please try later");
    }
  }
}
