import 'package:flutter/material.dart';
import '../models/pedido.dart';

class ResumenPedidoView extends StatelessWidget {
  const ResumenPedidoView({super.key});

  @override
  Widget build(BuildContext context) {
    final pedido = ModalRoute.of(context)!.settings.arguments as Pedido;

    return Scaffold(
      appBar: AppBar(title: const Text('Resumen Final')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(pedido.nombreMesa, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: pedido.productos.length,
                itemBuilder: (context, index) {
                  final p = pedido.productos[index];
                  return ListTile(
                    title: Text(p.nombre),
                    subtitle: Text('${p.cantidad} x ${p.precio.toStringAsFixed(2)}€'),
                  );
                },
              ),
            ),
            Text('Total: ${pedido.total.toStringAsFixed(2)}€', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
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
