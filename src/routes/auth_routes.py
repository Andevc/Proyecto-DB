from flask import Blueprint, request, render_template, redirect, session, flash
from src.database.db_pgsql import DataBase

bp = Blueprint('auth',__name__)

@bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        usuario = request.form['usuario']
        contrasena = request.form['contrasena']

        if usuario == 'manager' and contrasena == 'admin123':
            session['usuario'] = usuario
            session['idcliente'] = 0  # O algún id para manager
            return redirect('/admin')

        db = DataBase()
        try:
            db.execute("SELECT * FROM usuarios WHERE usuario = %s AND contrasena = %s", (usuario, contrasena))
            user = db.fetchone()
            print(user)
        finally:
            db.close()

        if user:
            session['usuario'] = user['usuario']
            session['idCliente'] = user['idcliente']  # Cambiado a minúsculas según tu resultado
            print(user)  # para verificar en consola
            return redirect('/')
        else:
            flash('Usuario o contraseña incorrectos')
            return redirect('/login')

    return render_template('login.html')

@bp.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        nombre = request.form['nombre']
        apellidos = request.form['apellidos']
        fecha_nac = request.form['fecha_nac']
        dni = request.form['dni']
        correo = request.form['correo']
        usuario = request.form['usuario']
        contrasena = request.form['contrasena']

        db = DataBase()
        try:
            db.execute("""
                INSERT INTO usuarios (DNI, Nombre, Apellidos, Fecha_Nac, Correo, Usuario, Contrasena, Fecha_Registro)
                VALUES (%s, %s, %s, %s, %s, %s, %s, CURRENT_DATE)
            """, (dni, nombre, apellidos, fecha_nac, correo, usuario, contrasena))
        finally:
            db.close()

        flash('Usuario registrado con éxito. Por favor, inicia sesión.')
        return redirect('/login')

    return render_template('register.html')


@bp.route('/logout')
def logout():
    session.pop('usuario', None)
    return redirect('/login')