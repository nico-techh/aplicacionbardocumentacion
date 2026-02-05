import 'package:flutter/material.dart';
import '../models/pedido.dart';

/// Pantalla que muestra el resumen final de un pedido
/// Incluye el nombre de la mesa, los productos seleccionados y el total
class ResumenPedidoView extends StatelessWidget {
  const ResumenPedidoView({super.key});

  @override
  Widget build(BuildContext context) {
    // Recupera el pedido pasado como argumento desde la navegación
    final pedido = ModalRoute.of(context)!.settings.arguments as Pedido;

    return Scaffold(
      appBar: AppBar(title: const Text('Resumen Final')),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nombre de la mesa
            Text(
              pedido.nombreMesa,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),

            // Lista de productos del pedido
            Expanded(
              child: ListView.builder(
                itemCount: pedido.productos.length,
                itemBuilder: (context, index) {
                  final p = pedido.productos[index];
                  return ListTile(
                    // Nombre del producto
                    title: Text(p.nombre),
                    // Cantidad x precio unitario
                    subtitle: Text('${p.cantidad} x ${p.precio.toStringAsFixed(2)}€'),
                  );
                },
              ),
            ),

            // Total del pedido
            Text(
              'Total: ${pedido.total.toStringAsFixed(2)}€',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            // Botón para volver a la pantalla anterior
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Volver'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
