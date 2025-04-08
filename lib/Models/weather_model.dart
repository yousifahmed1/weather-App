class WeatherModel {
  final String city;
  final double temp;
  final String condition;
  final double windSpeed;
  final int humidity;
  final int chanceOfRain;

  WeatherModel({required this.city, required this.temp, required this.condition, required this.windSpeed, required this.humidity, required this.chanceOfRain});

  factory WeatherModel.fromJson(json){
   return WeatherModel(
      city: json["location"]["name"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      condition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      windSpeed: json["forecast"]["forecastday"][0]["day"]["avgvis_km"],
      humidity: json["forecast"]["forecastday"][0]["day"]["avghumidity"],
      chanceOfRain: json["forecast"]["forecastday"][0]["day"]["daily_chance_of_rain"],
    );
  }
}