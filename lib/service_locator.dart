
import 'package:get_it/get_it.dart';
import 'package:tempo/modules/cidade/data/repositories/cidade_repository.dart';
import 'package:tempo/modules/cidade/domain/usecases/cidade_usecases.dart';
import 'package:tempo/modules/cidade/external/datasource/cidade_datasource.dart';
import 'package:tempo/modules/weather/data/repositories/weather_repository.dart';
import 'package:tempo/modules/weather/domain/usecases/weather_usecases.dart';
import 'package:tempo/modules/weather/external/datasource/weather_datasource.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  //=========================================== Weather ======================================================================
  getIt.registerLazySingleton<WeatherDatasource>(() => WeatherDatasource());
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepository(GetIt.I.get<WeatherDatasource>()));
  getIt.registerLazySingleton<UsecasesWeather>(() => UsecasesWeather(GetIt.I.get<WeatherRepository>()));
  //=========================================== Weather =====================================================================

   //=========================================== Cidade ======================================================================
  getIt.registerLazySingleton<CidadeDatasource>(() => CidadeDatasource());
  getIt.registerLazySingleton<CidadeRepository>(() => CidadeRepository(GetIt.I.get<CidadeDatasource>()));
  getIt.registerLazySingleton<UsecasesCidade>(() => UsecasesCidade(GetIt.I.get<CidadeRepository>()));
  //=========================================== Cidade =====================================================================

}
