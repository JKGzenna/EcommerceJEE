
-- JUAN LUIS GOLDARACENA -- 

-- CREAMOS NUESTRO ESQUEMA DE BASE DE DATOS --


CREATE DATABASE ecommerce_bbdd;


----------------------------------------------------------



-- EJECUTAR ESTO ANTES DE COMENZAR CON LAS TABLAS INDICES,AUTO-INCREMENTS, 
-- FILTROS Y PROCEDIMIENTOS Y SEGUIR ESTE SCRIPT EN EL ORDEN DE LOS COMENTARIOS


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


----------------------------------------------------------


--------------------------------
--                            --
-- METER LAS TABLAS DE 1 EN 1 --
--                            --
--------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoriasuperior`
--

CREATE TABLE `tbl_categoriasuperior` (
  `codigo` INT(11) NOT NULL,
  `nombre` VARCHAR(30) DEFAULT NULL,
  `visible` TINYINT(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_categoriasuperior`
--

INSERT INTO `tbl_categoriasuperior` (`codigo`, `nombre`, `visible`) VALUES
(1, 'ROPA DEPORTIVA', 1),
(2, 'CALZADO DEPORTIVO', 1),
(3, 'ACCESORIOS DEPORTIVOS', 1),
(4, 'GOLF', 1);


----------------------------------------------------------


--
-- Estructura de tabla para la tabla `tbl_subcategoria`   
--

-- antigua tabla tbl_categoria que se ha partido en 2 
-- tablas y que ahora referencia a tbl_categoriasuperior`

CREATE TABLE `tbl_subcategoria` (
  `codigo` INT(11) NOT NULL,
  `nombre` VARCHAR(30) DEFAULT NULL,
  `visible` TINYINT(1) DEFAULT '1',
  `categoria_superior` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_subcategoria`
--

INSERT INTO `tbl_subcategoria` (`codigo`, `nombre`, `visible`, `categoria_superior`) VALUES
(1, 'PANTALONES', 1, 1),
(2, 'CAMISETAS', 1, 1),
(3, 'CHAQUETAS', 1, 1),
(4, 'RUNNING', 1, 2),
(5, 'FUTBOL', 1, 2);


----------------------------------------------------------


--
-- Estructura de tabla para la tabla `tbl_marca`
--

CREATE TABLE `tbl_marca` (
  `codigo` INT(11) NOT NULL,
  `nombre` VARCHAR(30) DEFAULT NULL,
  `visible` TINYINT(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_marca`
--

INSERT INTO `tbl_marca` (`codigo`, `nombre`, `visible`) VALUES
(1, 'NIKE', 1),
(2, 'ADIDAS', 1),
(3, 'PUMA', 1),
(4, 'LACOSTE', 1);


----------------------------------------------------------


--
-- Estructura de tabla para la tabla `tbl_producto`
--

CREATE TABLE `tbl_producto` (
  `webid` INT(11) NOT NULL,
  `nombre` VARCHAR(30) DEFAULT NULL,
  `precio` DECIMAL(10,2) DEFAULT NULL,
  `precionuevo` DECIMAL(10,2) DEFAULT NULL,
  `stock` INT(11) DEFAULT '1',
  `nuevo` TINYINT(1) DEFAULT '1',
  `recomendado` TINYINT(1) DEFAULT '0',
  `descripcion` VARCHAR(255) DEFAULT NULL,
  `visible` TINYINT(1) DEFAULT '1',
  `codigo_marca` INT(11) DEFAULT NULL,
  `codigo_categoriasuperior` INT(11) DEFAULT NULL,
  `codigo_subcategoria` INT(11) DEFAULT NULL,
  `img` VARCHAR(100) DEFAULT 'demo.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_marca`
--

INSERT INTO `tbl_producto` (`webid`, `nombre`, `precio`, `precionuevo`, `stock`, `nuevo`, `recomendado`, `descripcion`, `visible`, `codigo_marca`, `codigo_categoriasuperior`, `codigo_subcategoria`, `img`) VALUES
(19, 'Camiseta Lacoste', '50.00', '0.00', 3, 1, 1, 'ok', 1, 4, 1, 2, '031220170918349174380623748002485pro2.jpg'),
(20, 'Camiseta NIKE', '40.00', '0.00', 10, 1, 1, 'ok', 1, 1, 1, 2, '03122017091925-9034475482333864461pro4.jpg'),
(21, 'Camibuso Puma', '40.00', '0.00', 10, 1, 1, 'ok', 1, 3, 2, 5, '031220170920071104875221893254990pro5.jpg'),
(22, 'Buso deportivo', '10.00', '0.00', 10, 1, 1, 'ok', 1, 2, 2, 4, '031220170920474898636889312983034pu.jpg'),
(23, 'Buso Puma', '10.00', '5.00', 4, 1, 1, 'ok', 1, 2, 1, 3, '031220170923523216042265355294102pu5.jpg');


-- --------------------------------------------------------


--
-- Estructura de tabla para la tabla `tbl_producto_moneda`
--

CREATE TABLE `tbl_producto_moneda` (
  `moneda` CHAR(3) NOT NULL,
  `precio` DECIMAL(10,2) DEFAULT NULL,
  `precionuevo` DECIMAL(10,2) DEFAULT NULL,
  `webid` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 
--
-- Volcado de datos para la tabla `tbl_producto_moneda`
--

INSERT INTO `tbl_producto_moneda` (`moneda`, `precio`, `precionuevo`, `webid`) VALUES
('LIB', '90.00', '0.00', 19),
('LIB', '800.00', '0.00', 20),
('LIB', '80.00', '0.00', 21),
('LIB', '10.00', '0.00', 22),
('LIB', '10.00', '5.00', 23),
('USD', '20.00', '0.00', 19),
('USD', '70.00', '0.00', 20),
('USD', '70.00', '0.00', 21),
('USD', '50.00', '0.00', 22),
('USD', '50.00', '25.00', 23);


---------------------------------------------------------


---------------------------------------------------
--                                               --
-- INDICES PARA LAS TABLAS -- EJECUTAR DE 1 EN 1 --
--                                               --
---------------------------------------------------

--
-- Indices de la tabla `tbl_categoriasuperior`
--
ALTER TABLE `tbl_categoriasuperior`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`);
  
  
--
-- Indices de la tabla `tbl_subcategoria`
--
ALTER TABLE `tbl_subcategoria`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `categoria_superior` (`categoria_superior`);
  

--
-- Indices de la tabla `tbl_marca`
--
ALTER TABLE `tbl_marca`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`);

  
--
-- Indices de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD PRIMARY KEY (`webid`),
  ADD KEY `codigo_marca` (`codigo_marca`),
  ADD KEY `codigo_categoriasuperior` (`codigo_categoriasuperior`),
  ADD KEY `codigo_subcategoria` (`codigo_subcategoria`);

  
--
-- Indices de la tabla `tbl_producto_moneda`
--
ALTER TABLE `tbl_producto_moneda`
  ADD PRIMARY KEY (`moneda`,`webid`),
  ADD KEY `webid` (`webid`);


---------------------------------------------------------


--------------------------------------------------------------------
--                                                                --
-- AUTO_INCREMENT de las tablas volcadas -- EJECUTARLOS DE 1 EN 1 --
--                                                                --
--------------------------------------------------------------------

--
-- AUTO_INCREMENT de la tabla `tbl_categoriasuperior`
--
ALTER TABLE `tbl_categoriasuperior`
  MODIFY `codigo` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

  
  --
-- AUTO_INCREMENT de la tabla `tbl_subcategoria`
--
ALTER TABLE `tbl_subcategoria`
  MODIFY `codigo` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
  
  
--
-- AUTO_INCREMENT de la tabla `tbl_marca`
--
ALTER TABLE `tbl_marca`
  MODIFY `codigo` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
  
  
--
-- AUTO_INCREMENT de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  MODIFY `webid` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
  
  
---------------------------------------------------------


-----------------------------------
--                               --
-- FILTROS -- EJECUTAR DE 1 EN 1 --
--                               --
-----------------------------------

--
-- Filtros para la tabla `tbl_subcategoria`
--
ALTER TABLE `tbl_subcategoria`
  ADD CONSTRAINT `tbl_subcategoria_ibfk_1` FOREIGN KEY (`categoria_superior`) REFERENCES `tbl_categoriasuperior` (`codigo`);

  
--
-- Filtros para la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD CONSTRAINT `tbl_producto_ibfk_1` FOREIGN KEY (`codigo_marca`) REFERENCES `tbl_marca` (`codigo`),
  ADD CONSTRAINT `tbl_producto_ibfk_2` FOREIGN KEY (`codigo_categoriasuperior`) REFERENCES `tbl_categoriasuperior` (`codigo`),
  ADD CONSTRAINT `tbl_producto_ibfk_3` FOREIGN KEY (`codigo_subcategoria`) REFERENCES `tbl_subcategoria` (`codigo`);

--
-- Filtros para la tabla `tbl_producto_moneda`
--
ALTER TABLE `tbl_producto_moneda`
  ADD CONSTRAINT `tbl_producto_moneda_ibfk_1` FOREIGN KEY (`webid`) REFERENCES `tbl_producto` (`webid`);



---------------------------------------------------------


-------------------------------------------------------------------------------------------------
--                                                                                             --
--               PROCEDIMIENTOS ALMACENADOS - STORED PROCEDURES (SP, PA, PL...)                --
--                                                                                             --
--             EJECUTARLOS TODOS JUNTOS DESDE EL DELIMITER $$ HASTA EL DELIMITER;              --
--                                                                                             --
-------------------------------------------------------------------------------------------------


DELIMITER $$


-- PROCEDIMIENTOS DE CategoriaDao --

-- NOMBRE EN EL DAO -- listarCategoriaSuperior --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarCategoriaSuperior` ()  
BEGIN
    SELECT codigo,nombre FROM tbl_categoriasuperior
    WHERE visible=TRUE;
END$$


-- NOMBRE EN EL DAO -- listarSubCategorias --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarSubCategoria` (`p_csuperior` INT)  
BEGIN
    SELECT codigo,nombre FROM tbl_subcategoria
    WHERE visible=true AND categoria_superior=p_csuperior;
END$$


CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarTodasSubCategorias`
()
BEGIN
    SELECT codigo,nombre FROM tbl_subcategoria
    WHERE visible=true;
END$$


-- NOMBRE EN EL DAO -- listarTodoDeCategorias -- COMENTADO EN  EL DAO --
-- LO COMENTO PORQUE SE USA PARA LISTAR TODAS LAS CATEGORIAS Y SUBCATEGORIAS MEZCLADA 
-- A LA HORA DE REGISTRAR UN PRODUCTO Y PREFIERO SEPARARLO EN CATEGORIAS Y SUBCATEGORIAS
-- CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listartododeCategoria` ()  
-- begin
--     select * from tbl_categoriasuperior,tbl_subcategoria where tbl_categoriasuperior.visible=tbl_subcategoria.visible;
-- end$$


-- NOMBRE EN EL DAO -- esSuperior --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_contarSubCategorias` (`codcat` INT)  
BEGIN
    SELECT COUNT(*) AS cantidad FROM tbl_subcategoria
    WHERE categoria_superior=codcat;
END$$


-- NOMBRE EN EL DAO -- registrarCategoriaSuperior --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrarCategoriaSuperior`
(`m_nombre` VARCHAR(30), `m_visible` BOOLEAN)
BEGIN
    DECLARE m_codigo INT;
    INSERT INTO tbl_categoriasuperior VALUES(null,m_nombre,m_visible);
    SET m_codigo =(SELECT LAST_INSERT_ID());
END$$ 


-- NOMBRE EN EL DAO -- eliminarCategoriaSuperior --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarCategoriaSuperior`
(`m_nombre` VARCHAR(30))
BEGIN
    DELETE FROM tbl_categoriasuperior WHERE nombre=(m_nombre);
END$$ 


-- NOMBRE EN EL DAO -- registrarSubCategoria --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrarSubCategoria` 
(`m_nombre` VARCHAR(30), `m_visible` BOOLEAN, `m_categoria_superior` INT) 
BEGIN
    DECLARE m_codigo INT;
    INSERT INTO tbl_subcategoria VALUES(null,m_nombre,m_visible,m_categoria_superior);
    SET m_codigo = (SELECT LAST_INSERT_ID());
END$$


-- NOMBRE EN EL DAO -- eliminarSubCategoria --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarSubCategoria` 
(`m_nombre` VARCHAR(30), `m_visible` BOOLEAN, `m_categoria_superior` INT)
BEGIN
    DELETE FROM tbl_subcategoria 
          WHERE nombre=(m_nombre) 
            AND visible=(m_visible) 
            AND categoria_superior=(m_categoria_superior);
END$$ 


-- PROCEDIMIENTOS DE ProductoDao --

-- si no entra meter un null en subcategoria --
-- NOMBRE EN EL DAO -- registrarProducto -- RECIBE 18 PARAMETROS --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrarproducto` 
            (`p_nombre` VARCHAR(30), `p_precio` DECIMAL(10,2), `p_precionuevo` DECIMAL(10,2), 
             `p_stock` INT, `p_nuevo` BOOLEAN, `p_recomendado` BOOLEAN, `p_descripcion` TEXT, 
             `p_visible` BOOLEAN, `p_codigo_marca` INT, `p_codigo_categoriasuperior` INT, 
			 `p_codigo_subcategoria` INT, `p_img` VARCHAR(100), 
             `p_moneda_lib` CHAR(3), `p_precio_lib` DECIMAL(10,2), `p_precionuevo_lib` DECIMAL(10,2), 
             `p_moneda_usd` CHAR(3), `p_precio_usd` DECIMAL(10,2), `p_precionuevo_usd` DECIMAL(10,2))  
BEGIN
    DECLARE v_webid INT;
    INSERT INTO tbl_producto VALUES(null,p_nombre,p_precio,p_precionuevo,p_stock,p_nuevo,p_recomendado,
                                    p_descripcion,p_visible,p_codigo_marca,p_codigo_categoriasuperior,
									p_codigo_subcategoria,p_img
                                    );

    SET v_webid=(SELECT LAST_INSERT_ID());
    INSERT INTO tbl_producto_moneda VALUES(p_moneda_lib,p_precio_lib,p_precionuevo_lib,v_webid);
    INSERT INTO tbl_producto_moneda VALUES(p_moneda_usd,p_precio_usd,p_precionuevo_usd,v_webid);
END$$

-- PROBAMOS A REGISTRAR UN PRODUCTO DESDE BD CON ESTE PL --
-- call sp_registrarproducto('prueba4', '10.00', '8.00', 6, 1, 0, 'ok', 1, 1, 1, 3, '031220170923523216042265355294102prueba4.jpg', 'LIB', '90.00', '0.00', 'USD', '90.00', '0.00')


-- NOMBRE EN EL DAO -- listarProductosRecomendados -- 
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarRecomendados` (`p_moneda` CHAR(3))  
BEGIN
    if p_moneda<>'EUR' THEN
        SELECT p.*, m.precio AS precio2, m.precionuevo AS precion2 FROM tbl_producto p 
        INNER JOIN tbl_producto_moneda m ON m.webid=p.webid
        INNER JOIN tbl_marca mar ON mar.codigo=p.codigo_marca
        INNER JOIN tbl_categoriasuperior cs ON cs.codigo=p.codigo_categoriasuperior
        INNER JOIN tbl_subcategoria sc ON sc.codigo=p.codigo_subcategoria
        WHERE p.visible=TRUE AND p.recomendado=TRUE AND cs.visible=TRUE AND sc.visible=TRUE AND mar.visible=TRUE AND m.moneda=p_moneda;
    else
        SELECT p.* FROM tbl_producto p 
        INNER JOIN tbl_marca mar ON mar.codigo=p.codigo_marca
        INNER JOIN tbl_categoriasuperior cs ON cs.codigo=p.codigo_categoriasuperior
	INNER JOIN tbl_subcategoria sc ON sc.codigo=p.codigo_subcategoria
        WHERE p.visible=TRUE AND p.recomendado=TRUE AND cs.visible=TRUE AND sc.visible=TRUE AND mar.visible=TRUE;
    END IF;
END$$ 


-- ESTE ES EL PL sp_listarPorCategoria QUE EN EL DAO SE LLAMABA listarProductosPorCategoria Y QUE SE BIFURCA EN 
-- sp_listarPorCategoriaSuperior Y sp_listarPorSubCategoria ESCRITOS A CONTINUACI�N
-- CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarPorCategoria` (`p_moneda` CHAR(3), `cat` INT)  
-- begin
--     if p_moneda<>'EUR' then
--         select p.*, m.precio as precio2, m.precionuevo as precion2 from tbl_producto p 
--         inner join tbl_producto_moneda m on m.webid=p.webid
--         inner join tbl_marca mar on mar.codigo=p.codigo_marca
--         inner join tbl_categoria c on c.codigo=p.codigo_categoria
--         where p.visible=true and c.visible=true and mar.visible=true and m.moneda=p_moneda
--         and p.codigo_categoria=cat;
--     else
--         select p.* from tbl_producto p 
--         inner join tbl_marca mar on mar.codigo=p.codigo_marca
--         inner join tbl_categoria c on c.codigo=p.codigo_categoria
--         where p.visible=true and c.visible=true and mar.visible=true  and p.codigo_categoria=cat;
--     end if;
-- end$$


-- si no va poner otro INNER JOIN mas con la subcategoria --
-- NOMBRE EN EL DAO -- listarPorCategoriaSuperior -- NACE DE BIFURCAR sp_listarPorCategoria --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarPorCategoriaSuperior` (`p_moneda` CHAR(3), `catsup` INT)  
BEGIN
    IF p_moneda<>'EUR' THEN
        SELECT p.*, m.precio AS precio2, m.precionuevo AS precion2 FROM tbl_producto p 
        INNER JOIN tbl_producto_moneda m ON m.webid=p.webid
        INNER JOIN tbl_marca mar ON mar.codigo=p.codigo_marca
        INNER JOIN tbl_categoriasuperior cs ON cs.codigo=p.codigo_categoriasuperior
        WHERE p.visible=TRUE AND cs.visible=TRUE AND mar.visible=TRUE AND m.moneda=p_moneda AND p.codigo_categoriasuperior=catsup;
    ELSE
        select p.* FROM tbl_producto p 
        INNER JOIN tbl_marca mar ON mar.codigo=p.codigo_marca
        INNER JOIN tbl_categoriasuperior cs ON cs.codigo=p.codigo_categoriasuperior
        WHERE p.visible=TRUE AND cs.visible=TRUE AND mar.visible=TRUE  AND p.codigo_categoriasuperior=catsup;
    END IF;
END$$

-- si no va poner otro INNER JOIN mas con la categoria superior --
-- NOMBRE EN EL DAO -- listarPorSubCategoria -- NACE DE BIFURCAR sp_listarPorCategoria --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarPorSubCategoria` (`p_moneda` CHAR(3), `subcat` INT)  
BEGIN
    IF p_moneda<>'EUR' THEN
        SELECT p.*, m.precio AS precio2, m.precionuevo AS precion2 FROM tbl_producto p 
        INNER JOIN tbl_producto_moneda m ON m.webid=p.webid
        INNER JOIN tbl_marca mar ON mar.codigo=p.codigo_marca
        INNER JOIN tbl_subcategoria sc ON sc.codigo=p.codigo_subcategoria
        WHERE p.visible=TRUE AND sc.visible=TRUE AND mar.visible=TRUE AND m.moneda=p_moneda AND p.codigo_subcategoria=subcat;
    ELSE
        select p.* FROM tbl_producto p 
        INNER JOIN tbl_marca mar ON mar.codigo=p.codigo_marca
        INNER JOIN tbl_subcategoria sc ON sc.codigo=p.codigo_subcategoria
        WHERE p.visible=TRUE AND sc.visible=TRUE AND mar.visible=TRUE  AND p.codigo_subcategoria=subcat;
    END IF;
END$$


-- NOMBRE EN EL DAO -- listarProductosPorMarca --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarPorMarca` (`p_moneda` CHAR(3), `mar` INT)  
BEGIN
    IF p_moneda<>'EUR' THEN
        SELECT p.*, m.precio AS precio2, m.precionuevo AS precion2 FROM tbl_producto p 
        INNER JOIN tbl_producto_moneda m ON m.webid=p.webid
        INNER JOIN tbl_marca mar ON mar.codigo=p.codigo_marca
        INNER JOIN tbl_categoriasuperior cs ON cs.codigo=p.codigo_categoriasuperior
		INNER JOIN tbl_subcategoria sc ON sc.codigo=p.codigo_subcategoria
        where p.visible=TRUE AND cs.visible=TRUE AND sc.visible=TRUE AND mar.visible=TRUE AND m.moneda=p_moneda AND p.codigo_marca=mar;
    else
        SELECT p.* FROM tbl_producto p 
        INNER JOIN tbl_marca mar ON mar.codigo=p.codigo_marca
		INNER JOIN tbl_categoriasuperior cs ON cs.codigo=p.codigo_categoriasuperior
		INNER JOIN tbl_subcategoria sc ON sc.codigo=p.codigo_subcategoria
        where p.visible=TRUE AND cs.visible=TRUE AND sc.visible=TRUE AND mar.visible=TRUE  AND p.codigo_marca=mar;
    END IF;
END$$

-- COMPROBAR, DE MOMENTO CREO QUE ESTA EN DESUSO HASTA QUUE NO HAGAMOS EL BOTON DE CONSULTAR EN REGISTRAR PRODUCTO --
-- NOMBRE EN EL DAO -- consultarProducto -- 
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultarProducto` (`p_moneda` CHAR(3), `p_webid` INT)  
BEGIN
    IF p_moneda<>'EUR' THEN
        SELECT p.*, m.precio AS precio2, m.precionuevo AS precion2 FROM tbl_producto p 
        INNER JOIN tbl_producto_moneda m ON m.webid=p.webid
        INNER JOIN tbl_marca mar ON mar.codigo=p.codigo_marca
        INNER JOIN tbl_categoriasuperior cs ON cs.codigo=p.codigo_categoriasuperior
		INNER JOIN tbl_subcategoria sc ON sc.codigo=p.codigo_subcategoria
        WHERE p.visible=TRUE AND cs.visible=TRUE AND sc.visible=TRUE AND mar.visible=TRUE AND m.moneda=p_moneda AND p.webid=p_webid;
    ELSE
        select p.* FROM tbl_producto p 
        INNER JOIN tbl_marca mar ON mar.codigo=p.codigo_marca
        INNER JOIN tbl_categoriasuperior cs ON cs.codigo=p.codigo_categoriasuperior
		INNER JOIN tbl_subcategoria sc ON sc.codigo=p.codigo_subcategoria
        WHERE p.visible=TRUE AND cs.visible=TRUE AND sc.visible=TRUE AND mar.visible=TRUE  AND p.webid=p_webid;
    END IF;
END$$


-- PROCEDIMIENTOS DE MarcaDao --

-- NOMBRE EN EL DAO -- listarTodoDeMarcas --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listartododeMarca` ()  
BEGIN
    SELECT codigo,nombre FROM tbl_marca WHERE visible=TRUE ORDER BY nombre;
END$$


-- NOMBRE EN EL DAO -- contarMarcas --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_contarProductosMarca` (`mar` INT)  
BEGIN
    SELECT COUNT(*) FROM tbl_producto WHERE codigo_marca=mar;
END$$


-- probar otras combinaciones como  meter el select last insert id en el null y quitar la variable
-- NOMBRE EN EL DAO -- registrarMarca --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrarMarca` 
(`m_nombre` VARCHAR(30), `m_visible` BOOLEAN) 
BEGIN
    DECLARE m_codigo INT;
    INSERT INTO tbl_marca VALUES(null,m_nombre,m_visible);
    SET m_codigo = (SELECT LAST_INSERT_ID());
END$$


-- NOMBRE EN EL DAO -- eliminarMarca --
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarMarca` 
(`m_nombre` VARCHAR(30)) 
BEGIN
    DELETE FROM tbl_marca WHERE nombre=(m_nombre);
END$$


DELIMITER ;


---------------------------------------------------------


-- COMMIT FINAL -- 

COMMIT; 



-- EJECUTAR ESTO COMO ULTIMO  Y YA ESTA LISTA LA BBDD --

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


