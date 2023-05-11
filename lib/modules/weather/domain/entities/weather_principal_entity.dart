// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:tempo/modules/weather/data/models/weather_model.dart';
import 'package:tempo/modules/weather/domain/entities/weather_main_entity.dart';

class WeatherPrincipal extends Equatable {
  final String name;
  final List<WeatherModel> weather;
  final WeatherMain weatherMain;
  const WeatherPrincipal({
    required this.name,
    required this.weather,
    required this.weatherMain,
  });

  

  @override
  List<Object?> get props => throw UnimplementedError();

}
