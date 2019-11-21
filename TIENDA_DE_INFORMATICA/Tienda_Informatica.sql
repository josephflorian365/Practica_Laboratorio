-- 1.1.3 Consultas sobre una tabla
-- 1 Lista el nombre de todos los productos que hay en la tabla producto}
SELECT NOMBRE FROM PRODUCTO;

-- 2 Lista los nombres y los precios de todos los productos de la tabla producto
SELECT NOMBRE,PRECIO FROM PRODUCTO;

-- 3 Lista todas las columnas de la tabla producto
SELECT * FROM PRODUCTO;

-- 4 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT NOMBRE, PRECIO, ROUND(PRECIO * 1.11,2) FROM PRODUCTO;

-- 5 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT NOMBRE, PRECIO AS EUROS, ROUND(PRECIO * 1.11,2) AS DÓLARES FROM PRODUCTO;

-- 6 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(NOMBRE), PRECIO FROM PRODUCTO;

-- 7 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(NOMBRE), PRECIO FROM PRODUCTO;

-- 8 Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT NOMBRE, UPPER(LEFT(NOMBRE,2)) FROM FABRICANTE;

-- 9 Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT NOMBRE, ROUND(PRECIO, 0) FROM PRODUCTO;

-- 10 Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT NOMBRE, ROUND(PRECIO) FROM PRODUCTO;

-- 11 Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT CODIGO_FABRICANTE FROM PRODUCTO;

-- 12 Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT(CODIGO_FABRICANTE) FROM PRODUCTO;

-- 13 Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT * FROM FABRICANTE ORDER BY NOMBRE ASC;

-- 14 Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT * FROM FABRICANTE ORDER BY NOMBRE DESC;

-- 15 Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente
SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY NOMBRE ASC, PRECIO DESC;

-- 16 Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM FABRICANTE limit 5;

-- 17 Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM FABRICANTE where codigo >= 4 LIMIT 2;

-- 18 Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO ASC  LIMIT 1;

-- 19 Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT NOMBRE, PRECIO FROM PRODUCTO ORDER BY PRECIO DESC  LIMIT 1;

-- 20 Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT NOMBRE FROM PRODUCTO WHERE  CODIGO_FABRICANTE = 2;

-- 21 Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO <= 120;

-- 22 Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO >= 400;

-- 23 Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO <= 400;

-- 24 Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO >=80 AND PRECIO <=300;

-- 25 Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO BETWEEN 60 AND 200;

-- 26 Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT NOMBRE FROM PRODUCTO WHERE PRECIO > 200 AND CODIGO_FABRICANTE = 6;

-- 27 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN
SELECT NOMBRE FROM PRODUCTO WHERE CODIGO_FABRICANTE LIKE '1' OR CODIGO_FABRICANTE LIKE '3' OR CODIGO_FABRICANTE LIKE '5';

-- 28 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT NOMBRE FROM PRODUCTO WHERE CODIGO_FABRICANTE IN (1,3,5);

-- 29 Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT NOMBRE, (PRECIO * 100) AS PRECIO, ROUND(PRECIO * 3.74,2) AS CÉNTIMOS FROM PRODUCTO;

-- 30 Lista los nombres de los fabricantes cuyo nombre empiece por la letra S
SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE 'S%';

-- 31 Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE '%e';

-- 32 Lista los nombres de los fabricantes cuyo nombre contenga el carácter w
SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE '%w%';

-- 33 Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT NOMBRE FROM FABRICANTE WHERE NOMBRE LIKE '____';

-- 34 Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT NOMBRE FROM PRODUCTO WHERE NOMBRE LIKE '%Portátil%';

-- 35 Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT NOMBRE FROM PRODUCTO WHERE NOMBRE LIKE '%Monitor%' AND PRECIO < 215;

-- 36 Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT NOMBRE, PRECIO FROM PRODUCTO WHERE PRECIO >=180 ORDER BY PRECIO DESC, NOMBRE ASC;


-- 1.1.4 Consultas multitabla (Composición interna)
-- 1 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO, 
PRODUCTO.PRECIO, 
FABRICANTE.NOMBRE AS FABRICANTE  
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;

-- 2 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO, 
PRODUCTO.PRECIO, 
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
ORDER BY FABRICANTE.NOMBRE ASC;

-- 3 Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT
PRODUCTO.CODIGO AS CODPROD,
PRODUCTO.NOMBRE AS NOMPROD,
FABRICANTE.CODIGO AS CODFAB,
FABRICANTE.NOMBRE AS NOMFAB
FROM PRODUCTO
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;

-- 4 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO, 
PRODUCTO.PRECIO, 
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
ORDER BY PRODUCTO.PRECIO ASC LIMIT 1;

-- 5 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO, 
PRODUCTO.PRECIO, 
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
ORDER BY PRODUCTO.PRECIO DESC LIMIT 1;

-- 6 Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE  = "Lenovo";

-- 7 Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
PRODUCTO.PRECIO AS PRECIO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Crucial" AND PRODUCTO.PRECIO > 200 ;

-- 8 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy, Seagate. Sin utilizar el operador IN.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
PRODUCTO.PRECIO AS PRECIO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE LIKE "Asus" OR FABRICANTE.NOMBRE LIKE "Hewlett-Packard" OR FABRICANTE.NOMBRE LIKE "Seagate";

-- 9 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
PRODUCTO.PRECIO AS PRECIO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE IN ("Asus","Hewlett-Packard","Seagate");

-- 10 Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
PRODUCTO.PRECIO AS PRECIO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE LIKE "%e";

-- 11 Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
PRODUCTO.PRECIO AS PRECIO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE LIKE "%w%";

-- 12 Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el 
-- resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
PRODUCTO.PRECIO AS PRECIO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 180
ORDER BY PRODUCTO.PRECIO DESC, PRODUCTO.NOMBRE ASC;

-- 13 Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT 
DISTINCT(FABRICANTE.CODIGO),
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;

-- 1.1.5 Consultas multitabla (Composición externa)
-- 1 Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. 
-- El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT 
FABRICANTE.NOMBRE AS FABRICANTE, 
PRODUCTO.NOMBRE AS PRODUCTO 
FROM FABRICANTE 
LEFT JOIN 
PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE;


-- 2 Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT 
FABRICANTE.NOMBRE AS FABRICANTE, 
PRODUCTO.NOMBRE AS PRODUCTO 
FROM FABRICANTE 
LEFT JOIN 
PRODUCTO ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
WHERE PRODUCTO.NOMBRE IS NULL;

-- 3 ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
-- No, porque para poder agregar un producto se necesita un fabricante de por medio debido a las relaciones, ya que Producto obtiende datos de Fabricante
-- para que este pueda tener registros. Ademas el campo donde se relacionan las dos tablas no puede quedar en NULL, que seria en este caso el Codigo_Fabricante
-- de Producto.

-- 1.1.6 Consultas resumen
-- 1 Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(NOMBRE) FROM PRODUCTO;

-- 2 Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(NOMBRE) FROM FABRICANTE;

-- 3 Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos
SELECT COUNT(DISTINCT(CODIGO_FABRICANTE)) AS TOTAL FROM PRODUCTO;

-- 4 Calcula la media del precio de todos los productos.
SELECT PRECIO,ROUND(PRECIO /2,2) AS PROMEDIO FROM PRODUCTO;

-- 5 Calcula el precio más barato de todos los productos.
SELECT PRECIO FROM PRODUCTO  ORDER BY PRECIO ASC LIMIT 1;

-- 6 Calcula el precio más caro de todos los productos.
SELECT PRECIO FROM PRODUCTO  ORDER BY PRECIO DESC LIMIT 1;

-- 7 Lista el nombre y el precio del producto más barato.
SELECT NOMBRE,PRECIO FROM PRODUCTO  ORDER BY PRECIO ASC LIMIT 1;

-- 8 Lista el nombre y el precio del producto más caro.
SELECT NOMBRE,PRECIO FROM PRODUCTO  ORDER BY PRECIO DESC LIMIT 1;

-- 9 Calcula la suma de los precios de todos los productos.
SELECT SUM(PRECIO) AS SUMA FROM PRODUCTO;

-- 10 Calcula el número de productos que tiene el fabricante Asus.
SELECT 
COUNT(PRODUCTO.PRECIO) AS SUMA
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus";

-- 11 Calcula la media del precio de todos los productos del fabricante Asus.
SELECT 
PRODUCTO.PRECIO,
(PRODUCTO.PRECIO / 2) AS MEDIA
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus";

-- 12 Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT 
PRODUCTO.PRECIO
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus" ORDER BY PRODUCTO.PRECIO ASC LIMIT 1;

-- 13 Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT 
PRODUCTO.PRECIO
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus" ORDER BY PRODUCTO.PRECIO DESC LIMIT 1;

-- 14 Calcula la suma de todos los productos del fabricante Asus.
SELECT 
SUM(PRODUCTO.PRECIO) AS SUMA
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Asus" ;

-- 15 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT 
MAX(PRODUCTO.PRECIO) AS MAXIMO,
MIN(PRODUCTO.PRECIO) AS MINIMO ,
SUM(PRODUCTO.PRECIO /2) AS MEDIO,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Crucial";

-- 16 Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. 
-- El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT 
FABRICANTE.NOMBRE,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM FABRICANTE
LEFT JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
GROUP BY FABRICANTE.CODIGO DESC;

-- 17 Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT 
FABRICANTE.NOMBRE AS FABRICANTE,
MAX(PRODUCTO.PRECIO) AS MAXIMO,
MIN(PRODUCTO.PRECIO) AS MINIMO ,
SUM(PRODUCTO.PRECIO /2) AS MEDIO,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
GROUP BY FABRICANTE.CODIGO;

-- 18 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
SELECT 
FABRICANTE.CODIGO AS FABRICANTE,
MAX(PRODUCTO.PRECIO) AS MAXIMO,
MIN(PRODUCTO.PRECIO) AS MINIMO ,
SUM(PRODUCTO.PRECIO /2) AS MEDIO,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 200
GROUP BY FABRICANTE.CODIGO;

-- 19 Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT 
FABRICANTE.NOMBRE AS FABRICANTE,
MAX(PRODUCTO.PRECIO) AS MAXIMO,
MIN(PRODUCTO.PRECIO) AS MINIMO ,
SUM(PRODUCTO.PRECIO /2) AS MEDIO,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 200
GROUP BY FABRICANTE.CODIGO;

-- 20 Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT 
COUNT(PRODUCTO.NOMBRE)
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 180;

-- 21 Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT 
FABRICANTE.NOMBRE,
COUNT(PRODUCTO.NOMBRE)
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 180
GROUP BY FABRICANTE.CODIGO;

-- 22 Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
SELECT
FABRICANTE.CODIGO,
(PRODUCTO.PRECIO /2) AS MEDIA
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;

-- 23 Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT
FABRICANTE.NOMBRE,
(PRODUCTO.PRECIO /2) AS MEDIA
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;

-- 24 Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT
FABRICANTE.NOMBRE
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 150;

-- 25 Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT
FABRICANTE.NOMBRE,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.CODIGO IN (1,2,3,6)
GROUP BY FABRICANTE.CODIGO;

-- 26 Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
-- No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT 
FABRICANTE.NOMBRE AS FABRICANTE,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM PRODUCTO
INNER JOIN FABRICANTE
ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 220
GROUP BY FABRICANTE.CODIGO;

-- 27 Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
-- El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

SELECT 
FABRICANTE.NOMBRE AS FABRICANTE,
(COUNT(PRODUCTO.NOMBRE)) AS TOTAL
FROM FABRICANTE
LEFT JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
WHERE PRODUCTO.PRECIO >= 220 OR PRODUCTO.NOMBRE IS NULL
GROUP BY FABRICANTE.CODIGO;