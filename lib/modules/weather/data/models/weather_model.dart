

import 'package:tempo/modules/weather/domain/entities/weather_entity.dart';

class WeatherModel extends Weather{
  int id;
  String description;
  WeatherModel({
    required this.id,
    required this.description,
  }) : super(id: 0, description: '');


   Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'description': description,
    };
  }

  factory WeatherModel.fromJson(Map<String, dynamic> map) {
      return WeatherModel(
      id: map['id'] as int,
      description: map['description'] as String,
    );
  }


}
