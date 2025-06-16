from flask import Blueprint, jsonify, request
from src.database.db_pgsql import DataBase

bp = Blueprint('users', __name__)

@bp.route('/api/usuarios', methods=['GET'])
def get_usuarios():
    db = DataBase()
    try:
        db.execute("SELECT * FROM usuarios")
        usuarios = db.fetchall()
        for usuario in usuarios:
            if 'Fecha_Nac' in usuario:
                usuario['Fecha_Nac'] = usuario['Fecha_Nac'].strftime('%Y-%m-%d')
            if 'Fecha_Registro' in usuario:
                usuario['Fecha_Registro'] = usuario['Fecha_Registro'].strftime('%Y-%m-%d')
    finally:
        db.close()
    return jsonify(usuarios)

@bp.route('/api/usuarios/<int:id>', methods=['GET'])
def get_usuario(id):
    db = DataBase()
    try:
        db.execute("SELECT * FROM usuarios WHERE idCliente = %s", (id,))
        usuario = db.fetchone()
        if usuario:
            if 'Fecha_Nac' in usuario:
                usuario['Fecha_Nac'] = usuario['Fecha_Nac'].strftime('%Y-%m-%d')
            if 'Fecha_Registro' in usuario:
                usuario['Fecha_Registro'] = usuario['Fecha_Registro'].strftime('%Y-%m-%d')
    finally:
        db.close()
    return jsonify(usuario)

@bp.route('/api/usuarios', methods=['POST'])
def add_usuario():
    data = request.json
    db = DataBase()
    cursor = db.cursor()
    cursor.execute("""
        INSERT INTO usuarios (
            DNI, Nombre, Apellidos, Fecha_Nac, Correo, Telefono,
            Usuario, Contrasena, Puntos, Tarjeta, Fecha_Registro
        )
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, CURRENT_DATE)
    """, (
        data['DNI'], data['Nombre'], data['Apellidos'], data['Fecha_Nac'],
        data['Correo'], data['Telefono'], data['Usuario'],
        data['Contrasena'], data['Puntos'], data['Tarjeta']
    ))
    db.commit()
    cursor.close()
    db.close()
    return jsonify({"message": "Usuario agregado"})

@bp.route('/api/usuarios/<int:id>', methods=['PUT'])
def update_usuario(id):
    data = request.json
    db = DataBase()
    cursor = db.cursor()
    cursor.execute("""
        UPDATE usuarios
        SET DNI = %s, Nombre = %s, Apellidos = %s, Correo = %s,
            Telefono = %s, Usuario = %s, Contrasena = %s, 
            Puntos = %s, Tarjeta = %s
        WHERE idCliente = %s
    """, (
        data['DNI'], data['Nombre'], data['Apellidos'], data['Correo'],
        data['Telefono'], data['Usuario'], data['Contrasena'],
        data['Puntos'], data['Tarjeta'], id
    ))
    db.commit()
    cursor.close()
    db.close()
    return jsonify({"message": "Usuario actualizado"})

@bp.route('/api/usuarios/<int:id>', methods=['DELETE'])
def delete_usuario(id):
    db = DataBase()
    cursor = db.cursor()
    cursor.execute("DELETE FROM usuarios WHERE idCliente = %s", (id,))
    db.commit()
    cursor.close()
    db.close()
    return jsonify({"message": "Usuario eliminado"})
