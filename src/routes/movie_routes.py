from flask import Blueprint, jsonify, request, render_template, session
from src.database.db_pgsql import DataBase
from datetime import timedelta

bp = Blueprint('movies', __name__)

@bp.route('/pelicula/<int:idPelicula>')
def obtener_pelicula(idPelicula):
    db = DataBase()
    try:
        db.execute("SELECT * FROM pelicula WHERE idPelicula = %s", (idPelicula,))
        pelicula = db.fetchone()
    finally:
        db.close()
    
    return jsonify(pelicula)

@bp.route('/peliculas')
def peliculas():
    db = DataBase()
    db.execute("""
        SELECT p.idPelicula, p.Titulo, s.Fecha, s.Hora 
        FROM pelicula p 
        LEFT JOIN sesion s ON p.idPelicula = s.idPelicula
    """)
    peliculas = db.fetchall()
    db.close()

    peliculas_dict = {}
    for pelicula in peliculas:
        idPelicula = pelicula['idpelicula']
        if idPelicula not in peliculas_dict:
            peliculas_dict[idPelicula] = {
                'Titulo': pelicula['titulo'],
                'Sesiones': []
            }
        
        # Formateo
        formatted_fecha = pelicula['fecha'].strftime('%Y-%m-%d') if pelicula['fecha'] else None
        if isinstance(pelicula['hora'], timedelta):
            total_seconds = int(pelicula['hora'].total_seconds())
            hours, remainder = divmod(total_seconds, 3600)
            minutes, _ = divmod(remainder, 60)
            formatted_hora = f"{hours:02}:{minutes:02}"
        else:
            formatted_hora = pelicula['hora'].strftime('%H:%M') if pelicula['hora'] else None

        peliculas_dict[idPelicula]['Sesiones'].append({
            'Fecha': formatted_fecha,
            'Hora': formatted_hora
        })

    return jsonify(list(peliculas_dict.values()))

@bp.route('/api/peliculas', methods=['GET'])
def get_peliculas():
    db = DataBase()
    db.execute("SELECT * FROM pelicula")
    peliculas = db.fetchall()
    db.close()
    return jsonify(peliculas) 


@bp.route('/api/peliculas/<int:id>', methods=['GET'])
def get_pelicula_api(id):
    db = DataBase()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM pelicula WHERE idPelicula = %s", (id,))
    pelicula = cursor.fetchone()
    cursor.close()
    db.close()
    return jsonify(pelicula)

@bp.route('/api/peliculas', methods=['POST'])
def add_pelicula():
    data = request.json
    db = DataBase()
    db.execute("""
        INSERT INTO pelicula (Titulo, Genero, Clasificacion, Duracion)
        VALUES (%s, %s, %s, %s)
    """, (data['Titulo'], data['Genero'], data['Clasificacion'], data['Duracion']))
    db.commit()
    db.close()
    return jsonify({"message": "Película agregada"})

@bp.route('/api/peliculas/<int:id>', methods=['PUT'])
def update_pelicula(id):
    data = request.json
    db = DataBase()
    db.execute("""
        UPDATE pelicula
        SET Titulo = %s, Genero = %s, Clasificacion = %s, Duracion = %s
        WHERE idPelicula = %s
    """, (data['Titulo'], data['Genero'], data['Clasificacion'], data['Duracion'], id))
    db.commit()
    db.close()
    return jsonify({"message": "Película actualizada"})

@bp.route('/api/peliculas/<int:id>', methods=['DELETE'])
def delete_pelicula(id):
    db = DataBase()
    cursor = db.cursor()
    cursor.execute("DELETE FROM pelicula WHERE idPelicula = %s", (id,))
    db.commit()
    cursor.close()
    db.close()
    return jsonify({"message": "Película eliminada"})
