use Quesera;

/*Se crea Stored Procedure en el que se ordenan los registro de de la tabla Producto ternimado por el campo NOMBRE_PRODUCTO 
de forma Ascendente ingresando el Valor ASC o Descendente ingresando DESC*/

DROP PROCEDURE IF EXISTS SP_ORDENA;

DELIMITER //
CREATE PROCEDURE SP_ORDENA (IN VALOR VARCHAR(32), IN ASC_DESC VARCHAR(32))
BEGIN
SET @VALOR= CONCAT("SELECT * FROM PRODUCTO_TERMINADO U ORDER BY"," ", VALOR," ",  ASC_DESC);
PREPARE RESULTADO1 FROM @VALOR;
EXECUTE RESULTADO1;
DEALLOCATE PREPARE RESULTADO1;
END // 
      DELIMITER ;



/*Se crea Stored Procedure en el que se puede ingresar registros o eliminar de la tabla Producto ternimado, se ingresan los numeros 1. Para ingresar 
ó 2 para Eliminar Registros de la tabla mas el codigo que indica el ID del producto*/


DROP PROCEDURE IF EXISTS SP_INSERT_DELETE;

DELIMITER //
CREATE PROCEDURE SP_INSERT_DELETE (IN ACCION_1_INSERT_2_DELETE INT, IN CODIGO INT)
INICIO: BEGIN 
IF UPPER(ACCION_1_INSERT_2_DELETE) LIKE 2 THEN
      DELETE FROM PRODUCTO_TERMINADO WHERE ID_PRODUCTOS = CODIGO;
ELSEIF UPPER(ACCION_1_INSERT_2_DELETE) LIKE 1 THEN   
       INSERT INTO PRODUCTO_TERMINADO (ID_PRODUCTOS,NOMBRE_PRODUCTO,STOCK_ACTUAL,STOCK_MINIMO,STOCK_MAXIMO,PRECIO,ID_TIPO_PRODUCTO,ID_ALMACEN) VALUES (CODIGO,'OTROS',20,5,35,200.00,10,11);
ELSE
LEAVE INICIO;
END IF;    

END//
DELIMITER ;

