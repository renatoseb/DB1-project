SELECT DNI_cliente, COUNT(DNI_cliente) AS total
FROM (SELECT DNI_cliente 
	FROM  mil.Realiza_Boleta
	UNION ALL
	SELECT DNI_cliente
	FROM mil.Realiza_Factura) S
GROUP BY(DNI_cliente)
ORDER BY total DESC
LIMIT 3;

SELECT Direccion, SUM(monto) as total
FROM(
	SELECT T.Direccion as Direccion, B.monto as monto
	FROM mil.Boleta B, mil.Terapista T, mil.Realiza_Boleta RB
	WHERE B.DNI = RB.DNI_cliente AND T.DNI = RB.DNI_terapista
	UNION ALL
	SELECT T.Direccion as Direccion, F.monto as monto
	FROM mil.Factura F, mil.Terapista T, mil.Realiza_Factura RF
	WHERE F.DNI = RF.DNI_cliente AND T.DNI = RF.DNI_terapista
	) T
GROUP BY (Direccion)
ORDER BY total DESC
LIMIT 3;