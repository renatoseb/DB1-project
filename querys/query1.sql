--¿Cúal es el cliente más frecuente?

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