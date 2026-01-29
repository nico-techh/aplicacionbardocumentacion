import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/productos_view_model.dart';
import '../models/pedido.dart';
import '../models/producto.dart';
import 'seleccionar_productos_view.dart';

class CrearPedidoView extends StatefulWidget {
  @override
  State<CrearPedidoView> createState() => _CrearPedidoViewState();
}

class _CrearPedidoViewState extends State<CrearPedidoView> {
  final TextEditingController _mesaController = TextEditingController();
  List<Producto> seleccionados = [];

  void _seleccionarProductos() async {
    final productosSeleccionados = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SeleccionarProductosView(seleccionados: seleccionados)),
    );

    if (productosSeleccionados != null && context.mounted) {
      setState(() {
        seleccionados = List<Producto>.from(productosSeleccionados);
      });
    }
  }

  void _verResumen() {
    Navigator.pushNamed(context, '/resumen', arguments: Pedido(
      nombreMesa: _mesaController.text,
      productos: seleccionados,
    ));
  }

  @override
  Widget build(BuildContext context) {
    double total = seleccionados.fold(0, (sum, p) => sum + p.precio * p.cantidad);

    return Scaffold(
      appBar: AppBar(title: const Text('Crear Pedido')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _mesaController,
              decoration: const InputDecoration(labelText: 'Mesa / Nombre'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _seleccionarProductos,
              child: const Text('Seleccionar productos'),
            ),
            const SizedBox(height: 16),
            Text(
              'Resumen provisional: ${seleccionados.length} productos - Total: ${total.toStringAsFixed(2)}€',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _verResumen,
                  child: const Text('Ver resumen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_mesaController.text.isEmpty || seleccionados.isEmpty) return;
                    final pedidoCompleto = Pedido(
                      nombreMesa: _mesaController.text,
                      productos: seleccionados,
                    );
                    Navigator.pop(context, pedidoCompleto);
                  },
                  child: const Text('Guardar pedido'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
