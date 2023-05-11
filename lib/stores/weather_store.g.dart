// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherStore on _WeatherStore, Store {
  late final _$climaAtom = Atom(name: '_WeatherStore.clima', context: context);

  @override
  WeatherPrincipalModel? get clima {
    _$climaAtom.reportRead();
    return super.clima;
  }

  @override
  set clima(WeatherPrincipalModel? value) {
    _$climaAtom.reportWrite(value, super.clima, () {
      super.clima = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_WeatherStore.errorMessage', context: context);

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

  late final _$obterClimaAsyncAction =
      AsyncAction('_WeatherStore.obterClima', context: context);

  @override
  Future<void> obterClima(
      {dynamic lat,
      dynamic lon,
      dynamic units,
      dynamic lang,
      dynamic chaveApi}) {
    return _$obterClimaAsyncAction.run(() => super.obterClima(
        lat: lat, lon: lon, units: units, lang: lang, chaveApi: chaveApi));
  }

  @override
  String toString() {
    return '''
clima: ${clima},
errorMessage: ${errorMessage}
    ''';
  }
}
