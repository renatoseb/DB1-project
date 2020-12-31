-- ¿Cúal fue el local que más vendío en un determinado mes y año?
SELECT Direccion, SUM(monto) as total
FROM(
    SELECT T.Direccion as Direccion, B.monto as monto
    FROM Boleta B, Terapista T, Realiza_Boleta RB
    WHERE B.DNI = RB.DNI_cliente AND T.DNI = RB.DNI_terapista 
    AND EXTRACT('MONTH' FROM B.fecha) = 2 AND EXTRACT('YEAR' FROM B.fecha) = 2020
    UNION ALL
    SELECT T.Direccion as Direccion, F.monto as monto
    FROM Factura F, Terapista T, Realiza_Factura RF
    WHERE F.DNI = RF.DNI_cliente AND T.DNI = RF.DNI_terapista 
    AND EXTRACT('MONTH' FROM F.fecha) = 2 AND EXTRACT('YEAR' FROM F.fecha) = 2020
    ) T
GROUP BY (Direccion)
ORDER BY total DESC
LIMIT 1;