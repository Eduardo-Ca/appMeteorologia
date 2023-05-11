
 // ignore_for_file: avoid_print, unnecessary_brace_in_string_interps
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tempo/modules/core/utils/constants/request_constante.dart';




class RequestUtil {
  int? produtoId;
  late Response response;
  late Dio dio;
  late String urlBase;


  // 1- criação do objeto dio
  _criarObjDio() async {

    String urlBase ="https://api.openweathermap.org/";

    dio = Dio(BaseOptions(
        connectTimeout: const Duration(milliseconds: 20000),
        receiveTimeout: const Duration(milliseconds: 30000),
        baseUrl: urlBase,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        followRedirects: true,
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return status! <= 500;
        }));
  }

  //função para fazer a requisição
  Future<dynamic> fazRequestNovo(
      {required String method,
      required String endpoint,
      required dynamic data,
      BuildContext? context,
      String mensagemErro = '',
      dynamic dataParameters}) async {
        endpoint = endpoint;
        dynamic requisicao;
        
        await _criarObjDio();

        try {
          switch (method.toUpperCase()) {
            case Request.GET:
              requisicao = dio.get(endpoint, queryParameters: data);
              break;
            case Request.POST:
              if (dataParameters == null) {
                requisicao = dio.post(endpoint, data: data);
              } else {
                requisicao = dio.post(endpoint, data: data, queryParameters: dataParameters);
              }
              break;
            case Request.PUT:
              if (dataParameters == null) {
                requisicao = dio.put(endpoint, data: data);
              } else {
                requisicao = dio.put(endpoint, data: data, queryParameters: data);
              }
              break;
            case Request.DELETE:
              //requisicao = dio.delete(endpoint, data: data);
              if (dataParameters == null) {
                requisicao = dio.delete(endpoint, data: data);
              } else {
                requisicao = dio.delete(endpoint,data: data, queryParameters: dataParameters);
              }
              break;
            default:
              requisicao = dio.get(endpoint, queryParameters: data);
              break;
          }
          response = await requisicao;

          if (response.statusCode == 400) {
        
            print('Erro status: 400');

            if (response.data['erroCodigo'] != null || response.data['erros'] != null) {

              return response;
            }
            return response;
          } else if (response.statusCode == 500) {
            print('Erro status: 500');

            if (context != null) {
              return response;
            }
          }else{
            return response;
          }
          }catch (e) {
            print(e);
          }

          // ignore: use_build_context_synchronously
          return await fazRequestNovo(
              method: method,
              endpoint: endpoint,
              data: data,
              context: context,
              );
          }
  }


  /// Realiza a requisição para a API
  ///
  /// É necessário informar o método de requisição com uma simples String,
  /// porém para manter consistência, existe o arquivo de constantes de requests,
  /// que pode ser utilizado da seguinte maneira, usando o método `GET` como exemplo:
  ///
  /// ```dart
  /// RequestUtil().fazRequest(
  ///   method: Request.GET,
  ///   endpoint: 'Path/Endpoint',
  ///   data: {
  ///     'id': 0,
  ///     'descricao': 'teste'
  ///   }
  /// );
  /// ```
  ///
  /// Os parâmetros `endpoint`, que é o endereço que a requisição irá chamar,
  /// e `data`, que são informaçoes requeridas para a requisição, como consultas ou objetos em `JSON`
  /// são necessários também.
  ///
  /// Caso uma requisição não requer `data`, apenas passe como `null`
  ///




