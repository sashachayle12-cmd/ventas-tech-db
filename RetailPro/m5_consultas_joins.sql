-- =====================================================
-- M5 - CONSULTAS CON JOINS
-- RetailPro
-- =====================================================

USE Ventas_Tech_DB;


-- =====================================================
-- CONSULTA 1: Vista base del proyecto (INNER JOIN)
-- Propósito: cruzar ventas con clientes, productos
-- y categorías para obtener una vista completa.
-- =====================================================

SELECT
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.email,
    c.ciudad,
    p.nombre_producto,
    cat.nombre_categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;

-- Hallazgo: las ventas quedan relacionadas con los datos
-- del cliente, producto y categoría, facilitando el análisis en Power BI.



-- =====================================================
-- CONSULTA 2: Clientes sin ventas (LEFT JOIN)
-- Propósito: detectar clientes registrados que nunca
-- realizaron una compra.
-- =====================================================

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;

-- Hallazgo: no aparecen clientes sin ventas; los 5 clientes
-- registrados tienen al menos una compra.



-- =====================================================
-- CONSULTA 3: Productos sin ventas (LEFT JOIN)
-- Propósito: detectar productos del catálogo que no
-- tienen ninguna venta registrada.
-- =====================================================

SELECT
    p.nombre_producto,
    cat.nombre_categoria,
    p.precio
FROM productos p
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
WHERE v.id_producto IS NULL;

-- Hallazgo: no aparecen productos sin ventas; los 6 productos
-- del catálogo tienen al menos una venta registrada.



-- =====================================================
-- CONSULTA 4: Consolidado por canal (UNION ALL)
-- Propósito: crear dos canales dentro de la consulta y
-- calcular el total de ventas de cada uno.
-- =====================================================

SELECT
    canal,
    SUM(total) AS total_canal
FROM
(
    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Online' AS canal
    FROM ventas
    WHERE fecha_venta <= '2024-03-10'

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Presencial' AS canal
    FROM ventas
    WHERE fecha_venta > '2024-03-10'
) AS consolidado
GROUP BY canal;

-- Hallazgo: el canal Online concentra las ventas realizadas
-- hasta el 10/03, mientras que Presencial reúne las ventas posteriores.