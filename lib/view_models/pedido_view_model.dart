import 'package:flutter/material.dart';
import '../models/pedido.dart';
import '../models/producto.dart';

/// ViewModel que maneja la lista de pedidos del bar
/// Extiende ChangeNotifier para notificar a la interfaz cuando hay cambios
class PedidoViewModel extends ChangeNotifier {
  /// Lista interna de pedidos
  /// Inicialmente contiene algunos pedidos de ejemplo
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

  /// Devuelve una lista inmodificable de pedidos
  /// Esto evita que la UI o código externo modifique directamente la lista
  List<Pedido> get pedidos => List.unmodifiable(_pedidos);

  /// Agrega un nuevo pedido a la lista
  /// Llama a notifyListeners() para que la UI se actualice automáticamente
  void agregarPedido(Pedido pedido) {
    _pedidos.add(pedido);
    notifyListeners();
  }
}
