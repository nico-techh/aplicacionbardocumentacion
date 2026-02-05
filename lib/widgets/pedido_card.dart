import 'package:flutter/material.dart';
import '../models/pedido.dart';

/// Widget que representa un pedido en forma de tarjeta
/// Muestra el nombre de la mesa, total de productos y precio total
/// Permite detectar taps opcionales con [onTap]
class PedidoCard extends StatelessWidget {
  /// Pedido que se va a mostrar en la tarjeta
  final Pedido pedido;

  /// Callback opcional que se ejecuta al tocar la tarjeta
  final VoidCallback? onTap;

  const PedidoCard({required this.pedido, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      // Etiqueta accesible para lectores de pantalla con el resumen del pedido
      label: pedido.resumen,
      button: true,
      child: Card(
        margin: const EdgeInsets.all(8),

        // ListTile con información del pedido
        child: ListTile(
          title: Text(
            pedido.nombreMesa,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            '${pedido.totalProductos} productos - Total: ${pedido.total.toStringAsFixed(2)}€',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          // Ejecuta la acción onTap si se pasa desde el padre
          onTap: onTap,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }
}
