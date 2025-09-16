import 'package:flutter/material.dart';

class EmptySearchComponent extends StatelessWidget {
  final String message;
  const EmptySearchComponent({super.key, this.message = 'Nenhum histórico. Faça sua primeira busca!'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off, size: 64),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
