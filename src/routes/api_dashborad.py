from flask import Blueprint, jsonify
from src.database.db_pgsql import DataBase

bp = Blueprint('dashboard', __name__)

def get_ventas_totales_por_mes(db):


    #SQL antes de la funcion:
    #SELECT EXTRACT(MONTH FROM Fecha_Reserva) AS mes, SUM(Coste) AS total
    #FROM reserva
    #GROUP BY mes
    #ORDER BY mes

    db.execute("SELECT * FROM ventas_por_mes()")
    ventas = db.fetchall() or []
    meses = [f"Mes {int(v['mes'])}" for v in ventas]
    valores = [v['total'] for v in ventas]
    return {"meses": meses, "valores": valores}


def get_entradas_por_genero(db):
    #SELECT p.Genero, COUNT(*) AS total
    #FROM pelicula p
    #JOIN sesion s ON p.idPelicula = s.idPelicula
    #JOIN reserva r ON r.idSesion = s.idSesion
    #GROUP BY p.Genero
    db.execute("SELECT * FROM entradas_por_genero()")
    rows = db.fetchall() or []
    return {
        "labels": [r['genero'] for r in rows],
        "valores": [r['total'] for r in rows]
    }


def get_entradas_por_clasificacion(db):
    #SELECT Clasificacion, COUNT(*) AS total
    #FROM pelicula
    #JOIN sesion ON pelicula.idPelicula = sesion.idPelicula
    #JOIN reserva ON sesion.idSesion = reserva.idSesion
    #GROUP BY Clasificacion
    db.execute("SELECT * FROM entradas_por_clasificacion()")
    rows = db.fetchall() or []
    return {
        "labels": [r['clasificacion'] for r in rows],
        "valores": [r['total'] for r in rows]
    }


def get_ocupacion_salas(db):

    #SELECT idSala,
    #       CASE WHEN Capacidad = 0 THEN 0
    #            ELSE ROUND((Ocupacion::decimal / Capacidad) * 100, 2)
    #       END AS ocupacion
    #FROM sala
    db.execute("SELECT * FROM ocupacion_salas()")
    rows = db.fetchall() or []
    return {
        "labels": [r['sala'] for r in rows],
        "valores": [float(r['ocupacion']) for r in rows]
    }


@bp.route('/api/dashboard-data')
def dashboard_data():
    db = DataBase()
    try:
        return jsonify({
            "ventas_totales": get_ventas_totales_por_mes(db),
            "generos": get_entradas_por_genero(db),
            "clasificacion": get_entradas_por_clasificacion(db),
            "ocupacion_salas": get_ocupacion_salas(db)
        })
    except Exception as e:
        import traceback
        traceback.print_exc()
        return jsonify({"error": str(e)}), 500
    finally:
        db.close()

