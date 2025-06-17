
-- FUNCION 1: Reporte de ventas por mes
CREATE OR REPLACE FUNCTION ventas_por_mes()
RETURNS TABLE (mes INTEGER, total NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT EXTRACT(MONTH FROM Fecha_Reserva)::INTEGER, SUM(Coste)
    FROM reserva
    GROUP BY 1
    ORDER BY 1;
END;
$$ LANGUAGE plpgsql;

-- FUNCION 2: Entradas por genero
CREATE OR REPLACE FUNCTION entradas_por_genero()
RETURNS TABLE (genero varchar, total INTEGER) AS $$
BEGIN
    RETURN QUERY
    SELECT p.Genero, COUNT(*)::INTEGER
    FROM pelicula p
    JOIN sesion s ON s.idPelicula = p.idPelicula
    JOIN reserva r ON r.idSesion = s.idSesion
    GROUP BY p.Genero;
END;
$$ LANGUAGE plpgsql;


-- FUNCION 3: Entradas por clasificacion
CREATE OR REPLACE FUNCTION entradas_por_clasificacion()
RETURNS TABLE (clasificacion TEXT, total INTEGER) AS $$
BEGIN
    RETURN QUERY
    SELECT pelicula.Clasificacion::TEXT, COUNT(*)::INTEGER
    FROM pelicula
    JOIN sesion ON pelicula.idPelicula = sesion.idPelicula
    JOIN reserva ON sesion.idSesion = reserva.idSesion
    GROUP BY pelicula.Clasificacion;
END;
$$ LANGUAGE plpgsql;

-- FUNCION 4: Ocupacion de salas
CREATE OR REPLACE FUNCTION ocupacion_salas()
RETURNS TABLE (sala TEXT, ocupacion NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT ('Sala ' || s.idSala)::TEXT, 
           CASE WHEN s.Capacidad = 0 THEN 0
                ELSE ROUND((s.Ocupacion::DECIMAL / s.Capacidad) * 100, 2)
           END
    FROM sala s;
END;
$$ LANGUAGE plpgsql;


-- ---------------------------------------------
-- PROCEDIMIENTOS ALMACENADOS
-- ---------------------------------------------

-- PROCEDIMIENTO 1: Crear una reserva completa
CREATE OR REPLACE PROCEDURE crear_reserva_completa(
    cliente_id INT,
    sesion_id INT,
    butacas INT[]
)
LANGUAGE plpgsql
AS $$
DECLARE
    entrada_id INT;
    b_id INT;
BEGIN
    -- Insertar entrada
    INSERT INTO entradas(idCliente, Precio_Total, Numero_Entradas)
    VALUES (cliente_id, array_length(butacas,1) * 10.00, array_length(butacas,1))
    RETURNING identrada INTO entrada_id;

    -- Insertar reservas + actualizar butacas
    FOREACH b_id IN ARRAY butacas
    LOOP
        INSERT INTO reserva(idButaca, idEntrada, idSesion, Coste, Fecha_Reserva)
        VALUES (b_id, entrada_id, sesion_id, 10.00, CURRENT_DATE);
        
        UPDATE butaca SET Estado = 'Ocupada' WHERE idButaca = b_id;
    END LOOP;
END;
$$;

-- PROCEDIMIENTO 2: Asignar puntos por entradas
CREATE OR REPLACE PROCEDURE asignar_puntos_por_entrada(cliente_id INT, cantidad INT)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE usuarios SET Puntos = Puntos + cantidad * 2
    WHERE idCliente = cliente_id;
END;
$$;


-- ---------------------------------------------
-- TRIGGERS
-- ---------------------------------------------

-- TRIGGER 1: Al insertar una reserva, actualizar estado de butaca
CREATE OR REPLACE FUNCTION actualizar_estado_butaca()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE butaca
    SET Estado = 'Ocupada'
    WHERE idButaca = NEW.idButaca;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_estado_butaca
AFTER INSERT ON reserva
FOR EACH ROW
EXECUTE FUNCTION actualizar_estado_butaca();

-- TRIGGER 2: Al insertar una entrada, sumar puntos al usuario
CREATE OR REPLACE FUNCTION asignar_puntos_auto()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE usuarios
    SET Puntos = Puntos + NEW.Numero_Entradas * 2
    WHERE idCliente = NEW.idCliente;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_puntos_usuario
AFTER INSERT ON entradas
FOR EACH ROW
EXECUTE FUNCTION asignar_puntos_auto();