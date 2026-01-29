import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/pedido_view_model.dart';
import '../widgets/pedido_card.dart';
import 'crear_pedido_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pedidoVM = context.watch<PedidoViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('PEDIDOS')),
      floatingActionButton: Tooltip(
        message: 'Crear un nuevo pedido',
        child: FloatingActionButton(
          onPressed: () async {
            final nuevoPedido = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CrearPedidoView()),
            );

            if (nuevoPedido != null && context.mounted) {
              pedidoVM.agregarPedido(nuevoPedido);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: ListView.builder(
        itemCount: pedidoVM.pedidos.length,
        itemBuilder: (context, index) {
          final pedido = pedidoVM.pedidos[index];
          return PedidoCard(pedido: pedido);
        },
      ),
    );
  }
}
