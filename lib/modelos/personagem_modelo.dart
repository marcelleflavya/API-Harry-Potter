import 'dart:convert';

class PersonagemModelo {
  String nome;
  String casa;
  String ator;
  String imagem;

  PersonagemModelo({
    required this.nome,
    required this.casa,
    required this.ator,
    required this.imagem,
  });

  PersonagemModelo copyWith({
    String? nome,
    String? casa,
    String? ator,
    String? imagem,
  }) {
    return PersonagemModelo(
      nome: nome ?? this.nome,
      casa: casa ?? this.casa,
      ator: ator ?? this.ator,
      imagem: imagem ?? this.imagem,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'casa': casa,
      'ator': ator,
      'imagem': imagem,
    };
  }

  factory PersonagemModelo.fromMap(Map<String, dynamic> map) {
    return PersonagemModelo(
      nome: map['nome'] as String,
      casa: map['casa'] as String,
      ator: map['ator'] as String,
      imagem: map['imagem'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonagemModelo.fromJson(String source) =>
      PersonagemModelo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PersonagemModelo(nome: $nome, casa: $casa, ator: $ator, imagem: $imagem)';
  }

  @override
  bool operator ==(covariant PersonagemModelo other) {
    if (identical(this, other)) return true;

    return other.nome == nome &&
        other.casa == casa &&
        other.ator == ator &&
        other.imagem == imagem;
  }

  @override
  int get hashCode {
    return nome.hashCode ^ casa.hashCode ^ ator.hashCode ^ imagem.hashCode;
  }
}
