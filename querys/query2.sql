--¿4. ¿Cúal fue el local que más vendío?
SELECT Direccion, SUM(monto) as total
FROM(
    SELECT T.Direccion as Direccion, B.monto as monto
    FROM mil.Boleta B, mil.Terapista T, mil.Realiza_Boleta RB
    WHERE B.DNI = RB.DNI_cliente AND T.DNI = RB.DNI_terapista AND EXTRACT('MONTH' FROM B.fecha) = 2
    AND 
    UNION ALL
    SELECT T.Direccion as Direccion, F.monto as monto
    FROM mil.Factura F, mil.Terapista T, mil.Realiza_Factura RF
    WHERE F.DNI = RF.DNI_cliente AND T.DNI = RF.DNI_terapista AND EXTRACT('MONTH' FROM B.fecha) = 2
    ) T
GROUP BY (Direccion)
ORDER BY total DESC
LIMIT 1;


--¿4. ¿Cúal fue el local que más vendío en un determinado mes y año?
SELECT Direccion, SUM(monto) as total
FROM(
    SELECT T.Direccion as Direccion, B.monto as monto
    FROM mil.Boleta B, mil.Terapista T, mil.Realiza_Boleta RB
    WHERE B.DNI = RB.DNI_cliente AND T.DNI = RB.DNI_terapista AND EXTRACT('MONTH' FROM B.fecha) = 2 AND EXTRACT('YEAR' FROM B.fecha) = 2020
    UNION ALL
    SELECT T.Direccion as Direccion, F.monto as monto
    FROM mil.Factura F, mil.Terapista T, mil.Realiza_Factura RF
    WHERE F.DNI = RF.DNI_cliente AND T.DNI = RF.DNI_terapista AND EXTRACT('MONTH' FROM F.fecha) = 2 AND EXTRACT('YEAR' FROM F.fecha) = 2020
    ) T
GROUP BY (Direccion)
ORDER BY total DESC
LIMIT 1;
/*
Para obtener el local que obtuvo una mayor ganancia en un determinado mes y año. Tendremos que realizar
una sumatoria de los montos de cada factura y boleta. Para aquello necesitamos
conocer quien fue el terapista que realizo la terapia en base a ello obtenemos la dirección del local. Debido
a que cada terapista trabaja en un local.
*/