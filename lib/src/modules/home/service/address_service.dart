import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/modules/home/repositories/address_api_repository.dart';
import 'package:fast_location/src/modules/home/repositories/address_local_repository.dart';

class AddressService {
  final AddressApiRepository apiRepository;
  final AddressLocalRepository localRepository;

  AddressService({
    AddressApiRepository? api,
    AddressLocalRepository? local,
  })  : apiRepository = api ?? AddressApiRepository(),
        localRepository = local ?? AddressLocalRepository();

  Future<Address> searchCep(String cep) async {
    final address = await apiRepository.getAddressByCep(cep);
    await localRepository.saveAddress(address);
    return address;
  }

  List<Address> getHistory() {
    return localRepository.getAll();
  }
}
