import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/productos_view_model.dart';
import '../models/producto.dart';
import '../widgets/producto_tile.dart';

class SeleccionarProductosView extends StatefulWidget {
  final List<Producto> seleccionados;

  const SeleccionarProductosView({required this.seleccionados, super.key});

  @override
  State<SeleccionarProductosView> createState() =>
      _SeleccionarProductosViewState();
}

class _SeleccionarProductosViewState extends State<SeleccionarProductosView> {
  @override
  Widget build(BuildContext context) {
    final productosVM = context.watch<ProductosViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Seleccionar Productos')),
      body: ListView.builder(
        itemCount: productosVM.productos.length,
        itemBuilder: (context, index) {
          final producto = productosVM.productos[index];
          return ProductoTile(producto: producto);
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: 'cancelar',
            onPressed: () => Navigator.pop(context),
            label: const Text('Cancelar'),
          ),
          const SizedBox(width: 10),
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
