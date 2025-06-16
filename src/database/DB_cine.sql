--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-06-15 00:49:11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4865 (class 1262 OID 16388)
-- Name: db_cine; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_cine WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Bolivia.1252';


ALTER DATABASE db_cine OWNER TO postgres;

\connect db_cine

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16398)
-- Name: butaca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.butaca (
    idbutaca integer NOT NULL,
    fila integer,
    numero integer,
    estado character varying(20) DEFAULT NULL::character varying,
    idsala integer,
    CONSTRAINT butaca_estado_check CHECK (((estado)::text = ANY ((ARRAY['Libre'::character varying, 'Ocupada'::character varying])::text[])))
);


ALTER TABLE public.butaca OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16403)
-- Name: entradas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entradas (
    identrada integer NOT NULL,
    idcliente integer,
    precio_total numeric(10,2) DEFAULT NULL::numeric,
    numero_entradas integer
);


ALTER TABLE public.entradas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16407)
-- Name: pelicula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pelicula (
    idpelicula integer NOT NULL,
    titulo character varying(100) DEFAULT NULL::character varying,
    sinopsis text,
    cartel character varying(255) DEFAULT NULL::character varying,
    anio integer,
    genero character varying(50) DEFAULT NULL::character varying,
    clasificacion character varying(10) DEFAULT NULL::character varying,
    duracion integer,
    nacionalidad character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.pelicula OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16417)
-- Name: reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reserva (
    idbutaca integer,
    identrada integer,
    idsesion integer,
    coste numeric(10,2) DEFAULT NULL::numeric,
    fecha_reserva date
);


ALTER TABLE public.reserva OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16421)
-- Name: sala; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sala (
    idsala integer NOT NULL,
    capacidad integer,
    ocupacion integer
);


ALTER TABLE public.sala OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16424)
-- Name: sesion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sesion (
    idsesion integer NOT NULL,
    fecha date,
    hora time without time zone,
    idioma character varying(20) DEFAULT NULL::character varying,
    idpelicula integer,
    idsala integer
);


ALTER TABLE public.sesion OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16486)
-- Name: usuarios_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_idcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_idcliente_seq OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16428)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    idcliente integer DEFAULT nextval('public.usuarios_idcliente_seq'::regclass) NOT NULL,
    dni character varying(20) DEFAULT NULL::character varying,
    nombre character varying(50) DEFAULT NULL::character varying,
    apellidos character varying(100) DEFAULT NULL::character varying,
    fecha_nac date,
    correo character varying(100) DEFAULT NULL::character varying,
    telefono character varying(15) DEFAULT NULL::character varying,
    usuario character varying(50) DEFAULT NULL::character varying,
    contrasena character varying(255) DEFAULT NULL::character varying,
    puntos integer,
    tarjeta character varying(50) DEFAULT NULL::character varying,
    fecha_registro date
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 4852 (class 0 OID 16398)
-- Dependencies: 217
-- Data for Name: butaca; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (1, 1, 1, 'Ocupada', 1);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (2, 1, 2, 'Ocupada', 1);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (3, 2, 3, 'Ocupada', 2);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (4, 2, 4, 'Ocupada', 2);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (5, 3, 5, 'Libre', 3);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (6, 3, 6, 'Ocupada', 3);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (7, 4, 7, 'Libre', 4);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (8, 4, 8, 'Ocupada', 4);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (9, 5, 9, 'Libre', 5);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (10, 5, 10, 'Ocupada', 5);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (11, 1, 11, 'Ocupada', 1);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (12, 1, 12, 'Ocupada', 1);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (13, 2, 13, 'Ocupada', 1);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (14, 2, 14, 'Ocupada', 1);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (15, 3, 15, 'Ocupada', 2);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (16, 3, 16, 'Ocupada', 2);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (17, 4, 17, 'Libre', 2);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (18, 4, 18, 'Ocupada', 2);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (19, 5, 19, 'Libre', 3);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (20, 5, 20, 'Ocupada', 3);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (21, 1, 21, 'Libre', 4);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (22, 1, 22, 'Ocupada', 4);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (23, 2, 23, 'Libre', 4);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (24, 2, 24, 'Ocupada', 4);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (25, 3, 25, 'Libre', 5);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (26, 3, 26, 'Ocupada', 5);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (27, 4, 27, 'Libre', 5);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (28, 4, 28, 'Ocupada', 5);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (29, 5, 29, 'Libre', 6);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (30, 5, 30, 'Ocupada', 6);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (31, 1, 31, 'Libre', 6);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (32, 1, 32, 'Ocupada', 6);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (33, 2, 33, 'Libre', 7);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (34, 2, 34, 'Ocupada', 7);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (35, 3, 35, 'Libre', 7);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (36, 3, 36, 'Ocupada', 7);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (37, 4, 37, 'Libre', 8);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (38, 4, 38, 'Ocupada', 8);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (39, 5, 39, 'Libre', 8);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (40, 5, 40, 'Ocupada', 8);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (41, 1, 41, 'Libre', 9);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (42, 1, 42, 'Ocupada', 9);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (43, 2, 43, 'Libre', 9);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (44, 2, 44, 'Ocupada', 9);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (45, 3, 45, 'Libre', 10);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (46, 3, 46, 'Ocupada', 10);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (47, 4, 47, 'Libre', 10);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (48, 4, 48, 'Ocupada', 10);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (49, 5, 49, 'Libre', 11);
INSERT INTO public.butaca (idbutaca, fila, numero, estado, idsala) VALUES (50, 5, 50, 'Ocupada', 11);


--
-- TOC entry 4853 (class 0 OID 16403)
-- Dependencies: 218
-- Data for Name: entradas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (0, NULL, 10.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (1, 1, 15.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (2, 2, 20.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (3, 3, 10.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (4, 4, 25.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (5, 5, 12.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (6, 6, 18.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (7, 7, 22.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (8, 8, 16.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (9, 9, 30.00, 5);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (10, 10, 14.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (11, 11, 19.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (12, 12, 26.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (13, 13, 10.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (14, 14, 28.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (15, 15, 17.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (16, 16, 23.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (17, 17, 21.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (18, 18, 15.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (19, 19, 32.00, 5);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (20, 20, 13.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (21, 21, 18.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (22, 22, 24.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (23, 23, 20.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (24, 24, 11.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (25, 25, 27.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (26, 26, 12.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (27, 27, 25.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (28, 28, 16.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (29, 29, 30.00, 5);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (30, 30, 14.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (31, 31, 19.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (32, 32, 22.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (33, 33, 18.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (34, 34, 17.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (35, 35, 28.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (36, 36, 15.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (37, 37, 23.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (38, 38, 10.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (39, 39, 26.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (40, 40, 21.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (41, 41, 18.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (42, 42, 13.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (43, 43, 20.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (44, 44, 22.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (45, 45, 16.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (46, 46, 19.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (47, 47, 30.00, 5);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (48, 48, 27.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (49, 49, 12.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (50, 50, 24.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (51, 1, 28.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (52, 2, 19.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (53, 3, 25.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (54, 4, 13.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (55, 5, 22.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (56, 6, 17.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (57, 7, 31.00, 5);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (58, 8, 16.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (59, 9, 24.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (60, 10, 20.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (61, 11, 14.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (62, 12, 18.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (63, 13, 26.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (64, 14, 30.00, 5);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (65, 15, 19.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (66, 16, 12.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (67, 17, 22.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (68, 18, 24.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (69, 19, 17.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (70, 20, 29.00, 5);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (71, 21, 15.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (72, 22, 13.00, 1);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (73, 23, 25.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (74, 24, 28.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (75, 25, 18.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (76, 26, 20.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (77, 27, 14.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (78, 28, 19.00, 3);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (79, 29, 26.00, 4);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (80, 30, 16.00, 2);
INSERT INTO public.entradas (identrada, idcliente, precio_total, numero_entradas) VALUES (81, NULL, 10.00, 1);


--
-- TOC entry 4854 (class 0 OID 16407)
-- Dependencies: 219
-- Data for Name: pelicula; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (1, 'Interestelar', 'En un futuro donde la Tierra enfrenta una grave crisis ambiental y alimentaria, la humanidad busca una nueva oportunidad de sobrevivir. Un grupo de astronautas, liderados por el piloto y exingeniero Cooper, es enviado a través de un agujero de gusano cerca de Saturno en una misión interestelar para encontrar un nuevo hogar para la humanidad. La travesía pone a prueba los límites del tiempo, el espacio y los lazos familiares, mientras exploran mundos desconocidos y enfrentan dilemas morales sobre el destino de la especie humana.', 'https://m.media-amazon.com/images/I/71GTnYW5ejL._AC_UF894,1000_QL80_.jpg', 2014, 'Ciencia Ficción', 'PG-13', 170, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (2, 'Misión Rescate', 'Durante una misión tripulada a Marte, el astronauta Mark Watney es dado por muerto tras una feroz tormenta y abandonado por su equipo. Sin embargo, Watney sobrevive y se encuentra solo en un planeta hostil. Con recursos limitados y un ingenio extraordinario, debe encontrar la manera de mantenerse con vida y comunicarse con la NASA. Mientras tanto, en la Tierra, un equipo internacional de científicos se embarca en una misión de rescate épica contra el tiempo.', 'https://image.tmdb.org/t/p/original/jPvNTtQMtLJrEqPZF1FbMGmiHwu.jpg', 2015, 'Drama', 'PG-13', 144, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (3, 'Ready Player One', 'En un futuro distópico, la humanidad escapa de la cruda realidad viviendo en un mundo virtual llamado OASIS. Wade Watts, un joven huérfano, dedica su vida a explorar este vasto universo digital. Tras la muerte de su creador, se lanza una competencia que promete al ganador el control total del OASIS y una fortuna inimaginable. Para lograrlo, Wade debe resolver acertijos basados en la cultura pop y enfrentarse a corporaciones dispuestas a todo para ganar el premio.', 'https://pics.filmaffinity.com/Ready_Player_One-508487059-large.jpg', 2018, 'Ciencia Ficción', 'PG-13', 140, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (4, 'Top Gun: Maverick', 'Después de más de 30 años de servicio como uno de los mejores pilotos de la Marina, Pete \"Maverick\" Mitchell sigue empujando los límites como un valiente piloto de pruebas. Sin embargo, su carrera toma un giro inesperado cuando es llamado para entrenar a un grupo de jóvenes aviadores de élite en una misión que requiere lo mejor de ellos. Entre sus alumnos está el hijo de su fallecido amigo Goose, lo que reabre heridas del pasado y pone a prueba su liderazgo y habilidades.', 'https://m.media-amazon.com/images/M/MV5BMDBkZDNjMWEtOTdmMi00NmExLTg5MmMtNTFlYTJlNWY5YTdmXkEyXkFqcGc@._V1_.jpg', 2022, 'Acción', 'PG-13', 131, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (5, 'Tron Legacy', 'Sam Flynn, un joven experto en tecnología, descubre una pista que podría llevarlo a encontrar a su padre desaparecido, Kevin Flynn, un brillante programador de videojuegos. En su búsqueda, es transportado al mundo digital que su padre creó, un universo de programas y gladiadores cibernéticos. Juntos, padre e hijo deben enfrentar al despiadado CLU, una inteligencia artificial corrupta, para intentar escapar de este peligroso y visualmente deslumbrante mundo virtual.', 'https://pics.filmaffinity.com/TRON_Legacy-165554081-large.jpg', 2010, 'Ciencia Ficción', 'PG', 125, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (6, 'Batman (Christopher Nolan)', 'En la gótica ciudad de Gotham, Bruce Wayne, un millonario con un oscuro pasado, se transforma en el justiciero conocido como Batman. En esta entrega, enfrenta a su mayor desafío hasta ahora: el Joker, un anarquista psicótico que siembra el caos y amenaza con destruir los principios mismos de la ciudad. Mientras lidia con dilemas morales y personales, Batman debe proteger a quienes ama y salvar a Gotham del caos absoluto.', 'https://img.buzzfeed.com/buzzfeed-static/static/2023-07/18/21/asset/8767d651276c/sub-buzz-646-1689714795-2.jpg', 2008, 'Acción', 'PG-13', 152, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (7, 'The Grey', 'Tras un accidente aéreo devastador en las heladas tierras de Alaska, un grupo de hombres debe enfrentarse no solo a las condiciones extremas del clima, sino también a una manada de lobos salvajes que los acechan sin tregua. Liderados por John Ottway, un hombre con un pasado trágico, los sobrevivientes intentan encontrar refugio mientras luchan contra sus propios miedos y el despiadado entorno que los rodea.', 'https://m.media-amazon.com/images/I/51lSd7KoA9L.jpg', 2011, 'Aventura', 'R', 117, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (8, 'Parásitos', 'En una sátira social que expone las profundas desigualdades de clase, la familia Kim, ingeniosa pero empobrecida, encuentra la manera de infiltrarse en la vida de la adinerada familia Park. Mientras los Kim se instalan en sus nuevos roles como empleados de confianza, una serie de giros inesperados revela los secretos oscuros de ambos mundos. La convivencia de estas dos familias culmina en un clímax impredecible que redefine las relaciones humanas.', 'https://www.revistaclinicacontemporanea.org/jats_files/1989-9912-cc-11-2-e16-gf01.jpg', 2019, 'Drama', 'R', 132, 'Corea del Sur');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (9, 'Coco', 'Miguel, un joven con el sueño de convertirse en músico, se enfrenta a la oposición de su familia, que ha prohibido la música durante generaciones. Durante la celebración del Día de los Muertos, Miguel es transportado accidentalmente al mundo de los muertos, donde conoce a sus ancestros y a un pícaro llamado Héctor. Juntos, emprenden un viaje para desentrañar un misterio familiar mientras Miguel busca su verdadero destino.', 'https://i.ebayimg.com/images/g/6IkAAOSwMw1hZOzG/s-l1200.png', 2017, 'Animación', 'PG', 105, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (10, 'El Padrino', 'En el corazón de la mafia italoamericana, Don Vito Corleone es el poderoso patriarca de una de las familias criminales más influyentes de Nueva York. Cuando un intento de asesinato pone en peligro su imperio, su hijo Michael, inicialmente reacio a participar en los negocios familiares, se ve obligado a tomar las riendas. Lo que sigue es una historia épica de traición, venganza y la lucha por el poder en el mundo del crimen organizado.', 'https://m.media-amazon.com/images/I/61qssoQNLZL._AC_UF894,1000_QL80_.jpg', 1972, 'Crimen', 'R', 175, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (11, 'Titanic', 'En 1912, durante el viaje inaugural del lujoso trasatlántico Titanic, se desarrolla un apasionado romance entre Jack, un joven artista sin recursos, y Rose, una joven de la alta sociedad atrapada en un compromiso infeliz. Mientras su amor florece en medio de las diferencias de clase, deben enfrentarse al fatídico destino del barco, que choca contra un iceberg en una de las tragedias más conocidas de la historia marítima.', 'https://static.wikia.nocookie.net/greatestmovies/images/4/4c/Titanic.jpeg/revision/latest/scale-to-width-down/667?cb=20230531231117', 1997, 'Romance', 'PG-13', 195, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (12, 'Gladiador', 'Máximo Décimo Meridio, un respetado general romano, es traicionado por el emperador Cómodo, quien asesina a su familia y lo condena a la esclavitud. Convertido en gladiador, Máximo se alza como un héroe en la arena, ganándose el favor del pueblo y preparando el terreno para vengar la muerte de sus seres queridos mientras desafía al tiránico emperador.', 'https://pics.filmaffinity.com/Gladiator-368149580-large.jpg', 2000, 'Acción', 'R', 155, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (13, 'Matrix', 'Thomas Anderson, conocido en el mundo de los hackers como Neo, descubre una impactante verdad: el mundo en el que vive es una simulación creada por máquinas para mantener a la humanidad bajo control. Con la ayuda de Morfeo y Trinity, Neo debe aceptar su destino como el Elegido, liderando la rebelión contra las máquinas y enfrentando a sus agentes en un mundo lleno de acción, filosofía y ciencia ficción.', 'https://image.tmdb.org/t/p/original/ulf1aY9LXciRX2IpnJksCDJOWvp.jpg', 1999, 'Ciencia Ficción', 'R', 136, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (14, 'Forrest Gump', 'Forrest Gump, un hombre con un bajo coeficiente intelectual pero un corazón lleno de bondad, relata su increíble vida mientras se cruza con algunos de los momentos históricos más importantes de Estados Unidos. Desde convertirse en estrella del fútbol americano hasta pelear en Vietnam y fundar una exitosa empresa, Forrest muestra cómo la simplicidad y la bondad pueden transformar vidas.', 'https://pics.filmaffinity.com/Forrest_Gump-212765827-large.jpg', 1994, 'Drama', 'PG-13', 142, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (15, 'Avatar', 'Jake Sully, un exmarine parapléjico, es enviado al exuberante mundo de Pandora para participar en el programa Avatar, donde controla un cuerpo alienígena creado genéticamente. Mientras se adentra en la cultura de los Na’vi, se enamora de Neytiri y descubre la amenaza que representa la explotación humana del planeta. Jake debe decidir de qué lado está en una épica batalla por el futuro de Pandora.', 'https://m.media-amazon.com/images/I/61OUGpUfAyL._AC_UF894,1000_QL80_.jpg', 2009, 'Ciencia Ficción', 'PG-13', 162, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (16, 'El Señor de los Anillos: La Comunidad del Anillo', 'Frodo Bolsón, un hobbit de la tranquila Comarca, se embarca en un peligroso viaje junto a una comunidad formada por hombres, elfos, enanos y magos. Su misión es destruir el Anillo Único, un objeto de inmenso poder creado por Sauron, el Señor Oscuro. El viaje los lleva a través de tierras peligrosas, enfrentando enemigos mortales y desafíos que pondrán a prueba su coraje y unidad.', 'https://pics.filmaffinity.com/El_seanor_de_los_anillos_La_comunidad_del_anillo-744631610-large.jpg', 2001, 'Fantasía', 'PG-13', 178, 'Nueva Zelanda');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (17, 'Star Wars: Una Nueva Esperanza', 'Luke Skywalker, un joven granjero de un remoto planeta, descubre que tiene un destino más grande cuando conoce a Obi-Wan Kenobi, un caballero Jedi. Juntos, se unen a la Alianza Rebelde para enfrentarse al malvado Imperio Galáctico y rescatar a la Princesa Leia. Mientras lucha por derrotar a las fuerzas del mal, Luke empieza a descubrir el poder de la Fuerza en su interior.', 'https://play-lh.googleusercontent.com/XoU08lRJe5_HWSfTfL3B41YB255X0lFQSR3vE_nIxcBEOqZDQLDcJLjf4Zb0QCyf1UTsBQ', 1977, 'Ciencia Ficción', 'PG', 121, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (18, 'Inception', 'Dom Cobb, un ladrón con la habilidad de infiltrarse en los sueños de otras personas para robar secretos, es contratado para realizar una tarea aún más difícil: implantar una idea en la mente de un objetivo, un proceso conocido como \"inception\". Para lograrlo, reúne un equipo especializado y se adentra en un complejo mundo onírico donde el tiempo y la realidad se confunden, enfrentándose a los fantasmas de su pasado.', 'https://www.aceprensa.com/wp-content/uploads/2010/08/27205-0.jpg', 2010, 'Ciencia Ficción', 'PG-13', 148, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (19, 'Jurassic Park', 'En una isla remota, un visionario empresario crea un parque temático único donde los visitantes pueden observar dinosaurios traídos a la vida gracias a la ingeniería genética. Sin embargo, cuando el sistema de seguridad del parque falla, los visitantes y el personal quedan atrapados en una carrera por sobrevivir mientras los depredadores prehistóricos se desatan.', 'https://m.media-amazon.com/images/I/51WOG1qwJgL._AC_UF1000,1000_QL80_.jpg', 1993, 'Aventura', 'PG-13', 127, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (20, 'El Resplandor', 'Jack Torrance, un escritor en busca de inspiración, acepta el trabajo de cuidar un hotel remoto y desolado durante el invierno. Acompañado de su esposa Wendy y su hijo Danny, quien tiene un don psíquico conocido como \"el resplandor\", Jack comienza a perder la cordura debido a las fuerzas sobrenaturales del hotel. La estancia se convierte en una pesadilla cuando la familia debe enfrentarse a los horrores que habitan en el lugar.', 'https://images.justwatch.com/poster/129659342/s718/el-resplandor.jpg', 1980, 'Terror', 'R', 146, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (21, 'Rocky', 'Rocky Balboa, un boxeador desconocido de Filadelfia, recibe la inesperada oportunidad de luchar contra Apollo Creed, el campeón mundial de peso pesado. A través de un intenso entrenamiento y con el apoyo de su entrenador Mickey y su amada Adrian, Rocky se prepara para enfrentarse a un oponente mucho más experimentado. Su historia se convierte en una inspiradora lección de perseverancia y superación personal.', 'rocky.jpg', 1976, 'Drama', 'PG', 120, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (22, 'Pulp Fiction', 'A través de un relato no lineal, \"Pulp Fiction\" entrelaza las historias de varios personajes en el mundo del crimen en Los Ángeles. Vincent Vega y Jules Winnfield son dos sicarios con una filosofía única sobre la vida; Mia Wallace es la esposa de su jefe, Marsellus, quien también enfrenta un combate con Butch, un boxeador que decide no seguir las reglas. La película explora violencia, humor negro y el destino con un estilo icónico.', 'pulp_fiction.jpg', 1994, 'Crimen', 'R', 154, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (23, 'Toy Story', 'En el mundo de los juguetes de Andy, Woody, un vaquero clásico, lidera al grupo hasta que la llegada de Buzz Lightyear, un moderno guardián espacial, amenaza su lugar como el juguete favorito. Mientras compiten por la atención de Andy, los dos deben aprender a trabajar juntos para sobrevivir en un mundo lleno de aventuras y desafíos fuera de la habitación del niño.', 'toy_story.jpg', 1995, 'Animación', 'G', 81, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (24, 'The Revenant', 'Hugh Glass, un explorador del siglo XIX, es brutalmente atacado por un oso y dado por muerto por sus compañeros tras una traición. A pesar de sus heridas, Glass emprende un arduo viaje por la inhóspita naturaleza salvaje, impulsado por su instinto de supervivencia y el deseo de vengarse de quienes lo abandonaron. Su lucha se convierte en un testimonio del espíritu humano frente a la adversidad.', 'the_revenant.jpg', 2015, 'Drama', 'R', 156, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (25, 'Amélie', 'Amélie Poulain es una joven peculiar que vive en París y trabaja como camarera. Un día, encuentra una caja escondida en su apartamento y decide devolverla a su dueño, lo que la inspira a mejorar la vida de quienes la rodean de maneras inesperadas. A medida que ayuda a los demás, Amélie también emprende un viaje de autodescubrimiento y amor, transformando su visión del mundo.', 'amelie.jpg', 2001, 'Romance', 'R', 122, 'Francia');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (26, 'La La Land', 'Mia, una aspirante a actriz, y Sebastian, un pianista de jazz, se conocen en Los Ángeles mientras luchan por alcanzar sus sueños. A medida que su relación crece, también enfrentan decisiones difíciles sobre el amor y sus carreras. La película es un homenaje vibrante a los musicales clásicos y una reflexión sobre los sacrificios necesarios para perseguir la pasión y la ambición.', 'la_la_land.jpg', 2016, 'Romance', 'PG-13', 128, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (27, 'Whiplash', 'Andrew Neiman es un joven baterista decidido a triunfar en el mundo del jazz. Bajo la estricta y despiadada tutela de Terence Fletcher, un instructor que exige perfección a cualquier costo, Andrew se enfrenta a pruebas extremas que desafían sus límites físicos y emocionales. La película explora la obsesión, el sacrificio y el precio de la grandeza en el mundo competitivo de la música.', 'whiplash.jpg', 2014, 'Drama', 'R', 106, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (28, 'It', 'En el pequeño pueblo de Derry, un grupo de niños conocido como \"El Club de los Perdedores\" enfrenta sus peores miedos cuando son aterrorizados por Pennywise, un payaso malvado que se alimenta del miedo y las vidas de los niños. Unidos por su amistad, los jóvenes luchan por detener a la aterradora criatura antes de que haga más daño, enfrentando sus propios traumas en el proceso.', 'it.jpg', 2017, 'Terror', 'R', 135, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (29, 'Mad Max: Fury Road', 'En un mundo postapocalíptico, Max Rockatansky se une a Furiosa, una guerrera rebelde, para ayudar a un grupo de mujeres a escapar de Immortan Joe, un tirano que las mantiene cautivas. A través de una persecución frenética por el desierto, Max y Furiosa deben enfrentar a un ejército de guerreros en vehículos modificados, en una historia de redención, resistencia y supervivencia.', 'mad_max.jpg', 2015, 'Acción', 'R', 120, 'Australia');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (30, 'El Gran Hotel Budapest', 'Gustave H., el legendario conserje de un famoso hotel europeo, se ve envuelto en una serie de aventuras con Zero, su leal aprendiz, tras ser acusado injustamente de asesinato. En medio de un mundo de intriga, codicia y arte, los dos intentan recuperar un valioso cuadro renacentista y enfrentarse a una familia vengativa. La película mezcla humor y nostalgia con un estilo visual distintivo.', 'gran_hotel_budapest.jpg', 2014, 'Comedia', 'R', 99, 'Reino Unido');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (31, 'El Laberinto del Fauno', 'En la España fascista de los años 40, la joven Ofelia descubre un mundo mágico y oscuro al encontrarse con un fauno en un laberinto cercano a su nuevo hogar. Mientras su padrastro, un cruel capitán franquista, impone su autoridad, Ofelia enfrenta una serie de pruebas fantásticas que pondrán a prueba su valentía y su fe en la magia. Una historia de fantasía mezclada con la dureza de la realidad.', 'laberinto_fauno.jpg', 2006, 'Fantasía', 'R', 118, 'México');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (32, 'Kill Bill: Volumen 1', 'Beatrix Kiddo, conocida como \"La Novia\", despierta de un coma tras ser traicionada y atacada por su antiguo equipo de asesinos liderado por Bill. Con una lista de nombres en mano, Beatrix emprende un viaje de venganza sangriento y sin descanso, enfrentándose a sus antiguos compañeros y desafiando todo para alcanzar su objetivo final: matar a Bill.', 'kill_bill.jpg', 2003, 'Acción', 'R', 111, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (33, 'Casino', 'Sam \"Ace\" Rothstein, un brillante apostador, es elegido para administrar un casino en Las Vegas por la mafia. Mientras Ace intenta mantener el control, se enfrenta a su impredecible esposa Ginger y a su violento amigo Nicky, lo que lleva a una espiral de corrupción, traiciones y ambición descontrolada. Una épica sobre el auge y caída del poder en el mundo del juego y el crimen organizado.', 'casino.jpg', 1995, 'Crimen', 'R', 178, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (34, 'La Vida es Bella', 'En la Italia ocupada durante la Segunda Guerra Mundial, Guido, un hombre optimista y lleno de humor, utiliza su ingenio para proteger a su hijo pequeño de los horrores de un campo de concentración. A través de juegos y fantasías, Guido intenta mantener viva la esperanza y la inocencia de su hijo en medio de la tragedia. Una conmovedora historia de amor, sacrificio y esperanza.', 'vida_es_bella.jpg', 1997, 'Drama', 'PG-13', 116, 'Italia');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (35, 'E.T. el Extraterrestre', 'Elliott, un niño tímido, descubre a un extraterrestre abandonado en la Tierra y decide ayudarlo a regresar a su hogar. Mientras desarrollan un vínculo único, Elliott y sus amigos deben proteger a E.T. de las autoridades que quieren capturarlo. Una historia conmovedora sobre la amistad, la familia y la conexión más allá de las estrellas.', 'et.jpg', 1982, 'Ciencia Ficción', 'PG', 115, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (36, 'Blade Runner', 'En un futuro distópico, Rick Deckard es un cazador de androides encargado de retirar a los replicantes, seres artificiales que se han rebelado. Mientras persigue a un grupo de replicantes liderados por el carismático Roy Batty, Deckard comienza a cuestionar los límites entre lo humano y lo artificial, enfrentándose a dilemas éticos y existenciales en un mundo sombrío y tecnológicamente avanzado.', 'blade_runner.jpg', 1982, 'Ciencia Ficción', 'R', 117, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (37, 'La Naranja Mecánica', 'Alex DeLarge, un joven líder de una pandilla violenta, es arrestado y sometido a un controvertido tratamiento experimental que busca erradicar sus tendencias criminales. A medida que pierde su libre albedrío, Alex se encuentra indefenso en una sociedad que es tan corrupta y brutal como él mismo. Una provocativa reflexión sobre la moralidad, la libertad y el control social.', 'naranja_mecanica.jpg', 1971, 'Drama', 'R', 136, 'Reino Unido');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (38, 'La Lista de Schindler', 'Durante la Segunda Guerra Mundial, Oskar Schindler, un empresario alemán, utiliza su fábrica para salvar a más de mil judíos de los campos de concentración. A medida que presencia los horrores del Holocausto, Schindler pasa de ser un oportunista a un héroe humanitario, arriesgando todo para proteger a sus trabajadores. Una poderosa historia de sacrificio y humanidad en tiempos de oscuridad.', 'lista_schindler.jpg', 1993, 'Drama', 'R', 195, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (39, 'El Bueno, el Malo y el Feo', 'En medio de la Guerra Civil estadounidense, tres pistoleros —un cazarrecompensas, un forajido y un desconocido con su propio código moral— compiten por encontrar un tesoro enterrado en un cementerio. Sus caminos se cruzan en una serie de enfrentamientos llenos de tensión y desconfianza, culminando en un duelo inolvidable en busca del oro. Una obra maestra del cine western.', 'bueno_malo_feo.jpg', 1966, 'Western', 'R', 161, 'Italia');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (40, 'Cinema Paradiso', 'Salvatore, un famoso director de cine, regresa a su pequeño pueblo italiano para el funeral de Alfredo, el proyeccionista que lo inspiró de niño. A través de recuerdos nostálgicos, Salvatore revive su infancia en el Cinema Paradiso, un lugar donde descubrió su pasión por el cine y formó una profunda amistad con Alfredo. Una emotiva celebración del amor por el séptimo arte.', 'cinema_paradiso.jpg', 1988, 'Drama', 'R', 155, 'Italia');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (41, 'Django Sin Cadenas', 'Ambientada en el sur de Estados Unidos antes de la Guerra Civil, Django, un esclavo liberado, forma una alianza con un cazarrecompensas alemán llamado Dr. King Schultz. Juntos emprenden un peligroso viaje para liberar a la esposa de Django, Broomhilda, de las garras de un brutal terrateniente en una plantación. Una historia de justicia, venganza y amor en tiempos de esclavitud.', 'django.jpg', 2012, 'Western', 'R', 165, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (42, 'Los Siete Samuráis', 'En el Japón feudal, un pueblo aterrorizado por bandidos contrata a siete samuráis errantes para protegerse. Liderados por el sabio Kambei, los samuráis enseñan a los aldeanos a defenderse mientras se preparan para un enfrentamiento épico. Una obra maestra que combina acción, drama y la exploración de temas como el honor y el sacrificio.', 'siete_samurais.jpg', 1954, 'Acción', 'NR', 207, 'Japón');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (43, 'Tiempos Modernos', 'En un mundo industrializado y deshumanizado, un obrero anónimo lucha por sobrevivir enfrentándose a las duras condiciones de trabajo y al avance de las máquinas. A través de una serie de situaciones cómicas y conmovedoras, el personaje busca mantener su dignidad y esperanza en un entorno cada vez más hostil. Una crítica social llena de humor y humanidad.', 'tiempos_modernos.jpg', 1936, 'Comedia', 'G', 87, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (44, 'Psicosis', 'Marion Crane, una mujer en fuga tras robar una importante suma de dinero, se detiene en un remoto motel dirigido por el misterioso Norman Bates. A medida que los secretos oscuros del motel salen a la luz, la tensión crece en una historia de intriga, psicología y horror que redefine el género del suspenso.', 'psicosis.jpg', 1960, 'Terror', 'R', 109, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (45, 'El Rey León', 'En la sabana africana, Simba, un joven león heredero al trono, se enfrenta a la traición de su tío Scar, quien asesina a su padre, el rey Mufasa, y lo destierra. Con la ayuda de nuevos amigos, Simba deberá superar su miedo y aceptar su destino como rey para restaurar el equilibrio en su hogar. Una emotiva historia de crecimiento, amor y redención.', 'rey_leon.jpg', 1994, 'Animación', 'G', 88, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (46, 'Harry Potter y la Piedra Filosofal', 'Harry Potter, un niño huérfano, descubre en su undécimo cumpleaños que es un mago y que ha sido aceptado en la escuela de magia Hogwarts. Allí, Harry forma amistades, enfrenta desafíos mágicos y se entera de su conexión con el oscuro mago Voldemort, quien asesinó a sus padres. Una aventura fantástica que da inicio a una saga épica.', 'harry_potter.jpg', 2001, 'Fantasía', 'PG', 152, 'Reino Unido');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (47, 'Los Infiltrados', 'En Boston, un policía encubierto se infiltra en una peligrosa mafia mientras un topo de la misma organización se incrusta en la policía. A medida que ambos intentan descubrir la identidad del otro, la tensión y los giros aumentan en un juego mortal de engaños. Una historia intensa de lealtades divididas y traiciones.', 'infiltrados.jpg', 2006, 'Crimen', 'R', 151, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (48, 'La Chica del Dragón Tatuado', 'El periodista Mikael Blomkvist y la brillante pero conflictiva hacker Lisbeth Salander unen fuerzas para resolver el caso de una joven desaparecida hace décadas en una poderosa familia sueca. Mientras investigan, descubren secretos oscuros y se enfrentan a peligros que pondrán en riesgo sus vidas. Un thriller lleno de misterio e intriga.', 'chica_dragon.jpg', 2011, 'Suspenso', 'R', 158, 'Suecia');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (49, 'El Irlandés', 'Frank Sheeran, un sicario de la mafia, narra su vida como veterano de guerra convertido en asesino a sueldo. A través de varias décadas, Frank detalla su relación con el influyente líder sindical Jimmy Hoffa y su implicación en crímenes que cambiaron la historia. Una épica historia de poder, lealtad y arrepentimiento en el mundo del crimen organizado.', 'irlandes.jpg', 2019, 'Drama', 'R', 209, 'EE.UU.');
INSERT INTO public.pelicula (idpelicula, titulo, sinopsis, cartel, anio, genero, clasificacion, duracion, nacionalidad) VALUES (50, 'Apocalipsis Ahora', 'Durante la guerra de Vietnam, el capitán Willard es enviado en una peligrosa misión río arriba para eliminar al coronel Kurtz, un oficial renegado que ha creado su propio reino en la selva. Mientras Willard se adentra en el caos de la guerra, se enfrenta a la locura, el horror y el dilema moral de su misión. Una exploración de la oscuridad humana en tiempos de conflicto.', 'apocalipsis_ahora.jpg', 1979, 'Drama', 'R', 153, 'EE.UU.');


--
-- TOC entry 4855 (class 0 OID 16417)
-- Dependencies: 220
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (1, 1, 1, 7.50, '2023-01-01');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (2, 1, 1, 7.50, '2023-01-01');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (3, 2, 2, 6.67, '2023-01-02');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (4, 2, 2, 6.67, '2023-01-02');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (5, 2, 2, 6.66, '2023-01-02');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (6, 3, 3, 10.00, '2023-01-03');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (7, 4, 4, 6.25, '2023-01-04');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (8, 4, 4, 6.25, '2023-01-04');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (9, 4, 4, 6.25, '2023-01-04');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (10, 4, 4, 6.25, '2023-01-04');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (1, 5, 5, 12.00, '2023-01-05');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (2, 6, 6, 9.00, '2023-01-06');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (3, 6, 6, 9.00, '2023-01-06');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (4, 7, 7, 7.33, '2023-01-07');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (5, 7, 7, 7.33, '2023-01-07');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (6, 7, 7, 7.34, '2023-01-07');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (7, 8, 8, 8.00, '2023-01-08');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (8, 8, 8, 8.00, '2023-01-08');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (9, 9, 9, 6.00, '2023-01-09');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (10, 9, 9, 6.00, '2023-01-09');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (1, 1, 1, 7.50, '2023-01-01');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (2, 2, 2, 7.50, '2023-01-01');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (3, 3, 3, 6.67, '2023-01-02');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (4, 4, 4, 6.67, '2023-01-02');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (5, 5, 5, 6.66, '2023-01-02');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (6, 6, 6, 10.00, '2023-01-03');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (7, 7, 7, 6.25, '2023-01-04');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (8, 8, 8, 6.25, '2023-01-04');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (9, 9, 9, 6.25, '2023-01-04');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (10, 10, 10, 6.25, '2023-01-04');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (11, 11, 11, 12.00, '2023-01-05');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (12, 12, 12, 9.00, '2023-01-06');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (13, 13, 13, 9.00, '2023-01-06');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (14, 14, 14, 7.33, '2023-01-07');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (15, 15, 15, 7.33, '2023-01-07');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (16, 16, 16, 7.34, '2023-01-07');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (17, 17, 17, 8.00, '2023-01-08');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (18, 18, 18, 8.00, '2023-01-08');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (19, 19, 19, 6.00, '2023-01-09');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (20, 20, 20, 6.00, '2023-01-09');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (21, 21, 21, 7.50, '2023-01-10');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (22, 22, 22, 6.30, '2023-01-11');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (23, 23, 23, 8.20, '2023-01-12');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (24, 24, 24, 7.10, '2023-01-13');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (25, 25, 25, 9.00, '2023-01-14');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (26, 26, 26, 7.80, '2023-01-15');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (27, 27, 27, 8.30, '2023-01-16');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (28, 28, 28, 9.50, '2023-01-17');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (29, 29, 29, 7.10, '2023-01-18');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (30, 30, 30, 6.50, '2023-01-19');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (31, 31, 31, 8.30, '2023-01-20');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (32, 32, 32, 7.00, '2023-01-21');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (33, 33, 33, 9.20, '2023-01-22');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (34, 34, 34, 7.30, '2023-01-23');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (35, 35, 35, 6.50, '2023-01-24');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (36, 36, 36, 7.20, '2023-01-25');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (37, 37, 37, 7.50, '2023-01-26');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (38, 38, 38, 8.10, '2023-01-27');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (39, 39, 39, 6.60, '2023-01-28');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (40, 40, 40, 9.00, '2023-01-29');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (41, 41, 41, 8.40, '2023-01-30');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (42, 42, 42, 7.50, '2023-01-31');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (43, 43, 43, 8.00, '2023-02-01');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (44, 44, 44, 7.60, '2023-02-02');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (45, 45, 45, 7.20, '2023-02-03');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (46, 46, 46, 6.50, '2023-02-04');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (47, 47, 47, 6.80, '2023-02-05');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (48, 48, 48, 7.00, '2023-02-06');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (49, 49, 49, 7.40, '2023-02-07');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (50, 50, 50, 7.80, '2023-02-08');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (1, 51, 51, 8.10, '2023-02-09');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (2, 52, 52, 6.90, '2023-02-10');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (3, 53, 53, 7.50, '2023-02-11');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (4, 54, 54, 8.20, '2023-02-12');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (5, 55, 55, 7.00, '2023-02-13');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (6, 56, 56, 9.00, '2023-02-14');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (7, 57, 57, 7.60, '2023-02-15');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (8, 58, 58, 8.30, '2023-02-16');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (9, 59, 59, 7.50, '2023-02-17');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (10, 60, 60, 6.80, '2023-02-18');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (11, 61, 61, 7.10, '2023-02-19');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (12, 62, 62, 6.50, '2023-02-20');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (13, 63, 63, 7.30, '2023-02-21');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (14, 64, 64, 8.00, '2023-02-22');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (15, 65, 65, 6.90, '2023-02-23');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (16, 66, 66, 7.80, '2023-02-24');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (17, 67, 67, 8.10, '2023-02-25');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (18, 68, 68, 6.60, '2023-02-26');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (19, 69, 69, 8.20, '2023-02-27');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (20, 70, 70, 7.40, '2023-02-28');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (21, 71, 71, 9.10, '2023-03-01');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (22, 72, 72, 6.90, '2023-03-02');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (23, 73, 73, 7.20, '2023-03-03');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (24, 74, 74, 8.00, '2023-03-04');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (25, 75, 75, 7.50, '2023-03-05');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (26, 76, 76, 6.80, '2023-03-06');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (27, 77, 77, 7.60, '2023-03-07');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (28, 78, 78, 8.30, '2023-03-08');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (29, 79, 79, 7.40, '2023-03-09');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (30, 80, 80, 6.90, '2023-03-10');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (31, 1, 81, 8.10, '2023-03-11');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (32, 2, 82, 7.00, '2023-03-12');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (33, 3, 83, 7.30, '2023-03-13');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (34, 4, 84, 6.80, '2023-03-14');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (35, 5, 85, 7.60, '2023-03-15');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (36, 6, 86, 7.20, '2023-03-16');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (37, 7, 87, 6.50, '2023-03-17');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (38, 8, 88, 8.00, '2023-03-18');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (39, 9, 89, 7.50, '2023-03-19');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (40, 10, 90, 7.80, '2023-03-20');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (41, 11, 91, 6.90, '2023-03-21');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (42, 12, 92, 7.60, '2023-03-22');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (43, 13, 93, 7.20, '2023-03-23');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (44, 14, 94, 6.70, '2023-03-24');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (45, 15, 95, 8.30, '2023-03-25');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (46, 16, 96, 7.10, '2023-03-26');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (47, 17, 97, 7.40, '2023-03-27');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (48, 18, 98, 6.80, '2023-03-28');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (49, 19, 99, 7.20, '2023-03-29');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (50, 20, 100, 6.90, '2023-03-30');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (3, 81, 17, 10.00, '2025-01-20');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (1, 0, 4, 10.00, '2025-01-25');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (11, 0, 4, 10.00, '2025-01-25');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (13, 0, 4, 10.00, '2025-01-25');
INSERT INTO public.reserva (idbutaca, identrada, idsesion, coste, fecha_reserva) VALUES (15, 0, 15, 10.00, '2025-01-27');


--
-- TOC entry 4856 (class 0 OID 16421)
-- Dependencies: 221
-- Data for Name: sala; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (1, 100, 50);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (2, 150, 120);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (3, 80, 40);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (4, 200, 180);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (5, 90, 60);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (6, 120, 100);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (7, 70, 30);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (8, 130, 110);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (9, 110, 85);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (10, 140, 125);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (11, 160, 130);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (12, 170, 140);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (13, 180, 150);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (14, 200, 170);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (15, 75, 50);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (16, 90, 70);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (17, 140, 120);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (18, 110, 95);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (19, 150, 140);
INSERT INTO public.sala (idsala, capacidad, ocupacion) VALUES (20, 160, 150);


--
-- TOC entry 4857 (class 0 OID 16424)
-- Dependencies: 222
-- Data for Name: sesion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (1, '2023-01-01', '18:00:00', 'Español', 1, 1);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (2, '2023-01-02', '20:00:00', 'Inglés', 2, 1);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (3, '2023-01-03', '16:00:00', 'Español', 3, 1);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (4, '2023-01-04', '22:00:00', 'Francés', 4, 1);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (5, '2023-01-05', '19:30:00', 'Alemán', 5, 1);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (6, '2023-01-06', '17:00:00', 'Italiano', 6, 1);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (7, '2023-01-07', '21:00:00', 'Coreano', 7, 1);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (8, '2023-01-08', '15:00:00', 'Japonés', 8, 1);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (9, '2023-01-09', '23:00:00', 'Español', 9, 1);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (10, '2023-01-10', '14:00:00', 'Inglés', 10, 1);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (11, '2023-01-11', '18:30:00', 'Español', 1, 2);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (12, '2023-01-12', '20:30:00', 'Inglés', 1, 2);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (13, '2023-01-13', '21:30:00', 'Español', 1, 2);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (14, '2023-01-14', '17:00:00', 'Francés', 1, 2);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (15, '2023-01-15', '19:00:00', 'Alemán', 2, 2);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (16, '2023-01-16', '20:45:00', 'Español', 2, 2);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (17, '2023-01-17', '16:30:00', 'Inglés', 2, 2);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (18, '2023-01-18', '18:00:00', 'Español', 2, 2);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (19, '2023-01-19', '22:15:00', 'Italiano', 3, 2);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (20, '2023-01-20', '15:45:00', 'Español', 3, 2);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (21, '2023-01-21', '17:15:00', 'Inglés', 3, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (22, '2023-01-22', '20:00:00', 'Coreano', 3, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (23, '2023-01-23', '19:45:00', 'Español', 4, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (24, '2023-01-24', '21:15:00', 'Francés', 4, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (25, '2023-01-25', '18:45:00', 'Inglés', 4, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (26, '2023-01-26', '16:15:00', 'Italiano', 4, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (27, '2023-01-27', '22:30:00', 'Español', 5, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (28, '2023-01-28', '17:30:00', 'Alemán', 5, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (29, '2023-01-29', '15:30:00', 'Francés', 5, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (30, '2023-01-30', '19:00:00', 'Japonés', 5, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (31, '2023-01-31', '21:30:00', 'Español', 6, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (32, '2023-02-01', '18:00:00', 'Italiano', 6, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (33, '2023-02-02', '20:30:00', 'Francés', 6, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (34, '2023-02-03', '16:00:00', 'Alemán', 6, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (35, '2023-02-04', '19:30:00', 'Español', 7, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (36, '2023-02-05', '21:00:00', 'Coreano', 7, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (37, '2023-02-06', '15:00:00', 'Japonés', 7, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (38, '2023-02-07', '22:00:00', 'Español', 7, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (39, '2023-02-08', '16:30:00', 'Inglés', 8, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (40, '2023-02-09', '18:00:00', 'Español', 8, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (41, '2023-02-10', '20:00:00', 'Japonés', 8, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (42, '2023-02-11', '14:30:00', 'Coreano', 8, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (43, '2023-02-12', '16:45:00', 'Español', 9, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (44, '2023-02-13', '21:15:00', 'Inglés', 9, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (45, '2023-02-14', '19:45:00', 'Francés', 9, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (46, '2023-02-15', '18:15:00', 'Español', 9, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (47, '2023-02-16', '17:30:00', 'Español', 10, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (48, '2023-02-17', '20:30:00', 'Inglés', 10, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (49, '2023-02-18', '19:00:00', 'Alemán', 10, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (50, '2023-02-19', '21:45:00', 'Francés', 10, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (51, '2023-03-01', '18:00:00', 'Español', 11, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (52, '2023-03-02', '20:30:00', 'Inglés', 11, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (53, '2023-03-03', '16:15:00', 'Francés', 11, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (54, '2023-03-04', '19:45:00', 'Alemán', 11, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (55, '2023-03-05', '21:00:00', 'Español', 11, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (56, '2023-03-06', '17:30:00', 'Italiano', 12, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (57, '2023-03-07', '19:00:00', 'Inglés', 12, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (58, '2023-03-08', '15:45:00', 'Español', 12, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (59, '2023-03-09', '20:00:00', 'Francés', 12, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (60, '2023-03-10', '18:30:00', 'Coreano', 12, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (61, '2023-03-11', '16:00:00', 'Español', 13, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (62, '2023-03-12', '21:15:00', 'Japonés', 13, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (63, '2023-03-13', '19:30:00', 'Inglés', 13, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (64, '2023-03-14', '22:00:00', 'Italiano', 13, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (65, '2023-03-15', '17:45:00', 'Alemán', 13, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (66, '2023-03-16', '20:00:00', 'Español', 14, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (67, '2023-03-17', '14:30:00', 'Francés', 14, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (68, '2023-03-18', '16:30:00', 'Inglés', 14, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (69, '2023-03-19', '18:00:00', 'Japonés', 14, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (70, '2023-03-20', '21:45:00', 'Español', 14, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (71, '2023-03-21', '19:15:00', 'Coreano', 15, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (72, '2023-03-22', '22:30:00', 'Inglés', 15, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (73, '2023-03-23', '18:45:00', 'Español', 15, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (74, '2023-03-24', '20:15:00', 'Francés', 15, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (75, '2023-03-25', '16:00:00', 'Alemán', 15, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (76, '2023-03-26', '17:30:00', 'Italiano', 16, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (77, '2023-03-27', '19:45:00', 'Español', 16, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (78, '2023-03-28', '15:00:00', 'Inglés', 16, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (79, '2023-03-29', '20:00:00', 'Coreano', 16, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (80, '2023-03-30', '22:15:00', 'Francés', 16, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (81, '2023-03-31', '18:00:00', 'Español', 17, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (82, '2023-04-01', '20:30:00', 'Inglés', 17, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (83, '2023-04-02', '14:45:00', 'Japonés', 17, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (84, '2023-04-03', '19:15:00', 'Francés', 17, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (85, '2023-04-04', '16:30:00', 'Español', 17, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (86, '2023-04-05', '21:30:00', 'Italiano', 18, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (87, '2023-04-06', '15:30:00', 'Español', 18, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (88, '2023-04-07', '19:45:00', 'Inglés', 18, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (89, '2023-04-08', '18:15:00', 'Alemán', 18, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (90, '2023-04-09', '22:00:00', 'Coreano', 18, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (91, '2023-04-10', '20:30:00', 'Español', 19, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (92, '2023-04-11', '17:00:00', 'Francés', 19, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (93, '2023-04-12', '16:00:00', 'Japonés', 19, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (94, '2023-04-13', '18:45:00', 'Inglés', 19, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (95, '2023-04-14', '19:30:00', 'Español', 19, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (96, '2023-04-15', '14:00:00', 'Coreano', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (97, '2023-04-16', '15:45:00', 'Inglés', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (98, '2023-04-17', '21:15:00', 'Francés', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (99, '2023-04-18', '20:00:00', 'Español', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (100, '2023-04-19', '22:30:00', 'Italiano', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (101, '2023-04-20', '17:15:00', 'Japonés', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (102, '2023-04-21', '18:30:00', 'Alemán', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (103, '2023-04-22', '19:30:00', 'Español', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (104, '2023-04-23', '21:00:00', 'Inglés', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (105, '2023-04-24', '14:15:00', 'Coreano', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (106, '2023-04-25', '15:30:00', 'Francés', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (107, '2023-04-26', '16:45:00', 'Japonés', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (108, '2023-04-27', '20:15:00', 'Español', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (109, '2023-04-28', '19:00:00', 'Italiano', 20, 0);
INSERT INTO public.sesion (idsesion, fecha, hora, idioma, idpelicula, idsala) VALUES (110, '2023-04-29', '17:30:00', 'Inglés', 20, 0);


--
-- TOC entry 4858 (class 0 OID 16428)
-- Dependencies: 223
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (1, '12345678A', 'Juan', 'Pérez García', '1985-05-20', 'juan.perez@gmail.com', '600123456', 'juanp', 'password1', 100, '1234-5678-9012-3456', '2022-01-01');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (2, '23456789B', 'María', 'Gómez López', '1990-07-15', 'maria.gomez@gmail.com', '600234567', 'mariag', 'password2', 200, '1234-5678-9012-3457', '2022-01-02');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (3, '34567890C', 'Luis', 'Martínez Ruiz', '1988-03-12', 'luis.martinez@gmail.com', '600345678', 'luism', 'password3', 300, '1234-5678-9012-3458', '2022-01-03');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (4, '45678901D', 'Ana', 'Hernández Sánchez', '1995-10-05', 'ana.hernandez@gmail.com', '600456789', 'anah', 'password4', 400, '1234-5678-9012-3459', '2022-01-04');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (5, '56789012E', 'Carlos', 'García Fernández', '1992-08-21', 'carlos.garcia@gmail.com', '600567890', 'carlosg', 'password5', 500, '1234-5678-9012-3460', '2022-01-05');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (6, '67890123F', 'Laura', 'López Torres', '1987-11-30', 'laura.lopez@gmail.com', '600678901', 'laural', 'password6', 600, '1234-5678-9012-3461', '2022-01-06');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (7, '78901234G', 'Miguel', 'González Jiménez', '1993-09-14', 'miguel.gonzalez@gmail.com', '600789012', 'miguelg', 'password7', 700, '1234-5678-9012-3462', '2022-01-07');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (8, '89012345H', 'Elena', 'Díaz Ramírez', '1991-06-18', 'elena.diaz@gmail.com', '600890123', 'elenad', 'password8', 800, '1234-5678-9012-3463', '2022-01-08');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (9, '90123456I', 'Jorge', 'Romero Ortega', '1989-12-25', 'jorge.romero@gmail.com', '600901234', 'jorger', 'password9', 900, '1234-5678-9012-3464', '2022-01-09');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (10, '01234567J', 'Sara', 'Navarro Gil', '1994-04-10', 'sara.navarro@gmail.com', '600012345', 'saran', 'password10', 1000, '1234-5678-9012-3465', '2022-01-10');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (11, '09876543K', 'Diego', 'Pérez López', '1986-02-28', 'diego.perez@gmail.com', '601123456', 'diegop', 'password11', 1200, '1234-5678-9012-3466', '2022-01-11');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (12, '11223344L', 'Silvia', 'Martín Sánchez', '1991-01-17', 'silvia.martin@gmail.com', '602234567', 'silviam', 'password12', 1300, '1234-5678-9012-3467', '2022-01-12');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (13, '12398745M', 'Oscar', 'Rojas Pérez', '1982-04-05', 'oscar.rojas@gmail.com', '603345678', 'oscarr', 'password13', 1400, '1234-5678-9012-3468', '2022-01-13');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (14, '21346587N', 'Sofia', 'Campos Ruiz', '1997-09-12', 'sofia.campos@gmail.com', '604456789', 'sofiac', 'password14', 1500, '1234-5678-9012-3469', '2022-01-14');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (15, '32165487O', 'Manuel', 'Vega Ortega', '1984-06-07', 'manuel.vega@gmail.com', '605567890', 'manuelv', 'password15', 1600, '1234-5678-9012-3470', '2022-01-15');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (16, '65478912P', 'Isabel', 'Suárez Martínez', '1998-11-19', 'isabel.suarez@gmail.com', '606678901', 'isabels', 'password16', 1700, '1234-5678-9012-3471', '2022-01-16');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (17, '78965412Q', 'Ricardo', 'Cruz García', '1980-02-14', 'ricardo.cruz@gmail.com', '607789012', 'ricardoc', 'password17', 1800, '1234-5678-9012-3472', '2022-01-17');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (18, '45612378R', 'Cristina', 'Jiménez López', '1993-05-09', 'cristina.jimenez@gmail.com', '608890123', 'cristinaj', 'password18', 1900, '1234-5678-9012-3473', '2022-01-18');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (19, '85236974S', 'Daniel', 'Torres Fernández', '1989-10-03', 'daniel.torres@gmail.com', '609901234', 'danielt', 'password19', 2000, '1234-5678-9012-3474', '2022-01-19');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (20, '96325874T', 'Patricia', 'Muñoz Ramírez', '1992-07-25', 'patricia.munoz@gmail.com', '610012345', 'patriciam', 'password20', 2100, '1234-5678-9012-3475', '2022-01-20');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (21, '74185296U', 'Alberto', 'Hernández Gil', '1985-08-22', 'alberto.hernandez@gmail.com', '611123456', 'albertoh', 'password21', 2200, '1234-5678-9012-3476', '2022-01-21');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (22, '35715948V', 'Julia', 'Castro Navarro', '1999-12-01', 'julia.castro@gmail.com', '612234567', 'juliac', 'password22', 2300, '1234-5678-9012-3477', '2022-01-22');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (23, '25874196W', 'Francisco', 'Ruiz Méndez', '1975-03-11', 'francisco.ruiz@gmail.com', '613345678', 'franciscor', 'password23', 2400, '1234-5678-9012-3478', '2022-01-23');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (24, '65498712X', 'Paula', 'Santos Vega', '1990-06-17', 'paula.santos@gmail.com', '614456789', 'paulas', 'password24', 2500, '1234-5678-9012-3479', '2022-01-24');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (25, '98745612Y', 'Antonio', 'Moreno López', '1988-04-09', 'antonio.moreno@gmail.com', '615567890', 'antoniom', 'password25', 2600, '1234-5678-9012-3480', '2022-01-25');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (26, '36925814Z', 'Alicia', 'Ramírez Gómez', '1996-03-18', 'alicia.ramirez@gmail.com', '616678901', 'aliciar', 'password26', 2700, '1234-5678-9012-3481', '2022-01-26');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (27, '25896347A', 'Fernando', 'López Torres', '1981-05-22', 'fernando.lopez@gmail.com', '617789012', 'fernandol', 'password27', 2800, '1234-5678-9012-3482', '2022-01-27');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (28, '14785236B', 'Carmen', 'Duarte Hernández', '1994-09-30', 'carmen.duarte@gmail.com', '618890123', 'carmend', 'password28', 2900, '1234-5678-9012-3483', '2022-01-28');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (29, '78945612C', 'Andrés', 'Ortiz González', '1983-07-11', 'andres.ortiz@gmail.com', '619901234', 'andreso', 'password29', 3000, '1234-5678-9012-3484', '2022-01-29');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (30, '45612378D', 'Marta', 'Reyes López', '1990-02-15', 'marta.reyes@gmail.com', '620012345', 'martar', 'password30', 3100, '1234-5678-9012-3485', '2022-01-30');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (31, '85236974E', 'Enrique', 'Cano Sánchez', '1987-11-03', 'enrique.cano@gmail.com', '621123456', 'enriquec', 'password31', 3200, '1234-5678-9012-3486', '2022-01-31');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (32, '36925874F', 'Natalia', 'Cruz Fernández', '1992-06-07', 'natalia.cruz@gmail.com', '622234567', 'nataliac', 'password32', 3300, '1234-5678-9012-3487', '2022-02-01');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (33, '15975384G', 'David', 'Hidalgo Torres', '1989-09-22', 'david.hidalgo@gmail.com', '623345678', 'davidh', 'password33', 3400, '1234-5678-9012-3488', '2022-02-02');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (34, '75395186H', 'Lucía', 'Vargas García', '1995-04-30', 'lucia.vargas@gmail.com', '624456789', 'luciav', 'password34', 3500, '1234-5678-9012-3489', '2022-02-03');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (35, '98765432I', 'Sergio', 'Gil Martínez', '1984-10-12', 'sergio.gil@gmail.com', '625567890', 'sergiog', 'password35', 3600, '1234-5678-9012-3490', '2022-02-04');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (36, '65432198J', 'Clara', 'Morales Jiménez', '1982-12-25', 'clara.morales@gmail.com', '626678901', 'claram', 'password36', 3700, '1234-5678-9012-3491', '2022-02-05');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (37, '32145687K', 'Alba', 'Méndez Ruiz', '1999-08-19', 'alba.mendez@gmail.com', '627789012', 'albam', 'password37', 3800, '1234-5678-9012-3492', '2022-02-06');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (38, '45698723L', 'Roberto', 'Navarro Vega', '1996-01-07', 'roberto.navarro@gmail.com', '628890123', 'roberton', 'password38', 3900, '1234-5678-9012-3493', '2022-02-07');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (39, '15948623M', 'Inés', 'Paredes Ortega', '1988-05-16', 'ines.paredes@gmail.com', '629901234', 'inesp', 'password39', 4000, '1234-5678-9012-3494', '2022-02-08');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (40, '75315984N', 'Mario', 'Ortega Gil', '1985-03-09', 'mario.ortega@gmail.com', '630012345', 'marioo', 'password40', 4100, '1234-5678-9012-3495', '2022-02-09');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (41, '96325874O', 'Daniela', 'Espejo Herrera', '1993-07-25', 'daniela.espejo@gmail.com', '631123456', 'danielae', 'password41', 4200, '1234-5678-9012-3496', '2022-02-10');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (42, '14785239P', 'Fernando', 'Ruiz Gil', '1994-06-20', 'fernando.ruiz@gmail.com', '632234567', 'fernandor', 'password42', 4300, '1234-5678-9012-3497', '2022-02-11');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (43, '25896314Q', 'Irene', 'Gil López', '1987-04-18', 'irene.gil@gmail.com', '633345678', 'ireneg', 'password43', 4400, '1234-5678-9012-3498', '2022-02-12');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (44, '36925874R', 'Samuel', 'Navarro Rodríguez', '1990-01-30', 'samuel.navarro@gmail.com', '634456789', 'samueln', 'password44', 4500, '1234-5678-9012-3499', '2022-02-13');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (45, '75395162S', 'Rosa', 'Martínez Sánchez', '1983-12-08', 'rosa.martinez@gmail.com', '635567890', 'rosam', 'password45', 4600, '1234-5678-9012-3500', '2022-02-14');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (46, '15975384T', 'Hugo', 'Pérez Ortega', '1997-11-05', 'hugo.perez@gmail.com', '636678901', 'hugop', 'password46', 4700, '1234-5678-9012-3501', '2022-02-15');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (47, '85236947U', 'Andrea', 'López Morales', '1995-02-24', 'andrea.lopez@gmail.com', '637789012', 'andreal', 'password47', 4800, '1234-5678-9012-3502', '2022-02-16');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (48, '45612385V', 'Tomás', 'Méndez Vega', '1981-08-29', 'tomas.mendez@gmail.com', '638890123', 'tomasm', 'password48', 4900, '1234-5678-9012-3503', '2022-02-17');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (49, '32165489W', 'Luz', 'Pérez Gil', '1999-05-11', 'luz.perez@gmail.com', '639901234', 'luzp', 'password49', 5000, '1234-5678-9012-3504', '2022-02-18');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (50, '78945623X', 'Victor', 'Reyes Hernández', '1998-09-02', 'victor.reyes@gmail.com', '640012345', 'victorr', 'password50', 5100, '1234-5678-9012-3505', '2022-02-19');
INSERT INTO public.usuarios (idcliente, dni, nombre, apellidos, fecha_nac, correo, telefono, usuario, contrasena, puntos, tarjeta, fecha_registro) VALUES (51, '12345678', 'Andev', 'Andev', '2003-08-21', 'andev@gmail.com', NULL, 'andev', 'andev2i', NULL, NULL, '2025-06-14');


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 224
-- Name: usuarios_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_idcliente_seq', 51, true);


--
-- TOC entry 4685 (class 2606 OID 16442)
-- Name: butaca butaca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.butaca
    ADD CONSTRAINT butaca_pkey PRIMARY KEY (idbutaca);


--
-- TOC entry 4688 (class 2606 OID 16444)
-- Name: entradas entradas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entradas
    ADD CONSTRAINT entradas_pkey PRIMARY KEY (identrada);


--
-- TOC entry 4691 (class 2606 OID 16446)
-- Name: pelicula pelicula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pelicula
    ADD CONSTRAINT pelicula_pkey PRIMARY KEY (idpelicula);


--
-- TOC entry 4696 (class 2606 OID 16448)
-- Name: sala sala_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sala
    ADD CONSTRAINT sala_pkey PRIMARY KEY (idsala);


--
-- TOC entry 4699 (class 2606 OID 16450)
-- Name: sesion sesion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesion
    ADD CONSTRAINT sesion_pkey PRIMARY KEY (idsesion);


--
-- TOC entry 4701 (class 2606 OID 16452)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 4692 (class 1259 OID 16455)
-- Name: idx_idbutaca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_idbutaca ON public.reserva USING btree (idbutaca);


--
-- TOC entry 4689 (class 1259 OID 16454)
-- Name: idx_idcliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_idcliente ON public.entradas USING btree (idcliente);


--
-- TOC entry 4693 (class 1259 OID 16456)
-- Name: idx_identrada; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_identrada ON public.reserva USING btree (identrada);


--
-- TOC entry 4697 (class 1259 OID 16458)
-- Name: idx_idpelicula; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_idpelicula ON public.sesion USING btree (idpelicula);


--
-- TOC entry 4686 (class 1259 OID 16453)
-- Name: idx_idsala; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_idsala ON public.butaca USING btree (idsala);


--
-- TOC entry 4694 (class 1259 OID 16457)
-- Name: idx_idsesion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_idsesion ON public.reserva USING btree (idsesion);


--
-- TOC entry 4702 (class 2606 OID 16459)
-- Name: butaca butaca_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.butaca
    ADD CONSTRAINT butaca_ibfk_1 FOREIGN KEY (idsala) REFERENCES public.sala(idsala);


--
-- TOC entry 4703 (class 2606 OID 16464)
-- Name: entradas entradas_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entradas
    ADD CONSTRAINT entradas_ibfk_1 FOREIGN KEY (idcliente) REFERENCES public.usuarios(idcliente);


--
-- TOC entry 4704 (class 2606 OID 16469)
-- Name: reserva reserva_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_ibfk_1 FOREIGN KEY (idbutaca) REFERENCES public.butaca(idbutaca);


--
-- TOC entry 4705 (class 2606 OID 16474)
-- Name: reserva reserva_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_ibfk_3 FOREIGN KEY (idsesion) REFERENCES public.sesion(idsesion);


--
-- TOC entry 4706 (class 2606 OID 16479)
-- Name: sesion sesion_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesion
    ADD CONSTRAINT sesion_ibfk_1 FOREIGN KEY (idpelicula) REFERENCES public.pelicula(idpelicula);


-- Completed on 2025-06-15 00:49:11

--
-- PostgreSQL database dump complete
--

