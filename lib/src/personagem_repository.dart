import 'dart:developer';
import 'package:atividade_flutter/modelos/personagem_modelo.dart';
import 'package:dio/dio.dart';

class PersonagemRepository {
  final dio =
      Dio(BaseOptions(baseUrl: 'https://hp-api.herokuapp.com/api'));

  Future<List<PersonagemModelo>> getPersonagem() async {
    try {
      final response = await dio.get('/characters');

      log(
        response.realUri.toString(),
        name: response.statusCode.toString(),
      );

      final data = List.from(response.data);

      final personagem = data.map((e) => PersonagemModelo.fromMap(e)).toList();

      return personagem;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
