// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';


class Cidade extends Equatable {
  final String name;
  final String country;
  final String state;
  final double lat;
  final double lon;
  const Cidade({
    required this.name,
    required this.country,
    required this.state,
    required this.lat,
    required this.lon,
  });

  @override
  List<Object?> get props => throw UnimplementedError();

}
