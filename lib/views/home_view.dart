import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/pedido_view_model.dart';
import '../widgets/pedido_card.dart';
import 'crear_pedido_view.dart';

/// Pantalla principal que muestra la lista de pedidos
/// Permite agregar nuevos pedidos usando el FloatingActionButton
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtenemos el PedidoViewModel desde el Provider
    final pedidoVM = context.watch<PedidoViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('PEDIDOS')),

      // Botón flotante para crear un nuevo pedido
      floatingActionButton: Tooltip(
        message: 'Crear un nuevo pedido', // Tooltip que explica el botón
        child: FloatingActionButton(
          onPressed: () async {
            // Navega a la pantalla de creación de pedidos
            final nuevoPedido = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CrearPedidoView()),
            );

            // Si se creó un pedido y la pantalla sigue montada, se agrega a la lista
            if (nuevoPedido != null && context.mounted) {
              pedidoVM.agregarPedido(nuevoPedido);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),

      // Lista de pedidos existentes
      body: ListView.builder(
        itemCount: pedidoVM.pedidos.length,
        itemBuilder: (context, index) {
          final pedido = pedidoVM.pedidos[index];
          // Muestra cada pedido usando un widget PedidoCard
          return PedidoCard(pedido: pedido);
        },
      ),
    );
  }
}
