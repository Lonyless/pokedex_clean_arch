import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class PokedexHttp {
  final Dio dio;

  PokedexHttp(this.dio);

  Future<Response> post() async {
    throw UnimplementedError();
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameteres}) async {
    debugPrint('GET - $path');
    return await dio.get(path, queryParameters: queryParameteres);
  }

  Future<Response> put() async {
    throw UnimplementedError();
  }

  Future<Response> delete() async {
    throw UnimplementedError();
  }
}

@module
abstract class PokedexHttpModule {
  @singleton
  Dio get dio => Dio();
}
