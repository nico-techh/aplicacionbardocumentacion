import 'package:flutter/material.dart';
import '../models/producto.dart';

class ProductosViewModel extends ChangeNotifier {
  final List<Producto> _productos = [
    Producto(nombre: 'Cerveza', precio: 3.0),
    Producto(nombre: 'Pizza', precio: 7.5),
    Producto(nombre: 'Hamburguesa', precio: 5.0),
    Producto(nombre: 'Ensalada', precio: 4.0),
    Producto(nombre: 'Refresco', precio: 2.5),
    Producto(nombre: 'Postre', precio: 3.5),
  ];

  List<Producto> get productos => List.unmodifiable(_productos);

  void toggleSeleccion(Producto producto) {
    if (producto.cantidad == 0) {
      producto.cantidad = 1;
    } else {
      producto.cantidad = 0;
    }
    notifyListeners();
  }

  List<Producto> get seleccionados =>
      _productos.where((p) => p.cantidad > 0).toList();
}
