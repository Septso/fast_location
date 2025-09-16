import 'package:fast_location/src/http/dio_client.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';

class AddressApiRepository {
  final DioClient client;

  AddressApiRepository({DioClient? dioClient}) : client = dioClient ?? DioClient();

  Future<Address> getAddressByCep(String cep) async {
    final response = await client.getCep(cep);
    return Address.fromJson(response.data);
  }
}
