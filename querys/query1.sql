--¿Cúal es el cliente más frecuente?
/*Nombre de los clientes mas frecuente de la empresa.
Justificación: A veces llegan a atenderse clientes que
informan que son clientes frecuentes y se verifica. Si 
son clientes frecuentes se le ofrece un trato diferente.*/


-- mil
SELECT C.nombres,C.apellidos
    FROM mil.cliente C, (
    SELECT DNI, COUNT(DNI) AS total
    FROM (SELECT DNI 
        FROM  mil.Boleta

        UNION ALL
        SELECT DNI
        FROM mil.Factura) S
    GROUP BY(DNI)
    HAVING COUNT(DNI) =(
        SELECT MAX(total)
        FROM(
            SELECT DNI, COUNT(DNI) AS total
            FROM (SELECT DNI 
                FROM  mil.Boleta

                UNION ALL
                SELECT DNI
                FROM mil.Factura) S
            GROUP BY(DNI)
        ) C
    )
    ORDER BY total DESC
) RB
WHERE RB.DNI = C.DNI;

-- mil_i
SELECT C.nombres,C.apellidos
    FROM mil_i.cliente C, (
    SELECT DNI, COUNT(DNI) AS total
    FROM (SELECT DNI 
        FROM  mil_i.Boleta

        UNION ALL
        SELECT DNI
        FROM mil_i.Factura) S
    GROUP BY(DNI)
    HAVING COUNT(DNI) =(
        SELECT MAX(total)
        FROM(
            SELECT DNI, COUNT(DNI) AS total
            FROM (SELECT DNI 
                FROM  mil_i.Boleta

                UNION ALL
                SELECT DNI
                FROM mil_i.Factura) S
            GROUP BY(DNI)
        ) C
    )
    ORDER BY total DESC
) RB
WHERE RB.DNI = C.DNI;

-- mil_10
SELECT C.nombres,C.apellidos
    FROM mil_10.cliente C, (
    SELECT DNI, COUNT(DNI) AS total
    FROM (SELECT DNI 
        FROM  mil_10.Boleta

        UNION ALL
        SELECT DNI
        FROM mil_10.Factura) S
    GROUP BY(DNI)
    HAVING COUNT(DNI) =(
        SELECT MAX(total)
        FROM(
            SELECT DNI, COUNT(DNI) AS total
            FROM (SELECT DNI 
                FROM  mil_10.Boleta

                UNION ALL
                SELECT DNI
                FROM mil_10.Factura) S
            GROUP BY(DNI)
        ) C
    )
    ORDER BY total DESC
) RB
WHERE RB.DNI = C.DNI;

-- mil_10_i
SELECT C.nombres,C.apellidos
    FROM mil_10_i.cliente C, (
    SELECT DNI, COUNT(DNI) AS total
    FROM (SELECT DNI 
        FROM  mil_10_i.Boleta

        UNION ALL
        SELECT DNI
        FROM mil_10_i.Factura) S
    GROUP BY(DNI)
    HAVING COUNT(DNI) =(
        SELECT MAX(total)
        FROM(
            SELECT DNI, COUNT(DNI) AS total
            FROM (SELECT DNI 
                FROM  mil_10_i.Boleta

                UNION ALL
                SELECT DNI
                FROM mil_10_i.Factura) S
            GROUP BY(DNI)
        ) C
    )
    ORDER BY total DESC
) RB
WHERE RB.DNI = C.DNI;

-- mil_100
SELECT C.nombres,C.apellidos
    FROM mil_100.cliente C, (
    SELECT DNI, COUNT(DNI) AS total
    FROM (SELECT DNI 
        FROM  mil_100.Boleta

        UNION ALL
        SELECT DNI
        FROM mil_100.Factura) S
    GROUP BY(DNI)
    HAVING COUNT(DNI) =(
        SELECT MAX(total)
        FROM(
            SELECT DNI, COUNT(DNI) AS total
            FROM (SELECT DNI 
                FROM  mil_100.Boleta

                UNION ALL
                SELECT DNI
                FROM mil_100.Factura) S
            GROUP BY(DNI)
        ) C
    )
    ORDER BY total DESC
) RB
WHERE RB.DNI = C.DNI;

-- mil_100_i
SELECT C.nombres,C.apellidos
    FROM mil_100_i.cliente C, (
    SELECT DNI, COUNT(DNI) AS total
    FROM (SELECT DNI 
        FROM  mil_100_i.Boleta

        UNION ALL
        SELECT DNI
        FROM mil_100_i.Factura) S
    GROUP BY(DNI)
    HAVING COUNT(DNI) =(
        SELECT MAX(total)
        FROM(
            SELECT DNI, COUNT(DNI) AS total
            FROM (SELECT DNI 
                FROM  mil_100_i.Boleta

                UNION ALL
                SELECT DNI
                FROM mil_100_i.Factura) S
            GROUP BY(DNI)
        ) C
    )
    ORDER BY total DESC
) RB
WHERE RB.DNI = C.DNI;

