import 'dart:io';

import 'package:dartz/dartz.dart';

String extrairInfoLeft(Either<dynamic, dynamic> obj){

  var resultado = obj.swap().getOrElse(() => throw UnimplementedError());

  return resultado.toString();
}

dynamic extrairInfoRight(Either<dynamic, dynamic> obj){


  return obj.getOrElse(() => throw UnimplementedError());

}

List<dynamic> extrairInfoRightRetornaListDynamic(Either<dynamic, dynamic> obj){

  List<dynamic> resultado = obj.getOrElse(() => throw UnimplementedError());

  return resultado;
}

File? extrairInfoRightObterFoto(Either<dynamic, dynamic> obj){

  File? resultado = obj.getOrElse(() => throw UnimplementedError());

  return resultado;

}
