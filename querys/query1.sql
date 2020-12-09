SELECT DNI_cliente, COUNT(DNI_cliente) AS total
FROM (SELECT DNI_cliente 
	FROM  Realiza_Boleta
	UNION ALL
	SELECT DNI_cliente
	FROM Realiza_Factura) S
GROUP BY(DNI_cliente)
ORDER BY total DESC
LIMIT 3;

