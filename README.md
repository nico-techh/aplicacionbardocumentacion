#  App de Gestión de Pedidos para Bar

Aplicación móvil desarrollada en **Flutter** para la gestión sencilla de pedidos en un bar.  
Permite crear, visualizar y administrar pedidos de forma rápida e intuitiva desde una interfaz clara y moderna.

---

##  Descripción

Esta aplicación está pensada para facilitar la toma de pedidos en un bar o cafetería.  
Desde la pantalla principal se puede visualizar la lista de pedidos existentes y añadir nuevos pedidos mediante un botón flotante, manteniendo el estado de la aplicación de forma reactiva gracias a **Provider**.

El proyecto sigue una estructura clara basada en el patrón **MVVM (Model–View–ViewModel)**, lo que facilita su mantenimiento y escalabilidad.

<<<<<<< HEAD
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



# App Bar Accesible

## Descripción
Aplicación Flutter para gestionar pedidos en un bar. Permite crear pedidos, seleccionar productos, ver resúmenes y controlar el total de cada mesa.

## Tecnologías usadas
- Flutter 3.9
- Dart 3.9
- Provider para gestión de estado (MVVM)

## Características principales
- Lista de pedidos existentes en Home.
- Crear pedidos con nombre/mesa y selección de productos.
- Resumen provisional y resumen final de pedidos.
- Navegación imperativa y por rutas con nombre.
- Accesibilidad: Semantics, tooltips, contraste adecuado y tamaño de texto escalable.
=======
---

##  Tecnologías utilizadas

- **Flutter** – Framework principal para el desarrollo de la aplicación
- **Dart** – Lenguaje de programación
- **Provider** – Gestión de estado
- **Material Design** – Diseño de la interfaz de usuario

---

##  Características principales

- Visualización de una lista de pedidos
- Creación de nuevos pedidos mediante una pantalla dedicada
- Actualización automática de la interfaz al añadir pedidos
- Gestión del estado usando `Provider`
- Arquitectura basada en MVVM
- Interfaz sencilla e intuitiva con componentes Material

---

## Pantalla principal

La pantalla principal muestra:
- Un **AppBar** con el título *PEDIDOS*
- Un **FloatingActionButton** para crear nuevos pedidos
- Una **lista dinámica de pedidos**, renderizada mediante un widget personalizado (`PedidoCard`)

---

## Posibles mejoras futuras

- Edición y eliminación de pedidos
- Persistencia de datos (base de datos local o backend)
- Gestión de mesas y productos
- Control de estados del pedido (pendiente, servido, pagado)

---

## Autor

Pedro Nicolás MUñoz Moruzzi 2DAM
>>>>>>> e50d73f1819d33b3a92cb76418a1e8b0d963bc9d
