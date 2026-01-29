import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/pedido.dart';
import 'models/producto.dart';
import 'view_models/pedido_view_model.dart';
import 'view_models/productos_view_model.dart';
import 'views/home_view.dart';
import 'views/resumen_pedido_view.dart';

void main() {
  runApp(const BarApp());
}

class BarApp extends StatelessWidget {
  const BarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PedidoViewModel()),
        ChangeNotifierProvider(create: (_) => ProductosViewModel()),
      ],
      child: MaterialApp(
        title: 'App Bar Accesible',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 16),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => HomeView(),
          '/resumen': (_) => const ResumenPedidoView(),
        },
      ),
    );
  }
}
