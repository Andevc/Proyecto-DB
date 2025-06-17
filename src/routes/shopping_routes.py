from flask import Blueprint, request, jsonify, session, abort
from src.database.db_pgsql import DataBase

bp = Blueprint('compra', __name__)

@bp.route('/obtener_peliculas', methods=['GET'])
def obtener_peliculas():
    db = DataBase()
    try:
        db.execute("SELECT idPelicula, Titulo FROM pelicula")
        peliculas = db.fetchall()
    finally:
        db.close()
    return jsonify(peliculas)

@bp.route('/obtener-sesiones/<int:idPelicula>', methods=['GET'])
def obtener_sesiones_por_pelicula(idPelicula):
    db = DataBase()
    try:
        db.execute("""
            SELECT idSesion, Fecha, Hora, idSala
            FROM sesion
            WHERE idPelicula = %s
        """, (idPelicula,))
        sesiones = db.fetchall()
        for sesion in sesiones:
            sesion['hora'] = str(sesion['hora'])
    finally:
        db.close()
    return jsonify(sesiones)

@bp.route('/obtener_butacas/<int:idSala>', methods=['GET'])
def obtener_butacas(idSala):
    db = DataBase()
    try:
        db.execute("SELECT idButaca, Fila, Numero, Estado FROM butaca WHERE idSala = %s", (idSala,))
        butacas = db.fetchall()
    finally:
        db.close()
    return jsonify(butacas)

@bp.route('/realizar_compra', methods=['POST'])
def realizar_compra():
    idCliente = session.get('idCliente')
    if idCliente is None:
        abort(401, "Usuario no autenticado")

    datos = request.json
    
    
    idSesion = datos['idSesion']
    idSesion = int(idSesion)
    idButacas = datos['idButacas']
    idButacas = list(map(int, idButacas))

    db = DataBase()
    

    try:
        # Procedimiento que hace todo: entrada + reservas + actualiza butacas
        db.execute("CALL crear_reserva_completa(%s::int, %s::int, %s::int[])", (idCliente, idSesion, idButacas))


        # Procedimiento que suma puntos al cliente
        db.execute("CALL asignar_puntos_por_entrada(%s, %s)", (idCliente, len(idButacas)))

        db.commit()
        return jsonify({"mensaje": "Compra realizada con éxito"})

    except Exception as e:
        import traceback
        traceback.print_exc()
        return jsonify({"error": str(e)}), 500

    finally:
        db.close()
