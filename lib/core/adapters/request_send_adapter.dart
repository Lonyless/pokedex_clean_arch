import 'package:dio/dio.dart';
import 'package:pokedex_clean_arch/core/errors/server_exception.dart';

class RequestSendAdapter {
  static Future<T> guard<T>(Future<T> Function() callback) async {
    try {
      return await callback();
    } on DioException catch (e) {
      String message = "Erro ao se conectar ao servidor";

      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          message = "Não encontrado";
        }
        if (e.response!.statusCode == 500) {
          message = "Falha geral no servidor";
        }
      }

      throw ServerException(message: message, statusCode: e.response?.statusCode);
    }
  }
}
