import 'package:dio/dio.dart';
import 'package:weather_app/Models/weather_model.dart';


class GetWeather {

  final dio = Dio();

  Future<WeatherModel> getCurrentWeather({required String city}) async {

    final response = await dio.get('http://api.weatherapi.com/v1/forecast.json?key=c5d7ac074e29471580f12636250704&q=$city&days=1');

    Map<String,dynamic> jsonData = response.data;

    WeatherModel weather = WeatherModel.fromJson(jsonData);


    return weather;
  }

}