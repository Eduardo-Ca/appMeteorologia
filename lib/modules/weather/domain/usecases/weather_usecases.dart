import 'package:tempo/modules/core/utils/tratar_either.dart';
import 'package:tempo/modules/weather/data/models/weather_principal_model.dart';
import 'package:tempo/modules/weather/domain/repositories/weather_repository.dart';
import 'package:tempo/modules/weather/domain/usecases/interface/interface_weather_usecases.dart';

class UsecasesWeather extends IUsecasesWeather{
  
  final IWeatherRepository repositoryRemoto;

  UsecasesWeather(this.repositoryRemoto);

  @override
  Future<WeatherPrincipalModel> obterClimaPorCidade({lat,lon,units,lang,chaveApi})async {
    
    final result = await repositoryRemoto.obterClimaPorCidade(lat:lat,lon:lon,units:units,lang:lang, chaveApi: chaveApi);
    if (result.isRight()) {
        return extrairInfoRight(result);
      }

      throw Exception(extrairInfoLeft(result));
  }

}
