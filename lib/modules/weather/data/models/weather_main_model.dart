

class WeatherMainModel{

  double temp;
  double tempMin;
  double tempMax;
  double feelsLike;
  WeatherMainModel({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'temp': temp,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'feels_like': feelsLike,
    };
  }

 factory WeatherMainModel.fromJson(Map<String, dynamic> map) {
    return WeatherMainModel(
      temp: map['temp'] as double,
      tempMin: map['temp_min'] as double,
      tempMax: map['temp_max'] as double,
      feelsLike: map['feels_like'] as double,
    );
  }

  
}
