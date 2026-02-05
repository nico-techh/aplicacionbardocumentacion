import 'package:flutter/material.dart';
import '../models/producto.dart';

/// ViewModel que maneja la lista de productos del bar
/// Permite seleccionar/deseleccionar productos y notificar a la UI
class ProductosViewModel extends ChangeNotifier {
  /// Lista interna de productos disponibles en el bar
  final List<Producto> _productos = [
    Producto(nombre: 'Cerveza', precio: 3.0),
    Producto(nombre: 'Pizza', precio: 7.5),
    Producto(nombre: 'Hamburguesa', precio: 5.0),
    Producto(nombre: 'Ensalada', precio: 4.0),
    Producto(nombre: 'Refresco', precio: 2.5),
    Producto(nombre: 'Postre', precio: 3.5),
  ];

  /// Devuelve una lista inmodificable de productos
  /// Para evitar que la UI modifique directamente la lista
  List<Producto> get productos => List.unmodifiable(_productos);

  /// Selecciona o deselecciona un producto
  /// Si la cantidad es 0, se marca como 1
  /// Si la cantidad es mayor que 0, se marca como 0
  void toggleSeleccion(Producto producto) {
    if (producto.cantidad == 0) {
      producto.cantidad = 1;
    } else {
      producto.cantidad = 0;
    }
    notifyListeners();
  }

  /// Devuelve la lista de productos actualmente seleccionados
  List<Producto> get seleccionados =>
      _productos.where((p) => p.cantidad > 0).toList();
}
