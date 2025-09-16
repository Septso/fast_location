import 'package:hive/hive.dart';
part 'address_model.g.dart';

@HiveType(typeId: 0)
class Address extends HiveObject {
  @HiveField(0)
  final String cep;
  @HiveField(1)
  final String logradouro;
  @HiveField(2)
  final String complemento;
  @HiveField(3)
  final String bairro;
  @HiveField(4)
  final String localidade;
  @HiveField(5)
  final String uf;

  Address({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        cep: json['cep'] ?? '',
        logradouro: json['logradouro'] ?? '',
        complemento: json['complemento'] ?? '',
        bairro: json['bairro'] ?? '',
        localidade: json['localidade'] ?? '',
        uf: json['uf'] ?? '',
      );
}
