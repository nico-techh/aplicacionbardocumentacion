#  App de Gestión de Pedidos para Bar

Aplicación móvil desarrollada en **Flutter** para la gestión sencilla de pedidos en un bar.  
Permite crear, visualizar y administrar pedidos de forma rápida e intuitiva desde una interfaz clara y moderna.

---

##  Descripción

Esta aplicación está pensada para facilitar la toma de pedidos en un bar o cafetería.  
Desde la pantalla principal se puede visualizar la lista de pedidos existentes y añadir nuevos pedidos mediante un botón flotante, manteniendo el estado de la aplicación de forma reactiva gracias a **Provider**.

El proyecto sigue una estructura clara basada en el patrón **MVVM (Model–View–ViewModel)**, lo que facilita su mantenimiento y escalabilidad.

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
