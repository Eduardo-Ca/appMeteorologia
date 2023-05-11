

import 'package:tempo/modules/cidade/data/models/cidade_model.dart';

abstract class IUsecasesCidade {
   

  Future<List<CidadeModel>> obterCidade({cityname,chaveApi,limit}); 
}
