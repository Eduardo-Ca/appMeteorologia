import 'package:dartz/dartz.dart';
import 'package:tempo/modules/cidade/data/datasource/cidade_datasource.dart';
import 'package:tempo/modules/cidade/data/models/cidade_model.dart';
import 'package:tempo/modules/cidade/domain/repositories/cidade_repository.dart';
import 'package:tempo/modules/core/errors/failures.dart';

class CidadeRepository implements ICidadeRepository {

   final ICidadeDataSource dataSource;
   CidadeRepository(this.dataSource);

    @override
    Future<Either<Failure, List<CidadeModel>>> obterCidade({cityname,chaveApi,limit})async {
    
    return await dataSource.obterCidade(cityname:cityname,chaveApi:chaveApi,limit:limit);
  }


}

