import 'package:hive_flutter/hive_flutter.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AddressAdapter());
  await Hive.openBox<Address>('historyBox');
}
