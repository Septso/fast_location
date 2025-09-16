import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:fast_location/src/modules/home/controller/home_controller.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:fast_location/src/modules/home/components/address_list_component.dart';
import 'package:fast_location/src/modules/home/components/last_address_component.dart';
import 'package:fast_location/src/modules/home/components/empty_search_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.loadHistory();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void _onSelectAddress(Address address) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selecionado: ${address.logradouro}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultar CEP'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Ver histórico',
            onPressed: () {
              Navigator.of(context).pushNamed('/history');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Digite o CEP (somente números)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => controller.cep = value,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => controller.searchCep(),
                    child: const Text('Buscar'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    textController.clear();
                    controller.cep = '';
                  },
                  child: const Icon(Icons.clear),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) {
                final future = controller.addressFuture;
                if (future == null) return const SizedBox.shrink();
                if (future.status == FutureStatus.pending) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: CircularProgressIndicator(),
                  );
                }
                if (future.status == FutureStatus.rejected) {
                  return const Text('Erro na busca');
                }
                if (future.status == FutureStatus.fulfilled) {
                  final address = future.value;
                  if (address == null || address.cep.isEmpty) {
                    return const Text('CEP não encontrado');
                  }
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CEP: ${address.cep}'),
                          Text('Logradouro: ${address.logradouro}'),
                          Text('Bairro: ${address.bairro}'),
                          Text('Cidade: ${address.localidade} - ${address.uf}'),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Observer(
                builder: (_) {
                  final hist = controller.history;
                  if (hist.isEmpty) {
                    return const EmptySearchComponent();
                  }
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Último endereço:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        LastAddressComponent(address: hist.first),
                        const SizedBox(height: 12),
                        const Text(
                          'Histórico de buscas:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        AddressListComponent(
                          addresses: hist.toList(),
                          onTap: _onSelectAddress,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
