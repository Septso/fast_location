import 'package:mobx/mobx.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:hive/hive.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  final Box<Address> _box = Hive.box<Address>('historyBox');

  @observable
  ObservableList<Address> history = ObservableList<Address>();

  @action
  void loadHistory() {
    final items = _box.values.toList();
    history = ObservableList<Address>.of(items.reversed.toList());
  }

  @action
  Future<void> clearHistory() async {
    await _box.clear();
    loadHistory();
  }
}
