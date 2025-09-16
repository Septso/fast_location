import 'package:flutter/material.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:geocoding/geocoding.dart';

class LastAddressComponent extends StatelessWidget {
  final Address? address;

  const LastAddressComponent({super.key, required this.address});

  Future<void> _openMaps(Address address) async {
    if (address.logradouro.isEmpty && address.cep.isEmpty) return;

    try {
      // Monta o endereço completo para geocoding
      final query =
          "${address.logradouro}, ${address.bairro}, ${address.localidade}, ${address.uf}, ${address.cep}";

      // Converte endereço → coordenadas
      final locations = await locationFromAddress(query);
      if (locations.isEmpty) return;

      final coords = Coords(locations.first.latitude, locations.first.longitude);

      // Pega apps de mapa instalados
      final availableMaps = await MapLauncher.installedMaps;

      if (availableMaps.isNotEmpty) {
        // Abre no primeiro app disponível (Google Maps, Waze, etc.)
        await availableMaps.first.showDirections(
          destination: coords,
          destinationTitle: address.logradouro.isNotEmpty
              ? address.logradouro
              : "Endereço",
        );
      }
    } catch (e) {
      debugPrint("Erro ao abrir rota: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (address == null) return const SizedBox.shrink();

    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(address!.logradouro.isNotEmpty
            ? address!.logradouro
            : address!.cep),
        subtitle: Text('${address!.bairro} — ${address!.localidade}/${address!.uf}'),
        trailing: const Icon(Icons.navigation),
        onTap: () => _openMaps(address!),
      ),
    );
  }
}
