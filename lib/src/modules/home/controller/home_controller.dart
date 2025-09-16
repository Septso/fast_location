import 'package:mobx/mobx.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/modules/home/service/address_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AddressService service = AddressService();

  @observable
  String cep = '';

  @observable
  ObservableFuture<Address?>? addressFuture;

  @observable
  ObservableList<Address> history = ObservableList<Address>();

  @action
  Future<void> searchCep() async {
    if (cep.isEmpty) return;
    addressFuture = ObservableFuture(service.searchCep(cep));
    // atualiza o histórico quando a pesquisa terminar
    addressFuture!.then((address) {
      if (address != null) {
        loadHistory();
      }
    }).catchError((_) {
      // você pode logar ou tratar aqui se quiser
    });
  }

  @action
  Future<void> loadHistory() async {
    final items = service.getHistory();
    history = ObservableList<Address>.of(items.reversed.toList());
  }
}
