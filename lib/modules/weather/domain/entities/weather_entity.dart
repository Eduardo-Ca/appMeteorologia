// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int id;
  final String description;
  const Weather({
    required this.id,
    required this.description,
  });

  @override
  List<Object?> get props => throw UnimplementedError();

}
