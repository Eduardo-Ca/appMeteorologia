import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:tempo/modules/weather/data/models/weather_principal_model.dart';
import 'package:tempo/modules/weather/domain/usecases/weather_usecases.dart';

//flutter pub run build_runner build
//flutter pub run build_runner build --delete-conflicting-outputs
part 'weather_store.g.dart';

// ignore: library_private_types_in_public_api
class WeatherStore = _WeatherStore with _$WeatherStore;

abstract class _WeatherStore with Store {

  
  late UsecasesWeather _useCasesWeather;

  _WeatherStore() {
    _useCasesWeather = GetIt.I.get<UsecasesWeather>();
    autorun(
      (_) {},
    );
  }

   @observable
   double longitude =0;

  @observable
   double latitude =0;

  @observable
  WeatherPrincipalModel? clima ;

  @observable
  String errorMessage = '';

  @action
  Future<void> obterClima({lat,lon,units,lang,chaveApi}) async{
    try {
      clima = await _useCasesWeather.obterClimaPorCidade(lat:lat,lon:lon,units:units,lang: lang,chaveApi: chaveApi); 
    } catch (e) {
      errorMessage = e.toString();
    }
   
  }

   pegarPosicao() async {
    bool aceito;
    LocationPermission permissao;

    aceito = await Geolocator.isLocationServiceEnabled();
    if (!aceito) {
      return Future.error('localização está desligada');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Permissão de localização foi negada');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Permissão de localização foi negada permanentemente.');
    }
    
    Position posicao = await Geolocator.getCurrentPosition();
  
    longitude = posicao.longitude;
    latitude = posicao.latitude;

 
  }
  
}
