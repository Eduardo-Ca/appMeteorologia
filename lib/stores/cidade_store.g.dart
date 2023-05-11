// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cidade_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CidadeStore on _CidadeStore, Store {
  late final _$listaCidadesAtom =
      Atom(name: '_CidadeStore.listaCidades', context: context);

  @override
  ObservableList<CidadeModel> get listaCidades {
    _$listaCidadesAtom.reportRead();
    return super.listaCidades;
  }

  @override
  set listaCidades(ObservableList<CidadeModel> value) {
    _$listaCidadesAtom.reportWrite(value, super.listaCidades, () {
      super.listaCidades = value;
    });
  }

  late final _$_cidadesPendentesAtom =
      Atom(name: '_CidadeStore._cidadesPendentes', context: context);

  @override
  ObservableFuture<List<CidadeModel>>? get _cidadesPendentes {
    _$_cidadesPendentesAtom.reportRead();
    return super._cidadesPendentes;
  }

  @override
  set _cidadesPendentes(ObservableFuture<List<CidadeModel>>? value) {
    _$_cidadesPendentesAtom.reportWrite(value, super._cidadesPendentes, () {
      super._cidadesPendentes = value;
    });
  }

  late final _$cidadesPendentesCarregandoAtom =
      Atom(name: '_CidadeStore.cidadesPendentesCarregando', context: context);

  @override
  bool get cidadesPendentesCarregando {
    _$cidadesPendentesCarregandoAtom.reportRead();
    return super.cidadesPendentesCarregando;
  }

  @override
  set cidadesPendentesCarregando(bool value) {
    _$cidadesPendentesCarregandoAtom
        .reportWrite(value, super.cidadesPendentesCarregando, () {
      super.cidadesPendentesCarregando = value;
    });
  }

  late final _$cidadesPendentesCarregadoAtom =
      Atom(name: '_CidadeStore.cidadesPendentesCarregado', context: context);

  @override
  bool get cidadesPendentesCarregado {
    _$cidadesPendentesCarregadoAtom.reportRead();
    return super.cidadesPendentesCarregado;
  }

  @override
  set cidadesPendentesCarregado(bool value) {
    _$cidadesPendentesCarregadoAtom
        .reportWrite(value, super.cidadesPendentesCarregado, () {
      super.cidadesPendentesCarregado = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CidadeStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$obterCidadesAsyncAction =
      AsyncAction('_CidadeStore.obterCidades', context: context);

  @override
  Future<void> obterCidades(
      {dynamic cityname, dynamic chaveApi, dynamic limit}) {
    return _$obterCidadesAsyncAction.run(() => super
        .obterCidades(cityname: cityname, chaveApi: chaveApi, limit: limit));
  }

  @override
  String toString() {
    return '''
listaCidades: ${listaCidades},
cidadesPendentesCarregando: ${cidadesPendentesCarregando},
cidadesPendentesCarregado: ${cidadesPendentesCarregado},
errorMessage: ${errorMessage}
    ''';
  }
}
