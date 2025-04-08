import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/cubits/get_weather_cubit/wather_states.dart';

import '../../Services/get_weather.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(NoWeatherState());

  getWeather(String cityName) async{
    WeatherModel weather = await GetWeather().getCurrentWeather(city: cityName);
    emit(WeatherLoadedState(weather));
  }


}