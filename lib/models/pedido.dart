import 'producto.dart';

/// Clase que representa un pedido realizado en el bar
/// Un pedido contiene el nombre de la mesa y los productos pedidos
class Pedido {
  /// Nombre de la mesa que realiza el pedido
  final String nombreMesa;

  /// Lista de productos que forman parte del pedido
  final List<Producto> productos;

  /// Constructor de la clase Pedido
  /// Se requiere el nombre de la mesa y la lista de productos
  Pedido({required this.nombreMesa, required this.productos});

  /// Calcula el total del pedido sumando el precio por la cantidad de cada producto
  double get total =>
      productos.fold(0, (sum, producto) => sum + producto.precio * producto.cantidad);

  /// Calcula el total de productos en el pedido sumando las cantidades de cada producto
  int get totalProductos =>
      productos.fold(0, (sum, producto) => sum + producto.cantidad);

  /// Genera un resumen del pedido con el nombre de la mesa,
  /// total de productos y total en euros con dos decimales
  String get resumen =>
      'Pedido de $nombreMesa. $totalProductos productos. Total ${total.toStringAsFixed(2)}€';
}
