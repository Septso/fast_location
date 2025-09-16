import 'package:flutter/material.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';

class AddressListComponent extends StatelessWidget {
  final List<Address> addresses;
  final void Function(Address)? onTap;

  const AddressListComponent({super.key, required this.addresses, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (addresses.isEmpty) return const SizedBox.shrink();

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: addresses.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final a = addresses[index];
        return ListTile(
          title: Text(a.logradouro.isNotEmpty ? a.logradouro : a.cep),
          subtitle: Text('${a.bairro} — ${a.localidade}/${a.uf}'),
          onTap: () => onTap?.call(a),
        );
      },
    );
  }
}
