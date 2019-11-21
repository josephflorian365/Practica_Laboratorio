DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);




use tienda;
/*Consultas sobre una tabla*/

/*1 Lista el nombre de todos los productos que hay en la tabla producto*/
select nombre from producto;

/*2 Lista los nombres y los precios de todos los productos de la tabla producto.*/
select nombre, precio from producto;

/*3 Lista todas las columnas de la tabla producto.*/
SELECT precio, round(precio*1.11,2) as precioD from producto;

/*4 Lista el nombre de los productos, el precio en euros y el precio en d�lares estadounidenses (USD).*/
SELECT nombre,precio , round(precio*1.11,2) as dolares from producto;

/*5 Lista el nombre de los productos, el precio en euros y el precio en d�lares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, d�lares.*/
SELECT nombre as 'nombre de producto',precio as euros, round(precio*1.11,2) as dolares from producto;

/*6 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a may�scula.*/
select upper(nombre) from producto;

/*7 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a min�scula.*/
select lower(nombre) from producto;

/*8 Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en may�sculas los dos primeros caracteres del nombre del fabricante.*/
select nombre, left(upper(nombre),2) from fabricante;

/*9 Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.*/
select nombre as 'nombre', round(precio,1) as 'precio'from producto;

/*10 Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.*/
select nombre as 'nombre', round(precio) as 'precio'from producto;

/*11 Lista el c�digo de los fabricantes que tienen productos en la tabla producto.*/
select codigo_fabricante from producto;

/*12 Lista el c�digo de los fabricantes que tienen productos en la tabla producto, eliminando los c�digos que aparecen repetidos.*/
select distinct codigo_fabricante from producto;

/*13 Lista los nombres de los fabricantes ordenados de forma ascendente.*/
select nombre from fabricante order by nombre asc;

/*14 Lista los nombres de los fabricantes ordenados de forma descendente.*/
select nombre from fabricante order by nombre desc;

/*15 Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.	*/
select nombre,precio from producto order by nombre asc, precio desc;

/*16 Devuelve una lista con las 5 primeras filas de la tabla fabricante.*/
select * from fabricante order by codigo limit 5 ;

/*17 Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila tambi�n se debe incluir en la respuesta.*/
select * from fabricante order by codigo asc limit 3,6;

/*18 Lista el nombre y el precio del producto m�s barato. (Utilice solamente las cl�usulas ORDER BY y LIMIT*/
select nombre, precio from producto order by precio limit 100;

/*19 Lista el nombre y el precio del producto m�s caro. (Utilice solamente las cl�usulas ORDER BY y LIMIT)*/
select nombre, precio from producto order by precio desc limit 100;

/*20 Lista el nombre de todos los productos del fabricante cuyo c�digo de fabricante es igual a 2.*/
select codigo_fabricante, nombre from producto where codigo_fabricante = 2;

/*21 Lista el nombre de los productos que tienen un precio menor o igual a 120�.*/
select nombre, precio
from producto
where precio<=120;

/*Lista el nombre de los productos que tienen un precio mayor o igual a 400�.*/
select nombre, precio
from producto
where precio>=400;
 
 /*23 Lista el nombre de los productos que no tienen un precio mayor o igual a 400�.*/
select nombre, precio
from producto
where precio<400;

/*24 Lista todos los productos que tengan un precio entre 80� y 300�. Sin utilizar el operador BETWEEN*/
select nombre, precio
from producto
where precio>80 and precio<300;

/*25 Lista todos los productos que tengan un precio entre 60� y 200�. Utilizando el operador BETWEEN.*/
select nombre, precio 
from producto 
where precio between 60 and 200;

/*26 Lista todos los productos que tengan un precio mayor que 200� y que el c�digo de fabricante sea igual a 6.*/
select codigo_fabricante, nombre, precio 
from producto 
where codigo_fabricante = 2 and precio > 200;

 /*27 Lista todos los productos donde el c�digo de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.*/
 select * from producto 
 where codigo % 2 != 0
 order by codigo limit 0,3;
 
 /*28 Lista todos los productos donde el c�digo de fabricante sea 1, 3 o 5. Utilizando el operador IN*/
 select * from producto
 where codigo in(1,5,3);
 
 /*29 Lista el nombre y el precio de los productos en c�ntimos (Habr� que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame c�ntimos.*/
 select nombre, precio*100 as centimos 
 from producto;
 
 /*30 Lista los nombres de los fabricantes cuyo nombre empiece por la letra S*/
 select * from producto 
 where ;

/*31 Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.*/
 select * from fabricante
 where nombre like '%e';
 /* 32 Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.*/
 SELECT nombre FROM fabricante WHERE nombre LIKE "%w%";
 
/* 33 Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.*/
 select  nombre from fabricante
 where length(nombre)=4;

/* 34 Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.*/
 select nombre, precio  FROM PRODUCTO where   nombre LIKE "%Portatil%" ;

/* 35 Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.*/
 select * from producto
 where nombre like 'Monito%' and precio<215;
 
/* 36 Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).*/
 SELECT * FROM producto
WHERE precio >= 180
ORDER BY precio ASC, precio DESC;