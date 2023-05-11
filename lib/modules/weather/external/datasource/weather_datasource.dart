import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tempo/modules/core/errors/failures.dart';
import 'package:tempo/modules/core/utils/constants/request_constante.dart';
import 'package:tempo/modules/core/utils/request_util.dart';
import 'package:tempo/modules/weather/data/datasource/weather_datasource.dart';
import 'package:tempo/modules/weather/data/models/weather_principal_model.dart';

RequestUtil _request = RequestUtil();

class WeatherDatasource implements IWeatherDataSource {
  @override
  Future<Either<Failure, WeatherPrincipalModel>> obterClimaPorCidade({lat, lon, units, lang, chaveApi}) async {
      
      Response<dynamic> retorno = await _request.fazRequestNovo(method: Request.GET,endpoint:Endpoints.BUSCAR_CLIMA_POR_CIDADE,
      data: {
        "lat": lat,
        "lon": lon,
        "units": units,
        "lang": lang,
        "appid": chaveApi,
      },
      dataParameters: {
        "lat": lat,
        "lon": lon,
        "units": units,
        "lang": lang,
        "appid": chaveApi,
      },
    );
     WeatherPrincipalModel resultado;
     resultado = WeatherPrincipalModel.fromJson(retorno.data); 
     if (_request.response.statusCode != 200) {

      return Left(ServerFailure(erroCodigo: 'Server Erro: ${_request.response.statusCode}',erroDescricao: _request.response.data['MsgErro']));

    }else{

      return Right(resultado);

    }
  }
}
