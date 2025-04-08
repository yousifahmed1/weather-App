import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Services/get_weather.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text("Search For a City",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            color: Colors.black,

          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            TextField(
              onSubmitted: (value)
              {
                var getWeatherCubit = BlocProvider.of<WeatherCubit>(context);
                getWeatherCubit.getWeather(value);
                Navigator.pop(context);
              },
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Search For City",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xffA1A1A1),

                ),
                enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color:Color(0xffEFF0F2),
                        width: 4.0
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:const BorderSide(
                        color:Color(0xffEFF0F2),
                        width: 4.0
                    ), // Border color when focused
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color:Color(0xffEFF0F2),
                    ), // Border color when not focused
                    borderRadius: BorderRadius.circular(20)
                ),
                  prefixIcon: const Icon(Icons.search,
                color: Colors.black,
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
