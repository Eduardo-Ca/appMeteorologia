

import 'package:dartz/dartz.dart';
import 'package:tempo/modules/cidade/data/models/cidade_model.dart';
import 'package:tempo/modules/core/errors/failures.dart';

abstract class ICidadeRepository{
  Future<Either<Failure, List<CidadeModel>>> obterCidade({cityname,chaveApi,limit}); 
 

   
}
