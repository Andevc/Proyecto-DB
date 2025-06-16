from flask import Blueprint, request, jsonify, session
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

@bp.route('/obtener_sesiones/<int:idPelicula>', methods=['GET'])
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
            sesion['Hora'] = str(sesion['Hora'])
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
    datos = request.json
    idCliente = session.get('usuario_id')  # Asegúrate que esto esté guardado al hacer login
    idSesion = datos['idSesion']
    idButacas = datos['idButacas']
    cantidad = len(idButacas)
    precio_por_boleto = 10.00
    precio_total = cantidad * precio_por_boleto

    db = DataBase()
    cursor = db.cursor()

    # Insertar entrada
    cursor.execute("""
        INSERT INTO entradas (idCliente, Precio_Total, Numero_Entradas)
        VALUES (%s, %s, %s)
    """, (idCliente, precio_total, cantidad))
    db.commit()

    # Obtener id de la entrada recién creada
    cursor.execute("SELECT LASTVAL()")
    idEntrada = cursor.fetchone()[0]

    # Insertar reservas y actualizar estado de butacas
    for idButaca in idButacas:
        cursor.execute("""
            INSERT INTO reserva (idButaca, idEntrada, idSesion, Coste, Fecha_Reserva)
            VALUES (%s, %s, %s, %s, CURRENT_DATE)
        """, (idButaca, idEntrada, idSesion, precio_por_boleto))

        cursor.execute("UPDATE butaca SET Estado = 'Ocupada' WHERE idButaca = %s", (idButaca,))
    
    db.commit()
    cursor.close()
    db.close()

    return jsonify({"mensaje": "Compra realizada con éxito", "precio_total": precio_total})
