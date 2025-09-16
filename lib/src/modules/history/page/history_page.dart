import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fast_location/src/modules/history/controller/history_controller.dart';
import 'package:fast_location/src/modules/home/components/address_list_component.dart';
import 'package:fast_location/src/modules/home/components/empty_search_component.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final controller = HistoryController();

  @override
  void initState() {
    super.initState();
    controller.loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Consultas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Limpar histórico',
            onPressed: () async {
              await controller.clearHistory();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Histórico limpo!')),
              );
            },
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          if (controller.history.isEmpty) {
            return const EmptySearchComponent(message: 'Nenhum histórico disponível.');
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: AddressListComponent(addresses: controller.history.toList()),
          );
        },
      ),
    );
  }
}
