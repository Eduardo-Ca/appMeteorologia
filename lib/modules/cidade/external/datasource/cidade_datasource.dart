import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tempo/modules/cidade/data/datasource/cidade_datasource.dart';
import 'package:tempo/modules/cidade/data/models/cidade_model.dart';
import 'package:tempo/modules/core/errors/failures.dart';
import 'package:tempo/modules/core/utils/constants/request_constante.dart';
import 'package:tempo/modules/core/utils/request_util.dart';

RequestUtil _request = RequestUtil();

class CidadeDatasource implements ICidadeDataSource {
  @override
  Future<Either<Failure ,List<CidadeModel>>> obterCidade({cityname,chaveApi,limit}) async {

      
      Response<dynamic> retorno = await _request.fazRequestNovo(method: Request.GET,endpoint:Endpoints.BUSCAR_CIDADE,
      data: {

        "q": cityname,
        "appid": chaveApi,
        "limit": limit,

      },
      dataParameters: {
        "q": cityname,
        "appid": chaveApi,
        "limit": limit,
      },
    );
     List<CidadeModel> listaCidades = [];
     retorno.data.forEach((i) => listaCidades.add(CidadeModel.fromJson(i)));

     if (_request.response.statusCode != 200) {

      return Left(ServerFailure(erroCodigo: 'Server Erro: ${_request.response.statusCode}',erroDescricao: _request.response.data['MsgErro']));

    }else{

      return Right(listaCidades);

    }
  }
}
