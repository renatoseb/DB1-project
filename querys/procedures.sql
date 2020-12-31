CREATE PROCEDURE insert_boleta( dni_cliente varchar(8), 
                                id_boleta varchar(8), 
                                monto integer, 
                                tipo_de_pago varchar(15),
                                dni_terapista varchar(8),
                                tipo_servicio varchar(40),
                                tiempo integer,
                                horainicio TIME,
                                horafin TIME 
                                 ) 
LANGUAGE SQL
AS $$
START TRANSACTION;
    INSERT INTO mil.Boleta VALUES(id_boleta,dni_cliente,monto,CURRENT_DATE,tipo_de_pago);
    INSERT INTO mil.Realiza_Boleta VALUES(dni_cliente,id_boleta, dni_terapista, tipo_servicio, tiempo, horainicio, horafin);
    UPDATE mil.Salario SET monto = monto + 30 WHERE DNI = dni_terapista AND   mes = DATE_PART('MONTH', CURRENT_DATE) AND  anio = DATE_PART('YEAR', CURRENT_DATE);
COMMIT;
$$;

CREATE PROCEDURE insert_factura( dni_cliente varchar(8), 
                                id_factura varchar(8), 
                                monto integer, 
                                ruc varchar(11),
                                direccion varchar(150),
                                tipo_de_pago varchar(15),
                                dni_terapista varchar(8),
                                tipo_servicio varchar(40),
                                tiempo integer,
                                horainicio TIME,
                                horafin TIME 
                                 ) 
LANGUAGE SQL
AS $$
START TRANSACTION;
    INSERT INTO mil.Factura VALUES(id_factura,dni_cliente,ruc,direccion,monto,CURRENT_DATE,tipo_de_pago);
    INSERT INTO mil.Realiza_Factura VALUES(dni_cliente,id_factura, dni_terapista, tipo_servicio, tiempo, horainicio, horafin);
    UPDATE mil.Salario SET monto = monto + 30 WHERE DNI = dni_terapista AND   mes = DATE_PART('MONTH', CURRENT_DATE) AND  anio = DATE_PART('YEAR', CURRENT_DATE);
COMMIT;
$$;