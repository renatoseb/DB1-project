--¿Cúal es el cliente más frecuente?
/*Nombre de los clientes mas frecuente de la empresa.
Justificación: A veces llegan a atenderse clientes que
informan que son clientes frecuentes y se verifica. Si 
son clientes frecuentes se le ofrece un trato diferente.*/

SELECT C.nombres,C.apellidos
    FROM mil.cliente C, (
    SELECT DNI_cliente, COUNT(DNI_cliente) AS total
    FROM (SELECT DNI_cliente 
        FROM  mil.Realiza_Boleta
        UNION ALL
        SELECT DNI_cliente
        FROM mil.Realiza_Factura) S
    GROUP BY(DNI_cliente)
    HAVING COUNT(DNI_cliente) =(
        SELECT MAX(total)
        FROM(
            SELECT DNI_cliente, COUNT(DNI_cliente) AS total
            FROM (SELECT DNI_cliente 
                FROM  mil.Realiza_Boleta
                UNION ALL
                SELECT DNI_cliente
                FROM mil.Realiza_Factura) S
            GROUP BY(DNI_cliente)
        ) C
    )
    ORDER BY total DESC
) RB
WHERE RB.DNI_cliente = C.DNI;