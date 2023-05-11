

import 'package:tempo/modules/weather/data/models/weather_principal_model.dart';

abstract class IUsecasesWeather {
   
  Future<WeatherPrincipalModel>obterClimaPorCidade({lat,lon,units,lang,chaveApi});

}
