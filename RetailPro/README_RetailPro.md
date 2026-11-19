# RetailPro — Proyecto de análisis de datos

## Descripción

RetailPro es un proyecto práctico de análisis de datos desarrollado con el objetivo de analizar las ventas de una empresa distribuidora de tecnología. A través de SQL Server se organizan y consultan datos de clientes, productos, categorías y ventas para obtener información que permita identificar oportunidades comerciales y mejorar la toma de decisiones.

base utilizada en los ejercicios SQL se denomina `Ventas_Tech_DB`.

## Objetivos
- Organizar la información comercial en una base de datos relacional.
- Obtener métricas de ventas mediante consultas SQL.
- Relacionar ventas con clientes, productos y categorías.
- Preparar información para su posterior análisis y visualización.

## Herramientas
| Herramienta | Uso |
|---|---|
| SQL Server | Motor de base de datos. |
| SQL Server Management Studio (SSMS) | Entorno para ejecutar y validar consultas T-SQL. |
| GitHub | Almacenamiento y control de versiones de los scripts. |
| Power BI y Power Query | Herramientas previstas para transformar, modelar y visualizar los datos. |

## Estructura del repositorio
```text
ventas-tech-db/
├── ventas_tech_db.sql
└── RetailPro/
    ├── m4_consultas_negocio.sql
    └── m5_consultas_joins.sql
```

## Scripts

### `ventas_tech_db.sql`
Script principal para crear y preparar la base de datos. Debe ejecutarse antes de las consultas de los módulos posteriores.

### `RetailPro/m4_consultas_negocio.sql`
El módulo M4 contiene cuatro consultas SQL orientadas al análisis comercial: resumen ejecutivo mensual, ranking de productos, identificación de clientes recurrentes y comparación de la facturación de productos respecto del promedio.


### `RetailPro/m5_consultas_joins.sql`
El módulo M5 contiene cuatro consultas que permiten relacionar diferentes tablas mediante INNER JOIN, LEFT JOIN y UNION ALL, facilitando el análisis de ventas, clientes, productos y canales comerciales.

## Cómo ejecutar los scripts
Para ejecutar el proyecto correctamente, primero se debe abrir SQL Server Management Studio y conectarse a la instancia correspondiente. Luego se debe ejecutar el script principal ventas_tech_db.sql, que prepara la base de datos. Una vez creada la base Ventas_Tech_DB, se debe seleccionar esa base antes de ejecutar las consultas de M4. Finalmente, se puede ejecutar el archivo M5, que incluye la instrucción USE Ventas_Tech_DB para seleccionar la base de datos correspondiente.

Los archivos están escritos para SQL Server y utilizan sintaxis T-SQL. Las consultas M4 y M5 dependen de que la base y sus tablas estén creadas previamente.

## Consideraciones
- La consulta base de M5 utiliza `INNER JOIN`, por lo que devuelve registros con coincidencias en las tablas relacionadas.
- Las consultas de clientes y productos sin ventas utilizan `LEFT JOIN` y una condición `IS NULL`.
- El importe de cada venta se calcula como `cantidad * precio_unitario`.
- En M4, la consulta mensual agrupa por número de mes. Si se incorporan datos de varios años, conviene incluir también el año en la agrupación para no combinar meses de años distintos.
- Antes de tomar decisiones, se deben validar los resultados y el período que abarca cada consulta.

