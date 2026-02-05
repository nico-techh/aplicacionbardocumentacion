import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/producto.dart';
import '../view_models/productos_view_model.dart';

/// Widget que representa un producto en la lista de selección
/// Permite seleccionar o deseleccionar un producto al tocarlo
/// Muestra SnackBars y tooltips para feedback
class ProductoTile extends StatelessWidget {
  /// Producto que se va a mostrar
  final Producto producto;

  const ProductoTile({required this.producto, super.key});

  @override
  Widget build(BuildContext context) {
    final productosVM = context.read<ProductosViewModel>();

    return Semantics(
      // Etiqueta de accesibilidad con nombre, precio y estado de selección
      label:
          '${producto.nombre}, ${producto.precio.toStringAsFixed(2)}€. ${producto.cantidad > 0 ? "Seleccionado" : "No seleccionado"}',
      button: true,
      child: ListTile(
        title:
            Text(producto.nombre, style: Theme.of(context).textTheme.bodyMedium),
        subtitle: Text('${producto.precio.toStringAsFixed(2)}€'),

        // Icono para quitar producto si está seleccionado
        trailing: producto.cantidad > 0
            ? Tooltip(
                message: 'Quitar producto',
                child: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    productosVM.toggleSeleccion(producto);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${producto.nombre} removido'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              )
            : null,

        // Tocar el tile alterna la selección y muestra SnackBar
        onTap: () {
          productosVM.toggleSeleccion(producto);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(producto.cantidad > 0
                  ? '${producto.nombre} agregado'
                  : '${producto.nombre} removido'),
              duration: const Duration(seconds: 1),
            ),
          );
        },

        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      ),
    );
  }
}
