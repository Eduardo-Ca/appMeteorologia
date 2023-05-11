

class CidadeModel {
  String name;
  String country;
  String state;
  double lat;
  double lon;

  CidadeModel({
    required this.name,
    required this.country,
    required this.state,
    required this.lat,
    required this.lon,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'country': country,
      'state': state,
      'lat': lat,
      'lon': lon,
    };
  }

  factory CidadeModel.fromJson(Map<String, dynamic> map) {
    return CidadeModel(
      name: map['name'] as String,
      country: map['country'] as String,
      state: map['state'] as String,
      lat: map['lat'] as double,
      lon: map['lon'] as double,

    );
  }
}
