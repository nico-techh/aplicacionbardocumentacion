import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/producto.dart';
import '../view_models/productos_view_model.dart';

class ProductoTile extends StatelessWidget {
  final Producto producto;

  const ProductoTile({required this.producto, super.key});

  @override
  Widget build(BuildContext context) {
    final productosVM = context.read<ProductosViewModel>();

    return Semantics(
      label:
          '${producto.nombre}, ${producto.precio.toStringAsFixed(2)}€. ${producto.cantidad > 0 ? "Seleccionado" : "No seleccionado"}',
      button: true,
      child: ListTile(
        title:
            Text(producto.nombre, style: Theme.of(context).textTheme.bodyMedium),
        subtitle: Text('${producto.precio.toStringAsFixed(2)}€'),
        trailing: producto.cantidad > 0
            ? Tooltip(
                message: 'Quitar producto',
                child: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () => productosVM.toggleSeleccion(producto),
                ),
              )
            : null,
        onTap: () => productosVM.toggleSeleccion(producto),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      ),
    );
  }
}
