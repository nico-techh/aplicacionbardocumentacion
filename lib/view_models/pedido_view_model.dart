import 'package:flutter/material.dart';
import '../models/pedido.dart';
import '../models/producto.dart';

class PedidoViewModel extends ChangeNotifier {
  final List<Pedido> _pedidos = [
    Pedido(nombreMesa: 'Mesa 1', productos: [
      Producto(nombre: 'Cerveza', precio: 3.0, cantidad: 2),
      Producto(nombre: 'Pizza', precio: 7.5, cantidad: 1),
    ]),
    Pedido(nombreMesa: 'Mesa 2', productos: [
      Producto(nombre: 'Hamburguesa', precio: 5.0, cantidad: 1),
      Producto(nombre: 'Ensalada', precio: 4.0, cantidad: 2),
    ]),
  ];

  List<Pedido> get pedidos => List.unmodifiable(_pedidos);

  void agregarPedido(Pedido pedido) {
    _pedidos.add(pedido);
    notifyListeners();
  }
}
