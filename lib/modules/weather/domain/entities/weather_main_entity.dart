// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WeatherMain extends Equatable {
  final double temp;
  final double tempMin;
  final double tempMax;
  final double feelsLike;
  const WeatherMain({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
  });

  
  @override
  List<Object?> get props => throw UnimplementedError();
}
