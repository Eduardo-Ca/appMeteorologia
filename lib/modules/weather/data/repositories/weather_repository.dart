import 'package:dartz/dartz.dart';
import 'package:tempo/modules/core/errors/failures.dart';
import 'package:tempo/modules/weather/data/datasource/weather_datasource.dart';
import 'package:tempo/modules/weather/data/models/weather_principal_model.dart';
import 'package:tempo/modules/weather/domain/repositories/weather_repository.dart';

class WeatherRepository implements IWeatherRepository {

   final IWeatherDataSource dataSource;
   WeatherRepository(this.dataSource);

    @override
    Future<Either<Failure, WeatherPrincipalModel>>obterClimaPorCidade({lat,lon,units,lang,chaveApi})async {
    
    return await dataSource.obterClimaPorCidade(lat:lat,lon:lon,units:units,lang:lang, chaveApi: chaveApi);
  }


}

