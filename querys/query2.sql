--¿4. ¿Cúal fue el local que más vendío?
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
LIMIT 1;


--¿4. ¿Cúal fue el local que más vendío en un determinado mes y año?
/*Locales que han generado una mayor ganancia en un tiempo determinado.
Justificación: A veces el propietario de la empresa desea verificar las ganancias  de cada local y cual de ellos está obtiendo mayores ingreso en el transcurso del mes.*/
SELECT Direccion, SUM(monto) as total
FROM(
    SELECT T.Direccion as Direccion, B.monto as monto
    FROM mil.Boleta B, mil.Terapista T, mil.Realiza_Boleta RB
    WHERE B.DNI = RB.DNI_cliente AND T.DNI = RB.DNI_terapista 
    AND EXTRACT('MONTH' FROM B.fecha) = 2 AND EXTRACT('YEAR' FROM B.fecha) = 2020
    UNION ALL
    SELECT T.Direccion as Direccion, F.monto as monto
    FROM mil.Factura F, mil.Terapista T, mil.Realiza_Factura RF
    WHERE F.DNI = RF.DNI_cliente AND T.DNI = RF.DNI_terapista 
    AND EXTRACT('MONTH' FROM F.fecha) = 2 AND EXTRACT('YEAR' FROM F.fecha) = 2020
    ) T
GROUP BY (Direccion)
ORDER BY total DESC
LIMIT 1;