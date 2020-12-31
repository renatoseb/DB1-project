-- Consulta 1
-- mil
set mil.enable_hashjoin to off;
set mil.enable_sort to off;
set mil.enable_bitmapscan to off;
set mil.enable_indexscan to off;
EXPLAIN ANALYZE
SELECT T.nombres,T.apellidos, TS.salario
FROM mil.terapista T INNER JOIN(
    SELECT DNI_terapista, SUM(sueldo)    as salario
    FROM (
        SELECT MRB.DNI_terapista, MB.monto AS sueldo
        FROM mil.realiza_boleta MRB INNER JOIN mil.boleta MB
        ON MRB.ID_boleta = MB.ID_boleta AND EXTRACT('MONTH' FROM MB.fecha) = 10
        UNION ALL
        SELECT MRF.DNI_terapista, MF.monto AS SUELDO
        FROM mil.realiza_factura MRF INNER JOIN mil.factura MF
        ON MRF.ID_factura = MF.ID_factura AND EXTRACT('MONTH' FROM MF.fecha) = 10
    ) S
    GROUP BY(DNI_terapista)
) TS ON T.dni = DNI_terapista;

-- mil_i
CREATE INDEX index_dni_T ON  mil_i.terapista USING hash (dni);
EXPLAIN ANALYZE
SELECT T.nombres,T.apellidos, TS.salario
FROM mil_i.terapista T INNER JOIN(
    SELECT DNI_terapista, SUM(sueldo) as salario
    FROM (
        SELECT MRB.DNI_terapista, MB.monto AS sueldo
        FROM mil_i.realiza_boleta MRB INNER JOIN mil_i.boleta MB
        ON MRB.ID_boleta = MB.ID_boleta AND EXTRACT('MONTH' FROM MB.fecha) = 10
        UNION ALL
        SELECT MRF.DNI_terapista, MF.monto AS SUELDO
        FROM mil_i.realiza_factura MRF INNER JOIN mil_i.factura MF
        ON MRF.ID_factura = MF.ID_factura AND EXTRACT('MONTH' FROM MF.fecha) = 10
    ) S
    GROUP BY(DNI_terapista)
) TS ON T.dni = DNI_terapista;


-- mil_10
set mil_10.enable_hashjoin to off;
set mil_10.enable_sort to off;
set mil_10.enable_bitmapscan to off;
set mil_10.enable_indexscan to off;
EXPLAIN ANALYZE
SELECT T.nombres,T.apellidos, TS.salario
FROM mil_10.terapista T INNER JOIN(
    SELECT DNI_terapista, SUM(sueldo) as salario
    FROM (
        SELECT MRB.DNI_terapista, MB.monto AS sueldo
        FROM mil_10.realiza_boleta MRB INNER JOIN mil_10.boleta MB
        ON MRB.ID_boleta = MB.ID_boleta AND EXTRACT('MONTH' FROM MB.fecha) = 10
        UNION ALL
        SELECT MRF.DNI_terapista, MF.monto AS SUELDO
        FROM mil_10.realiza_factura MRF INNER JOIN mil_10.factura MF
        ON MRF.ID_factura = MF.ID_factura AND EXTRACT('MONTH' FROM MF.fecha) = 10
    ) S
    GROUP BY(DNI_terapista)
) TS ON T.dni = DNI_terapista;

-- mil_10_i
CREATE INDEX index_dni_T ON  mil_10_i.terapista USING hash (dni);
EXPLAIN ANALYZE
SELECT T.nombres,T.apellidos, TS.salario
FROM mil_10_i.terapista T INNER JOIN(
    SELECT DNI_terapista, SUM(sueldo) as salario
    FROM (
        SELECT MRB.DNI_terapista, MB.monto AS sueldo
        FROM mil_10_i.realiza_boleta MRB INNER JOIN mil_10_i.boleta MB
        ON MRB.ID_boleta = MB.ID_boleta AND EXTRACT('MONTH' FROM MB.fecha) = 10
        UNION ALL
        SELECT MRF.DNI_terapista, MF.monto AS SUELDO
        FROM mil_10_i.realiza_factura MRF INNER JOIN mil_10_i.factura MF
        ON MRF.ID_factura = MF.ID_factura AND EXTRACT('MONTH' FROM MF.fecha) = 10
    ) S
    GROUP BY(DNI_terapista)
) TS ON T.dni = DNI_terapista;

-- mil_100
set mil_100.enable_hashjoin to off;
set mil_100.enable_sort to off;
set mil_100.enable_bitmapscan to off;
set mil_100.enable_indexscan to off;
EXPLAIN ANALYZE
SELECT T.nombres,T.apellidos, TS.salario
FROM mil_100.terapista T INNER JOIN(
    SELECT DNI_terapista, SUM(sueldo) as salario
    FROM (
        SELECT MRB.DNI_terapista, MB.monto AS sueldo
        FROM mil_100.realiza_boleta MRB INNER JOIN mil_100.boleta MB
        ON MRB.ID_boleta = MB.ID_boleta AND EXTRACT('MONTH' FROM MB.fecha) = 10
        UNION ALL
        SELECT MRF.DNI_terapista, MF.monto AS SUELDO
        FROM mil_100.realiza_factura MRF INNER JOIN mil_100.factura MF
        ON MRF.ID_factura = MF.ID_factura AND EXTRACT('MONTH' FROM MF.fecha) = 10
    ) S
    GROUP BY(DNI_terapista)
) TS ON T.dni = DNI_terapista;

-- mil_100_i
CREATE INDEX index_dni_T ON  mil_100_i.terapista USING hash (dni);
EXPLAIN ANALYZE
SELECT T.nombres,T.apellidos, TS.salario
FROM mil_100_i.terapista T INNER JOIN(
    SELECT DNI_terapista, SUM(sueldo) as salario
    FROM (
        SELECT MRB.DNI_terapista, MB.monto AS sueldo
        FROM mil_100_i.realiza_boleta MRB INNER JOIN mil_100_i.boleta MB
        ON MRB.ID_boleta = MB.ID_boleta AND EXTRACT('MONTH' FROM MB.fecha) = 10
        UNION ALL
        SELECT MRF.DNI_terapista, MF.monto AS SUELDO
        FROM mil_100_i.realiza_factura MRF INNER JOIN mil_100_i.factura MF
        ON MRF.ID_factura = MF.ID_factura AND EXTRACT('MONTH' FROM MF.fecha) = 10
    ) S
    GROUP BY(DNI_terapista)
) TS ON T.dni = DNI_terapista;

-- millon
set millon.enable_hashjoin to off;
set millon.enable_sort to off;
set millon.enable_bitmapscan to off;
set millon.enable_indexscan to off;
EXPLAIN ANALYZE
SELECT T.nombres,T.apellidos, TS.salario
FROM millon.terapista T INNER JOIN(
    SELECT DNI_terapista, SUM(sueldo) as salario
    FROM (
        SELECT MRB.DNI_terapista, MB.monto AS sueldo
        FROM millon.realiza_boleta MRB INNER JOIN millon.boleta MB
        ON MRB.ID_boleta = MB.ID_boleta AND EXTRACT('MONTH' FROM MB.fecha) = 10
        UNION ALL
        SELECT MRF.DNI_terapista, MF.monto AS SUELDO
        FROM millon.realiza_factura MRF INNER JOIN millon.factura MF
        ON MRF.ID_factura = MF.ID_factura AND EXTRACT('MONTH' FROM MF.fecha) = 10
    ) S
    GROUP BY(DNI_terapista)
) TS ON T.dni = DNI_terapista;


-- millon_i
CREATE INDEX index_dni_T ON millon_i.terapista USING hash (dni);
EXPLAIN ANALYZE
SELECT T.nombres,T.apellidos, TS.salario
FROM millon_i.terapista T INNER JOIN(
    SELECT DNI_terapista, SUM(sueldo) as salario
    FROM (
        SELECT MRB.DNI_terapista, MB.monto AS sueldo
        FROM millon_i.realiza_boleta MRB INNER JOIN millon_i.boleta MB
        ON MRB.ID_boleta = MB.ID_boleta AND EXTRACT('MONTH' FROM MB.fecha) = 10
        UNION ALL
        SELECT MRF.DNI_terapista, MF.monto AS SUELDO
        FROM millon_i.realiza_factura MRF INNER JOIN millon_i.factura MF
        ON MRF.ID_factura = MF.ID_factura AND EXTRACT('MONTH' FROM MF.fecha) = 10
    ) S
    GROUP BY(DNI_terapista)
) TS ON T.dni = DNI_terapista;