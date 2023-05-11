import 'package:tempo/modules/cidade/data/models/cidade_model.dart';
import 'package:tempo/modules/cidade/domain/repositories/cidade_repository.dart';
import 'package:tempo/modules/cidade/domain/usecases/interface/interface_cidade_usecases.dart';
import 'package:tempo/modules/core/utils/tratar_either.dart';

class UsecasesCidade extends IUsecasesCidade{
  
  final ICidadeRepository repositoryRemoto;

  UsecasesCidade(this.repositoryRemoto);

  @override
   Future<List<CidadeModel>> obterCidade({cityname,chaveApi,limit})async {
    
    final result = await repositoryRemoto.obterCidade(cityname:cityname,chaveApi:chaveApi,limit:limit);
    if (result.isRight()) {
        return extrairInfoRight(result);
      }

      throw Exception(extrairInfoLeft(result));
  }
}
