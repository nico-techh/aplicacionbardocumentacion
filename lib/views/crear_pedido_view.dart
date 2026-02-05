import 'package:flutter/material.dart';
import '../models/pedido.dart';
import '../models/producto.dart';
import 'seleccionar_productos_view.dart';

/// Pantalla para crear un nuevo pedido
/// Permite seleccionar productos, ver resumen y guardar el pedido
/// Incluye validaciones y SnackBars para feedback al usuario
class CrearPedidoView extends StatefulWidget {
  @override
  State<CrearPedidoView> createState() => _CrearPedidoViewState();
}

class _CrearPedidoViewState extends State<CrearPedidoView> {
  /// Controlador de texto para el nombre o número de la mesa
  final TextEditingController _mesaController = TextEditingController();

  /// Lista de productos seleccionados para el pedido
  List<Producto> seleccionados = [];

  /// Abre la pantalla de selección de productos
  /// Actualiza la lista de productos seleccionados al regresar
  void _seleccionarProductos() async {
    final productosSeleccionados = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SeleccionarProductosView(seleccionados: seleccionados),
      ),
    );

    if (productosSeleccionados != null && context.mounted) {
      setState(() {
        seleccionados = List<Producto>.from(productosSeleccionados);
      });
    }
  }

  /// Guarda el pedido después de validar que hay mesa y productos
  /// Muestra SnackBars de error o confirmación
  void _guardarPedido() {
    if (_mesaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes ingresar el nombre de la mesa')),
      );
      return;
    }

    if (seleccionados.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes seleccionar al menos un producto')),
      );
      return;
    }

    final pedidoCompleto = Pedido(
      nombreMesa: _mesaController.text,
      productos: seleccionados,
    );

    // SnackBar de confirmación
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pedido guardado correctamente')),
    );

    Navigator.pop(context, pedidoCompleto);
  }

  /// Navega a la pantalla de resumen del pedido
  void _verResumen() {
    Navigator.pushNamed(
      context,
      '/resumen',
      arguments: Pedido(nombreMesa: _mesaController.text, productos: seleccionados),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calcula el total provisional del pedido
    double total = seleccionados.fold(0, (sum, p) => sum + p.precio * p.cantidad);

    return Scaffold(
      appBar: AppBar(title: const Text('Crear Pedido')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input para nombre de mesa
            TextField(
              controller: _mesaController,
              decoration: const InputDecoration(
                labelText: 'Mesa / Nombre',
                hintText: 'Ej: Mesa 1',
              ),
            ),
            const SizedBox(height: 16),

            // Botón para seleccionar productos con tooltip
            Tooltip(
              message: 'Selecciona los productos para el pedido',
              child: ElevatedButton(
                onPressed: _seleccionarProductos,
                child: const Text('Seleccionar productos'),
              ),
            ),
            const SizedBox(height: 16),

            // Resumen provisional
            Text(
              'Resumen provisional: ${seleccionados.length} productos - Total: ${total.toStringAsFixed(2)}€',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),

            // Botones: Ver resumen, Guardar, Cancelar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Tooltip(
                  message: 'Ver un resumen del pedido antes de guardar',
                  child: ElevatedButton(
                    onPressed: _verResumen,
                    child: const Text('Ver resumen'),
                  ),
                ),
                Tooltip(
                  message: 'Guardar el pedido actual',
                  child: ElevatedButton(
                    onPressed: _guardarPedido,
                    child: const Text('Guardar pedido'),
                  ),
                ),
                Tooltip(
                  message: 'Cancelar y volver',
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
