import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Views/Search.dart';


class WeatherData extends StatelessWidget {
  const WeatherData({
    super.key, required this.weather,
  });

  String getWeatherIcon(String day) {
    switch (day.toLowerCase().replaceAll(" ", "")) {
      case "sunny":
      case "clear":
        return "assets/sunny.png";

      case "partlycloudy":
        return "assets/Cloudy&Sunny.png";

      case "cloudy":
      case "overcast":
        return "assets/Cloudy.png";

      case "patchysnowpossible":
      case "blowingsnow":
      case "blizzard":
      case "patchylightsnow":
      case "lightsnow":
      case "moderatesnow":
      case "heavysnow":
      case "snow":
      case "patchyheavysnow":
      case "moderateorheavysnowshowers":
      case "lightsnowshowers":
        return "assets/Clouds&Snow.png";

      case "thunderyoutbreakspossible":
      case "patchylightrainwiththunder":
      case "moderateorheavyrainwiththunder":
      case "patchylightsnowwiththunder":
      case "moderateorheavysnowwiththunder":
        return "assets/Lightening.png";

      default:
        return "assets/sunny.png"; // fallback icon
    }
  }

  List<Color> getWeatherColor(String day) {
    switch (day.toLowerCase().replaceAll(" ", "")) {
      case "sunny":
      case "clear":
      return [
        Color(0xFF90CAF9),
        Color(0xFF42A5F5),
      ];

      case "partlycloudy":
        return [
          Color(0xFFCFEBF9),
          Color(0xFF4D95B4),
        ];

      case "cloudy":
      case "overcast":
        return [
          Color(0xFFB0BEC5),
          Color(0xFF78909C),
        ];

      case "patchysnowpossible":
      case "blowingsnow":
      case "blizzard":
      case "patchylightsnow":
      case "lightsnow":
      case "moderatesnow":
      case "heavysnow":
      case "snow":
      case "patchyheavysnow":
      case "moderateorheavysnowshowers":
      case "lightsnowshowers":
      return [
        Color(0xFF90A4AE), // medium blue-grey (cool + moody)
        Color(0xFF607D8B), // darker blue-grey (nice text contrast)
      ];

      case "thunderyoutbreakspossible":
      case "patchylightrainwiththunder":
      case "moderateorheavyrainwiththunder":
      case "patchylightsnowwiththunder":
      case "moderateorheavysnowwiththunder":
        return [
          Color(0xFF9575CD),
          Color(0xFF512DA8),
        ];

      default:
        return [
          Colors.grey.shade400,
          Colors.grey.shade800,
        ];
    }
  }


  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin:Alignment.topRight ,
                end: Alignment.bottomCenter,
              colors: getWeatherColor(weather.condition),
            )
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: IconButton(onPressed: () {
                    Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
                  },
                      icon: const Icon(Icons.search,
                        size: 40,
                        color: Colors.white,
                      )),
                )
              ],
            ),

            const SizedBox(height: 20),

            Text(weather.city,
              textAlign: TextAlign.center,
              style:const TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),

            Image.asset(
              getWeatherIcon(weather.condition),
              height: 300,
              width: 300,
            ),

            Text(
              "${weather.temp.round()}°",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 90,
              ),
            ),

            Text(
              weather.condition,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                color: Colors.white.withOpacity(0.3)
                ,
                width: double.infinity,
                height: 1,
              ),
            ),

            const SizedBox(height: 40),

            Padding(
               padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
               child: Center(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                       children: [
                         Image.network(
                             "https://static-00.iconduck.com/assets.00/wind-icon-2048x1570-qr102xee.png",
                         height: 40,
                           width: 40,
                           color: Colors.white,
                         ),
                         const SizedBox(height: 10,),
                         Text(
                          weather.windSpeed.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                    ),
                         const SizedBox(height: 10,),

                         Text(
                          "Wind",
                          style: TextStyle(color: Colors.white.withOpacity(0.4),
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                    ),
                       ],
                     ),
                    const Spacer(),
                    Column(
                      children: [
                        Image.network(
                          "https://www.iconpacks.net/icons/2/free-water-icon-1542-thumb.png",
                          height:45,
                          width: 45,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10,),

                        Text(
                          weather.humidity.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 10,),

                        Text(
                          "Humidity",
                          style: TextStyle(color: Colors.white.withOpacity(0.4),
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),

                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Image.network(
                          "https://cdn-icons-png.freepik.com/512/7038/7038403.png",
                          height:45,
                          width: 45,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10,),

                        Text(
                          weather.chanceOfRain.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 10,),

                        Text(
                          "Chance\nof rain",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white.withOpacity(0.4),
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),

                      ],
                    ),


                  ],
            ),
               ),
             )

          ],
        ),
      ),
    );
  }
}
