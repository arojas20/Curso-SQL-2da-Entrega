use Quesera;

-- Funcion que me permite contar la cantida de productos producidos segun el id de producto
DROP FUNCTION IF EXISTS FN_CANT_PRODUCIDA;

DELIMITER //
CREATE FUNCTION FN_CANT_PRODUCIDA ( CANTIDAD int )
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE  CANT_TOTAL INT;
SELECT SUM(CANTIDAD_PROD) INTO CANT_TOTAL FROM PRODUCCION 
WHERE ID_PRODUCTOS LIKE CANTIDAD;
RETURN CANT_TOTAL;
END//
DELIMITER ;

SELECT FN_CANT_PRODUCIDA(2) AS Cantidad_Producida;



-- Funcion que me permite contar la cantida usuarios que compraron un productos especifico segun el id de producto

DROP FUNCTION IF EXISTS FN_CUANTO_PROD_CLI;

DELIMITER //
CREATE FUNCTION FN_CUANTO_PROD_CLI ( PROD INT )
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE CONTAR INT;
SET CONTAR = (SELECT COUNT(NOMBRE_CLI) FROM CLIENTE AS a JOIN producto_clientes AS b
WHERE b.ID_PRODUCTOS LIKE PROD AND A.ID_CLIENTE = B.ID_CLIENTE);
RETURN CONTAR;
END//
DELIMITER ;

SELECT FN_CUANTO_PROD_CLI(1) AS Cantidad_clientes_Producto;



