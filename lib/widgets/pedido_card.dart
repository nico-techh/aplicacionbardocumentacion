import 'package:flutter/material.dart';
import '../models/pedido.dart';

class PedidoCard extends StatelessWidget {
  final Pedido pedido;
  final VoidCallback? onTap;

  const PedidoCard({required this.pedido, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: pedido.resumen,
      button: true,
      child: Card(
        margin: const EdgeInsets.all(8),
        child: ListTile(
          title: Text(pedido.nombreMesa,
              style: Theme.of(context).textTheme.titleMedium),
          subtitle: Text(
              '${pedido.totalProductos} productos - Total: ${pedido.total.toStringAsFixed(2)}€',
              style: Theme.of(context).textTheme.bodyMedium),
          onTap: onTap,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }
}
