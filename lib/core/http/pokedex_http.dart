

import 'package:dio/dio.dart';

@LazySingleton
class PokedexHttp {
  final Dio dio;
  
  const PokedexHttp(this.dio);
}