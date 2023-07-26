

import 'package:tempo/modules/cidade/domain/entities/cidade_entity.dart';

class CidadeModel extends Cidade {
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
  }) : super(name: '', country: '', state: '', lat: 0.0, lon: 0.0);

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
