from flask import Blueprint, render_template, redirect, session

bp = Blueprint('misc', __name__)

@bp.route('/')
def index():
    return render_template('index.html')

@bp.route('/semanas')
def semanas():
    return render_template('semanas.html')


@bp.route('/candy')
def candy():
    return render_template('candybar.html')


@bp.route('/admin/dashboard')
def dashboard():
    return render_template('dashboard.html')




