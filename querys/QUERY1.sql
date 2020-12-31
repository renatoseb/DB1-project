-- ¿Cuál es el salario de todos los terapista en mes y año determinado?
SELECT T.nombres,T.apellidos, TS.salario
FROM terapista T INNER JOIN(
    SELECT DNI_terapista, SUM(sueldo)    as salario
    FROM (
        SELECT MRB.DNI_terapista, MB.monto AS sueldo
        FROM realiza_boleta MRB INNER JOIN boleta MB
        ON MRB.ID_boleta = MB.ID_boleta AND EXTRACT('MONTH' FROM MB.fecha) = 10
        UNION ALL
        SELECT MRF.DNI_terapista, MF.monto AS SUELDO
        FROM realiza_factura MRF INNER JOIN factura MF
        ON MRF.ID_factura = MF.ID_factura AND EXTRACT('MONTH' FROM MF.fecha) = 10
    ) S
    GROUP BY(DNI_terapista)
) TS ON T.dni = DNI_terapista;