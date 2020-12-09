SELECT Direccion, SUM(monto) as total
FROM(
	SELECT T.Direccion as Direccion, B.monto as monto
	FROM Boleta B, Terapista T, Realiza_Boleta RB
	WHERE B.DNI = RB.DNI_cliente AND T.DNI = RB.DNI_terapista
	UNION ALL
	SELECT T.Direccion as Direccion, F.monto as monto
	FROM Factura F, Terapista T, Realiza_Factura RF
	WHERE F.DNI = RF.DNI_cliente AND T.DNI = RF.DNI_terapista
	) T
GROUP BY (Direccion)
ORDER BY total DESC
LIMIT 3;