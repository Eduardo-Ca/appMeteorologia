

class WeatherModel {
  int id;
  String description;
  WeatherModel({
    required this.id,
    required this.description,
  });


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
