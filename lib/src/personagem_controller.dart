import 'package:atividade_flutter/src/personagem_repository.dart';
import 'package:atividade_flutter/modelos/personagem_modelo.dart';

class PersonagemController {
  final PersonagemController repository;

  const PersonagemController({required this.repository});

  Future<List<PersonagemModelo>> getPersonagem() async {
    try {
      final response = await repository.getPersonagem();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
