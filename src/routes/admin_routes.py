from flask import Blueprint, render_template, redirect, session


bp = Blueprint('admin', __name__)

@bp.route('/admin')
def admin_home():
    if 'usuario' not in session:
        return redirect('/login')
    return render_template('admin.html')

@bp.route('/admin/usuarios')
def admin_usuarios():
    if 'usuario' not in session:
        return redirect('/login')
    return render_template('usuarios.html')

@bp.route('/admin/peliculas')
def admin_peliculas():
    if 'usuario' not in session:
        return redirect('/login')
    return render_template('admin.html')

@bp.route('/admin/sesiones')
def admin_sesiones():
    if 'usuario' not in session:
        return redirect('/login')
    return render_template('sesiones.html')