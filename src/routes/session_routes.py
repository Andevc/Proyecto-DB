from flask import Blueprint, jsonify, request
from src.database.db_pgsql import DataBase
from datetime import timedelta

bp = Blueprint('sessions', __name__)


@bp.route('/sesiones/<int:idPelicula>')
def obtener_sesiones(idPelicula):
    db = DataBase()
    try:
        db.execute("SELECT * FROM sesion WHERE idPelicula = %s", (idPelicula,))
        sesiones = db.fetchall()
        for sesion in sesiones:
            if isinstance(sesion['Hora'], timedelta):
                total_seconds = int(sesion['Hora'].total_seconds())
                hours, remainder = divmod(total_seconds, 3600)
                minutes, _ = divmod(remainder, 60)
                sesion['Hora'] = f"{hours:02}:{minutes:02}"
    finally:
        db.close()
    return jsonify(sesiones)


@bp.route('/api/sesiones', methods=['GET'])
def get_sesiones():
    db = DataBase()
    try:
        db.execute("SELECT * FROM sesion")
        sesiones = db.fetchall()
        for sesion in sesiones:
            if isinstance(sesion['Hora'], timedelta):
                total_seconds = int(sesion['Hora'].total_seconds())
                hours, remainder = divmod(total_seconds, 3600)
                minutes, _ = divmod(remainder, 60)
                sesion['Hora'] = f"{hours:02}:{minutes:02}"
    finally:
        db.close()
    return jsonify(sesiones)


@bp.route('/api/sesiones/<int:id>', methods=['GET'])
def get_sesion(id):
    db = DataBase()
    try:
        db.execute("SELECT * FROM sesion WHERE idSesion = %s", (id,))
        sesion = db.fetchone()
        if sesion and isinstance(sesion['Hora'], timedelta):
            total_seconds = int(sesion['Hora'].total_seconds())
            hours, remainder = divmod(total_seconds, 3600)
            minutes, _ = divmod(remainder, 60)
            sesion['Hora'] = f"{hours:02}:{minutes:02}"
    finally:
        db.close()
    return jsonify(sesion)


@bp.route('/api/sesiones', methods=['POST'])
def add_sesion():
    data = request.json
    db = DataBase()
    # Validar existencia de idPelicula y idSala
    db.execute("SELECT COUNT(*) FROM pelicula WHERE idPelicula = %s", (data['idPelicula'],))
    if db.fetchone()[0] == 0:
        return jsonify({"error": "idPelicula no válido"}), 400

    db.execute("SELECT COUNT(*) FROM sala WHERE idSala = %s", (data['idSala'],))
    if db.fetchone()[0] == 0:
        return jsonify({"error": "idSala no válido"}), 400

    db.execute("""
        INSERT INTO sesion (Fecha, Hora, Idioma, idPelicula, idSala)
        VALUES (%s, %s, %s, %s, %s)
    """, (data['Fecha'], data['Hora'], data['Idioma'], data['idPelicula'], data['idSala']))
    
    db.commit()
    db.close()
    return jsonify({"message": "Sesión agregada"})


@bp.route('/api/sesiones/<int:id>', methods=['PUT'])
def update_sesion(id):
    data = request.json
    db = DataBase()
    cursor = db.cursor()
    cursor.execute("""
        UPDATE sesion
        SET Fecha = %s, Hora = %s, Idioma = %s, idPelicula = %s, idSala = %s
        WHERE idSesion = %s
    """, (data['Fecha'], data['Hora'], data['Idioma'], data['idPelicula'], data['idSala'], id))
    db.commit()
    cursor.close()
    db.close()
    return jsonify({"message": "Sesión actualizada"})

@bp.route('/api/sesiones/<int:id>', methods=['DELETE'])
def delete_sesion(id):
    db = DataBase()
    cursor = db.cursor()
    cursor.execute("DELETE FROM sesion WHERE idSesion = %s", (id,))
    db.commit()
    cursor.close()
    db.close()
    return jsonify({"message": "Sesión eliminada"})
