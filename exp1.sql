CREATE INDEX index_dni_millon ON millon_i.cliente USING hash(dni);
CREATE INDEX index_dni_mil ON mil_i.cliente USING hash(dni);
CREATE INDEX index_dni_mil_10 ON mil_10_i.cliente USING hash(dni);
CREATE INDEX index_dni_mil_100 ON mil_100_i.cliente USING hash(dni);
set mil_10.enable_hashjoin to off;
set mil_10.enable_sort to off;
set mil_10.enable_nestloop to off;
set mil_10.enable_indexscan to off;
set mil_10.enable_hashagg to off;
set mil_10_i.enable_hashjoin to on;
set mil_10_i.enable_sort to on;
set mil_10_i.enable_nestloop to on;
set mil_10_i.enable_indexscan to on;
set mil_10_i.enable_hashagg to on;

set millon.enable_hashjoin to off;
set millon.enable_sort to off;
set millon.enable_nestloop to off;
set millon.enable_indexscan to off;
set millon.enable_hashagg to off;
set millon.enable_hashjoin to on;
set millon.enable_sort to on;
set millon.enable_nestloop to on;
set millon.enable_indexscan to on;
set millon.enable_hashagg to on;
-- mil
EXPLAIN ANALYZE
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
) RB
WHERE RB.DNI = C.DNI;

-- mil_i
EXPLAIN ANALYZE
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
) RB
WHERE RB.DNI = C.DNI;

-- mil_10
EXPLAIN ANALYZE
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
) RB
WHERE RB.DNI = C.DNI;

-- mil_10_i
EXPLAIN ANALYZE
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
) RB
WHERE RB.DNI = C.DNI;

-- mil_100
EXPLAIN ANALYZE
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
) RB
WHERE RB.DNI = C.DNI;

-- mil_100_i
EXPLAIN ANALYZE
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
) RB
WHERE RB.DNI = C.DNI;

-- millon
EXPLAIN ANALYZE
SELECT C.nombres,C.apellidos
    FROM millon.cliente C, (
    SELECT DNI, COUNT(DNI) AS total
    FROM (SELECT DNI 
        FROM  millon.Boleta
        UNION ALL
        SELECT DNI
        FROM millon.Factura) S
    GROUP BY(DNI)
    HAVING COUNT(DNI) =(
        SELECT MAX(total)
        FROM(
            SELECT DNI, COUNT(DNI) AS total
            FROM (SELECT DNI 
                FROM  millon.Boleta
                UNION ALL
                SELECT DNI
                FROM millon.Factura) S
            GROUP BY(DNI)
        ) C
    )
) RB
WHERE RB.DNI = C.DNI;

-- millon_i
EXPLAIN ANALYZE
SELECT C.nombres,C.apellidos
    FROM millon_i.cliente C, (
    SELECT DNI, COUNT(DNI) AS total
    FROM (SELECT DNI 
        FROM  millon_i.Boleta
        UNION ALL
        SELECT DNI
        FROM millon_i.Factura) S
    GROUP BY(DNI)
    HAVING COUNT(DNI) =(
        SELECT MAX(total)
        FROM(
            SELECT DNI, COUNT(DNI) AS total
            FROM (SELECT DNI 
                FROM  millon_i.Boleta
                UNION ALL
                SELECT DNI
                FROM millon_i.Factura) S
            GROUP BY(DNI)
        ) C
    )
) RB
WHERE RB.DNI = C.DNI;
            


