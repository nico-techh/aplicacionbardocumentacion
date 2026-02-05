# Manual de Usuario — App Bar Accesible

<div style="page-break-after: always;"></div>

## Portada

**Producto:** App Bar Accesible (Flutter)  
**Versión:** 1.0  
**Fecha:** 05/02/2026  
**Desarrollado por:** Equipo del proyecto  
**Contacto (email):** contacto@ejemplo.com *(cámbialo por vuestro email real)*

> **¿Qué es esta app?**  
> Es una aplicación sencilla para **gestionar pedidos de un bar**: ver pedidos existentes, crear un pedido nuevo, seleccionar productos y ver el total.

<div style="page-break-after: always;"></div>

## Índice

- [1. Introducción](#1-introducción)  
- [2. Requisitos básicos](#2-requisitos-básicos)  
- [3. Pantalla principal: Pedidos](#3-pantalla-principal-pedidos)  
- [4. Crear un pedido](#4-crear-un-pedido)  
- [5. Seleccionar productos](#5-seleccionar-productos)  
- [6. Ver resumen del pedido](#6-ver-resumen-del-pedido)  
- [7. Preguntas frecuentes](#7-preguntas-frecuentes)  
- [8. Contacto y soporte](#8-contacto-y-soporte)

<div style="page-break-after: always;"></div>

## 1. Introducción

La **App Bar Accesible** está pensada para llevar el control de pedidos en un bar de forma simple.  
La app funciona por pantallas (vistas) y se navega con botones.

**Acciones principales que podrás hacer:**
- Ver la **lista de pedidos** (mesa + total).
- **Crear un pedido nuevo**.
- **Seleccionar productos** para un pedido.
- Ver un **resumen final** con el total en euros (€).
- Guardar o cancelar la creación de un pedido.

## 2. Requisitos básicos

Para usar la app, solo necesitas:
- Un móvil **Android** o **iPhone (iOS)**.
- Abrir la aplicación normalmente desde el icono.

> Nota: Esta versión es una app de ejemplo. Los pedidos iniciales vienen “precargados” y lo que guardes puede reiniciarse si se cierra la app (depende de cómo esté ejecutándose).

<div style="page-break-after: always;"></div>

## 3. Pantalla principal: Pedidos

Al abrir la app verás la pantalla **PEDIDOS**.

### Qué aparece en pantalla
- Un listado con tarjetas (cada tarjeta es un pedido):
  - **Nombre de la mesa** (por ejemplo “Mesa 1”).
  - **Número de productos** y **total en €**.

### Crear un pedido nuevo
- Pulsa el botón **➕ (más)** que aparece abajo a la derecha.
- Se abrirá la pantalla **Crear Pedido**.

> Consejo: Si no ves pedidos, puede ser porque aún no se ha añadido ninguno o porque la app se reinició.

## 4. Crear un pedido

En esta pantalla rellenas la información del pedido.

### Paso 1: Escribir la mesa
- En el campo **“Mesa / Nombre”**, escribe algo como:  
  - “Mesa 3”, “Mesa Terraza”, “Mesa 1”, etc.

### Paso 2: Seleccionar productos
- Pulsa **“Seleccionar productos”** para abrir la lista de productos.

### Resumen provisional
En la misma pantalla verás un texto con:
- Cantidad de productos seleccionados
- Total provisional (ej.: **Total: 10.50€**)

### Botones disponibles
- **Ver resumen**: te lleva a una pantalla con el detalle final del pedido.
- **Guardar pedido**: guarda el pedido y vuelve a la pantalla de pedidos.
- **Cancelar**: vuelve atrás sin guardar.

### Validaciones (mensajes de error)
Si intentas guardar y falta algo, la app te avisará:
- Si no escribes la mesa: **“Debes ingresar el nombre de la mesa”**
- Si no seleccionas productos: **“Debes seleccionar al menos un producto”**

<div style="page-break-after: always;"></div>

## 5. Seleccionar productos

Aquí aparece una lista de productos del bar (por ejemplo: Cerveza, Pizza, Hamburguesa…).

### Cómo seleccionar un producto
- Toca un producto para **seleccionarlo**.
- Cuando se selecciona, se marca internamente con cantidad 1.

### Cómo quitar un producto
Tienes dos formas:
- Tocar el mismo producto otra vez (lo deselecciona).
- Si aparece el icono **(−)** a la derecha, puedes tocarlo para quitarlo.

La app muestra mensajes rápidos (tipo notificación):
- “**X agregado**” cuando seleccionas.
- “**X removido**” cuando lo quitas.

### Confirmar o cancelar selección
Abajo a la derecha verás dos botones:
- **Cancelar**: vuelve sin aplicar cambios.
- **Confirmar**: vuelve y se guarda la selección para el pedido.

> Importante: En esta versión, la cantidad funciona como “seleccionado / no seleccionado” (0 o 1). No hay botón para poner 2, 3, etc.

## 6. Ver resumen del pedido

La pantalla **Resumen Final** muestra:
- El **nombre de la mesa**
- Una lista con cada producto:
  - **cantidad x precio** (ej.: “1 x 3.00€”)
- El **Total** final del pedido

Para volver, pulsa **“Volver”**.

---

## 7. Preguntas frecuentes

**1) No me deja guardar el pedido, ¿por qué?**  
Porque falta algo obligatorio:
- No escribiste la mesa, o
- No seleccionaste ningún producto.

**2) Seleccioné productos pero al volver no aparecen.**  
Asegúrate de pulsar **Confirmar** en la pantalla de productos. Si pulsas **Cancelar**, no se guarda la selección.

**3) ¿Cómo pongo más cantidad (por ejemplo 2 cervezas)?**  
En esta versión no se puede aumentar más de 1 unidad por producto. Solo permite seleccionar o quitar.

**4) ¿Puedo borrar un pedido ya creado?**  
No. La pantalla principal muestra pedidos, pero no incluye opción de eliminar.

**5) ¿Dónde se guardan los pedidos? ¿Se quedan para siempre?**  
Normalmente se guardan en memoria mientras la app está abierta. Si se cierra o reinicia, puede volver a los datos iniciales (depende del modo de ejecución).

**6) Veo pedidos de ejemplo al empezar, ¿es normal?**  
Sí. Hay pedidos iniciales de demostración (“Mesa 1”, “Mesa 2”) para probar la app.

**7) ¿Qué hago si la app se queda “bloqueada” o va lenta?**  
Prueba:
- Volver atrás con el botón “Volver” o el gesto de atrás.
- Cerrar la app y abrirla de nuevo.

<div style="page-break-after: always;"></div>

## 8. Contacto y soporte

Si necesitas ayuda con la app (errores, dudas, sugerencias), contacta con el equipo:

- **Email:** contacto@ejemplo.com *(cámbialo por vuestro email real)*
- **Asunto recomendado del correo:** “Soporte — App Bar Accesible”
- **Qué información enviar:**
  - Modelo del móvil (Android/iPhone)
  - Versión aproximada del sistema (si la sabes)
  - Qué estabas haciendo cuando ocurrió el problema
  - Captura de pantalla (si puedes)

**Horario de respuesta (ejemplo):** 24–48 horas lectivas.

---
**Fin del manual**
