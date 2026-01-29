class Producto {
  final String nombre;
  final double precio;
  int cantidad;

  Producto({
    required this.nombre,
    required this.precio,
    this.cantidad = 0,
  });

  Producto copyWith({int? cantidad}) {
    return Producto(
      nombre: nombre,
      precio: precio,
      cantidad: cantidad ?? this.cantidad,
    );
  }
}
