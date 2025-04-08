import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/wather_states.dart';

import '../Widgets/no_data.dart';
import '../Widgets/weather_data.dart';
import '../cubits/get_weather_cubit/weather_cubit.dart';
import 'Search.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<WeatherCubit,WeatherStates>(
          builder: (context,state){
            if (state is NoWeatherState){
              return const NoData();
            }else if (state is WeatherLoadedState){
              return WeatherData(weather: state.weatherModel);
            } else return const Text("error");
          }
        ),
    );
  }
}


