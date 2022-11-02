// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PersonagemModelo {
  String name;
  String house;
  String actor;
  String image;

  PersonagemModelo({
    required this.name,
    required this.house,
    required this.actor,
    required this.image,
  });

  PersonagemModelo copyWith({
    String? name,
    String? house,
    String? actor,
    String? image,
  }) {
    return PersonagemModelo(
      name: name ?? this.name,
      house: house ?? this.house,
      actor: actor ?? this.actor,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'house': house,
      'actor': actor,
      'image': image,
    };
  }

  factory PersonagemModelo.fromMap(Map<String, dynamic> map) {
    return PersonagemModelo(
      name: map['name'] ?? "",
      house: map['house'] ?? "",
      actor: map['actor'] ?? "",
      image: map['image'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonagemModelo.fromJson(String source) => PersonagemModelo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PersonagemModelo(name: $name, house: $house, actor: $actor, image: $image)';
  }

  @override
  bool operator ==(covariant PersonagemModelo other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.house == house &&
      other.actor == actor &&
      other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      house.hashCode ^
      actor.hashCode ^
      image.hashCode;
  }
}
