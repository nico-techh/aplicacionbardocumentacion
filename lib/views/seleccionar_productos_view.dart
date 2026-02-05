import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/productos_view_model.dart';
import '../models/producto.dart';
import '../widgets/producto_tile.dart';

/// Pantalla para seleccionar productos de la lista del bar
/// Permite marcar productos como seleccionados y devolverlos al crear el pedido
class SeleccionarProductosView extends StatefulWidget {
  /// Lista de productos ya seleccionados previamente
  final List<Producto> seleccionados;

  const SeleccionarProductosView({required this.seleccionados, super.key});

  @override
  State<SeleccionarProductosView> createState() =>
      _SeleccionarProductosViewState();
}

class _SeleccionarProductosViewState extends State<SeleccionarProductosView> {
  @override
  Widget build(BuildContext context) {
    // Obtenemos la instancia de ProductosViewModel desde Provider
    final productosVM = context.watch<ProductosViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar Productos')),

      // Lista de productos disponibles
      body: ListView.builder(
        itemCount: productosVM.productos.length,
        itemBuilder: (context, index) {
          final producto = productosVM.productos[index];
          // Cada producto se muestra con un widget ProductoTile
          return ProductoTile(producto: producto);
        },
      ),

      // Botones flotantes para cancelar o confirmar selección
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Cancelar selección y volver
          FloatingActionButton.extended(
            heroTag: 'cancelar',
            onPressed: () => Navigator.pop(context),
            label: const Text('Cancelar'),
          ),
          const SizedBox(width: 10),

          // Confirmar selección y devolver lista de productos seleccionados
          FloatingActionButton.extended(
            heroTag: 'confirmar',
            onPressed: () {
              Navigator.pop(context, productosVM.seleccionados);
            },
            label: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}
