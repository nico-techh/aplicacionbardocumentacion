import 'producto.dart';

class Pedido {
  final String nombreMesa;
  final List<Producto> productos;

  Pedido({required this.nombreMesa, required this.productos});

  double get total =>
      productos.fold(0, (sum, producto) => sum + producto.precio * producto.cantidad);

  int get totalProductos =>
      productos.fold(0, (sum, producto) => sum + producto.cantidad);

  String get resumen =>
      'Pedido de $nombreMesa. $totalProductos productos. Total ${total.toStringAsFixed(2)}€';
}
