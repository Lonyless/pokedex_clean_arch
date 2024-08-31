import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class PokedexHttp {
  final Dio dio = Dio();

  PokedexHttp();

  Future<Response> post() async {
    throw UnimplementedError();
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameteres}) async {
    return await dio.get(path, queryParameters: queryParameteres);
  }

  Future<Response> put() async {
    throw UnimplementedError();
  }

  Future<Response> delete() async {
    throw UnimplementedError();
  }
}
