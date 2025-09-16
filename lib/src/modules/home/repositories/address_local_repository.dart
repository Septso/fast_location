import 'package:hive/hive.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';

class AddressLocalRepository {
  final Box<Address> _box = Hive.box<Address>('historyBox');

  Future<void> saveAddress(Address address) async {
    await _box.add(address);
  }

  List<Address> getAll() {
    return _box.values.cast<Address>().toList();
  }
}
