from flask import Blueprint, jsonify, request
from src.database.db_pgsql import DataBase
from datetime import timedelta
from datetime import time

bp = Blueprint('sessions', __name__)


@bp.route('/sesiones/<int:idPelicula>')
def obtener_sesiones(idPelicula):
    db = DataBase()
    try:
        db.execute("SELECT * FROM sesion WHERE idSesion = %s", (idPelicula,))
        sesion = db.fetchone()
        if sesion and isinstance(sesion['hora'], time):
            sesion['hora'] = sesion['hora'].strftime('%H:%M')
    finally:
        db.close()

    if not sesion:
        return jsonify({"error": "Sesión no encontrada"}), 404

    return jsonify(sesion)


@bp.route('/api/sesiones', methods=['GET'])
def get_sesiones():
    db = DataBase()
    try:
        db.execute("SELECT * FROM sesion")
        sesiones = db.fetchall()
        for sesion in sesiones:
            # Manejo correcto del tipo time
            if isinstance(sesion['hora'], time):
                sesion['hora'] = sesion['hora'].strftime('%H:%M')
    finally:
        db.close()
    return jsonify(sesiones)


@bp.route('/api/sesiones/<int:id>', methods=['GET'])
def get_sesion(id):
    db = DataBase()
    try:
        db.execute("SELECT * FROM sesion WHERE idSesion = %s", (id,))
        sesion = db.fetchone()
        if sesion and isinstance(sesion['hora'], timedelta):
            total_seconds = int(sesion['hora'].total_seconds())
            hours, remainder = divmod(total_seconds, 3600)
            minutes, _ = divmod(remainder, 60)
            sesion['hora'] = f"{hours:02}:{minutes:02}"
    finally:
        db.close()
    return jsonify(sesion)


@bp.route('/api/sesiones', methods=['POST'])
def add_sesion():
    data = request.json
    db = DataBase()
    # Validar existencia de idPelicula y idSala
    db.execute("SELECT COUNT(*) FROM pelicula WHERE idPelicula = %s", (data['idpelicula'],))
    if db.fetchone()[0] == 0:
        return jsonify({"error": "idPelicula no válido"}), 400

    db.execute("SELECT COUNT(*) FROM sala WHERE idSala = %s", (data['idsala'],))
    if db.fetchone()[0] == 0:
        return jsonify({"error": "idSala no válido"}), 400

    db.execute("""
        INSERT INTO sesion (Fecha, Hora, Idioma, idPelicula, idSala)
        VALUES (%s, %s, %s, %s, %s)
    """, (data['fecha'], data['hora'], data['idioma'], data['idpelicula'], data['idsala']))
    
    db.commit()
    db.close()
    return jsonify({"message": "Sesión agregada"})


@bp.route('/api/sesiones/<int:id>', methods=['PUT'])
def update_sesion(id):
    data = request.json
    db = DataBase()
    db.execute("""
        UPDATE sesion
        SET Fecha = %s, Hora = %s, Idioma = %s, idPelicula = %s, idSala = %s
        WHERE idSesion = %s
    """, (data['fecha'], data['hora'], data['idioma'], data['idpelicula'], data['idsala'], id))
    db.commit()
    db.close()
    return jsonify({"message": "Sesión actualizada"})

@bp.route('/api/sesiones/<int:id>', methods=['DELETE'])
def delete_sesion(id):
    db = DataBase()
    
    db.execute("DELETE FROM sesion WHERE idSesion = %s", (id,))
    db.commit()
  
    db.close()
    return jsonify({"message": "Sesión eliminada"})
