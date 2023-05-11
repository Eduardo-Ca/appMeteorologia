
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:tempo/modules/cidade/data/models/cidade_model.dart';
import 'package:tempo/modules/cidade/domain/usecases/cidade_usecases.dart';

part 'cidade_store.g.dart';
//flutter pub run build_runner build
//flutter pub run build_runner build --delete-conflicting-outputs
// ignore: library_private_types_in_public_api
class CidadeStore = _CidadeStore with _$CidadeStore;

abstract class _CidadeStore with Store {

 late UsecasesCidade _useCasesCidade;

  _CidadeStore() {
    _useCasesCidade = GetIt.I.get<UsecasesCidade>();
    autorun(
      (_) {},
    );
  }

//==================================== LISTA PRODUTOS ===========================================================
  @observable
  ObservableList<CidadeModel> listaCidades = ObservableList<CidadeModel>();

  @observable
  ObservableFuture<List<CidadeModel>>? _cidadesPendentes;

  @observable
  bool cidadesPendentesCarregando = false;

  @observable
  bool cidadesPendentesCarregado = false;

  @observable
  String errorMessage = '';

    @action
  Future<void> obterCidades({cityname,chaveApi,limit}) async {
    try {
      errorMessage = ''; //reseta a mensagem de erro

      cidadesPendentesCarregando = true;
      cidadesPendentesCarregado = false;

      List<CidadeModel> listaDeCidades = [];

      _cidadesPendentes = ObservableFuture( _useCasesCidade.obterCidade(cityname:cityname,chaveApi:chaveApi,limit:limit));

      listaDeCidades = await _cidadesPendentes!;

      do {
        if (_cidadesPendentes!.status == FutureStatus.fulfilled) {
          if (errorMessage == '') {
            listaCidades.clear();
            listaCidades.addAll(listaDeCidades);

            cidadesPendentesCarregado = true;
            cidadesPendentesCarregando = false;
          }
        }
      } while (cidadesPendentesCarregado != true || errorMessage != '');
    } catch (e) {
      cidadesPendentesCarregado = false;
      cidadesPendentesCarregando = false;
      errorMessage = e.toString();
    }
  }


  
//==================================== LISTA CIDADE ===========================================================

}
