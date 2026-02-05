/// Clase que representa un producto del bar
/// Un producto tiene un nombre, un precio y una cantidad
class Producto {
  /// Nombre del producto (ej: "Cerveza", "Tapa")
  final String nombre;

  /// Precio unitario del producto en euros
  final double precio;

  /// Cantidad del producto en el pedido
  int cantidad;

  /// Constructor de Producto
  /// La cantidad por defecto es 0 si no se especifica
  Producto({
    required this.nombre,
    required this.precio,
    this.cantidad = 0,
  });

  /// Crea una copia del producto con la cantidad modificada
  /// Esto es útil para actualizar la cantidad sin modificar el objeto original
  Producto copyWith({int? cantidad}) {
    return Producto(
      nombre: nombre,
      precio: precio,
      cantidad: cantidad ?? this.cantidad,
    );
  }
}
