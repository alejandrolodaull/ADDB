# Administración y Diseño de Bases de Datos: Triggers
- Mireia Marta Scholz Díaz (alu0100905144@ull.edu.com)
- Beatríz Gil González (bei.g.g.97@gmail.com)
- Alejandro Lorenzo Dávila (alu0100952100@ull.edu.es)

En este repositorio se incluyen los __modelos conceptuales__, __modelos lógicos__, scripts sql generados con la herramienta *MySQL Workbench*, así como los __scripts postgresql__ equivalentes, para los casos __vivero__ y __farmacia__ propuestos.

## ÍNDICE
1. __Farmacia__
Modelo conceptual
Modelo lógico
Triggers
2. __Viveros__
Modelo conceptual
Modelo lógico
Triggers

## 1. Farmacia
### Modelo conceptual
![mcfarmacia](/Farmacia/Imagenes/modelo_conceptual.png?raw=true)
### Modelo lógico
![mlfarmacia](/Farmacia/Imagenes/modelo_logico.png?raw=true)
### Triggers

## 2. Viveros
### Modelo conceptual
![mcvivero](/Viveros/Imagenes/modelo_conceptual.png?raw=true)
### Modelo lógico
![mlvivero](/Viveros/Imagenes/modelo_logico.png?raw=true)
### Triggers
(El código de los triggeres implementados se puede consultar en __/Viveros/Triggers__)  
Se han desarrollado 2 triggers que realmente deberían ser una única transacción:  
- El primero (__vender_producto__) comprueba que, antes de que un cliente compre un producto, haya stock suficiente. Además, añade la fecha y hora actual a la fila que se va a insertar (se insertará en la tabla cliente_producto).  
- El segundo (__actualizar_stock__) actualiza el stock (en la tabla producto) despues de que se haya registrado una compra (en cliente_producto)  
![ejecuciontriggervivero](/Viveros/Triggers/ejecucion.png?raw=true)

