import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/pedido.dart';
import 'models/producto.dart';
import 'view_models/pedido_view_model.dart';
import 'view_models/productos_view_model.dart';
import 'views/home_view.dart';
import 'views/resumen_pedido_view.dart';

/// Punto de entrada de la aplicación
void main() {
  runApp(const BarApp());
}

/// Widget principal de la aplicación del bar
/// Configura los Providers y la navegación entre pantallas
class BarApp extends StatelessWidget {
  const BarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Proveedores de estado global para la app
      providers: [
        // Provider para manejar la lista de pedidos
        ChangeNotifierProvider(create: (_) => PedidoViewModel()),
        // Provider para manejar los productos disponibles y su selección
        ChangeNotifierProvider(create: (_) => ProductosViewModel()),
      ],

      // MaterialApp configura tema, rutas y título de la app
      child: MaterialApp(
        title: 'App Bar Accesible',

        // Tema general de la aplicación
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 16),
          ),
        ),

        // Ruta inicial
        initialRoute: '/',

        // Rutas de navegación nombradas
        routes: {
          '/': (_) => HomeView(),                 // Pantalla principal con lista de pedidos
          '/resumen': (_) => const ResumenPedidoView(), // Pantalla de resumen de pedido
        },
      ),
    );
  }
}
