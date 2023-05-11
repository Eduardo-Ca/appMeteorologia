

import 'package:dartz/dartz.dart';
import 'package:tempo/modules/core/errors/failures.dart';
import 'package:tempo/modules/weather/data/models/weather_principal_model.dart';

abstract class IWeatherDataSource{
 Future<Either<Failure, WeatherPrincipalModel>>obterClimaPorCidade({lat,lon,units,lang,chaveApi}); 
}
