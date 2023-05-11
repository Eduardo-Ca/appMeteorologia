import 'package:tempo/modules/weather/data/models/weather_main_model.dart';
import 'package:tempo/modules/weather/data/models/weather_model.dart';

class WeatherPrincipalModel{
  String name;
  List<WeatherModel> weather;
  WeatherMainModel weatherMain;
  WeatherPrincipalModel({
    required this.name,
    required this.weather,
    required this.weatherMain,
  });

  
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'weather': weather.map((x) => x.toJson()).toList(),
      'main': weatherMain.toJson(),
    };
  }

  factory WeatherPrincipalModel.fromJson(Map<String, dynamic> map) {
    return WeatherPrincipalModel(
      name: map['name'] as String,
      weather: List<WeatherModel>.from((map['weather'] ).map<WeatherModel>((x) => WeatherModel.fromJson(x as Map<String,dynamic>),),),
      weatherMain: WeatherMainModel.fromJson(map['main'] as Map<String,dynamic>),
    );
  }


}
