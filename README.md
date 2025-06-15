# Proyecto Base de Datos II - Cine Instrucciones
-----------
##   1. Primero se debe establecer el entorno virtual para una ejecucion correcta del proyecto:
1. Se debe `clonar`/`descargar` el proyecto

2. Se debe de instalar el modulo virtualenv para poder crear el entorno virtual.
```py 
pip install virtualenv
```
3. Una vez instalado `virutalenv` debemos crear el entorno.
- `Windows`
```py
python -m venv venv
```
- `Linux`/`MacOS`
```py
python -m virtualenv .venv
```
----------------------
4. Una vez creado el entorno virtual se debe de activar.
- `Windows`
```py
/venv/Scripts/Activate
```
- `Linux`/`MacOS`
```py
. .venv/bin/activate
```
Una vez este activado en la terminal se vera `(env)` antes del **prompt de comandos**
-----------------------
5. Una vez activado el entorno virtual se deben de instalar los modulos del proyecto.

```py
pip install -r requirements.txt
```
6. Una vez instalado todos los modulos del proyecto se ejecuta de la siguiente manera.
- `Windows`
```py 
python app.py
```
- `Linux`/`MacOS`
```py 
python3 app.py
```
------------------------------
## Configuracion de la Base de Datos
Para configurar la base de datos se usa un `.env` donde se almacenan las variables de entorno.

Esta es la estructura del [.env](./.env)

```env
PG_HOST=localhost 
PG_PORT=5432      
PG_USER=postgres
PG_PASSWORD=password
PG_DB=nombre_db
```
| Variable       | Ejemplo       | Descripción                                    |
|----------------|---------------|------------------------------------------------|
| `PG_HOST`      | `localhost`   | Dirección del servidor de la base de datos. Normalmente `localhost` si es local. |
| `PG_PORT`      | `5432`        | Puerto en el que corre el servidor de PostgreSQL. Por defecto es 5432.          |
| `PG_USER`      | `postgres`    | Usuario para conectarse a la base de datos. Por defecto es postgres                                  |
| `PG_PASSWORD`  | `password`    | Contraseña del usuario de la base de datos.                                  |
| `PG_DB`        | `nombre_db`   | Nombre de la base de datos que se va a utilizar.                            |

Una vez confirado el archivo `.env` el proyecto se ejecuta con toral normalidad

La base de datos se encuentra en el directorio [DataBase](./database/) con la extension `.sql`