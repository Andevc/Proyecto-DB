from decouple import config
import psycopg2
from psycopg2.extras import RealDictCursor

class DataBase:
    def __init__(self):
        try:
            self.connection = psycopg2.connect(
                host=config('PG_HOST'),
                user=config('PG_USER'),
                password=config('PG_PASSWORD'),
                dbname=config('PG_DB'),
                port=config('PG_PORT'),
                cursor_factory=RealDictCursor
            )
            self.cursor = self.connection.cursor()
            print('Successfully database connection!')
        except psycopg2.Error as e:
            print('DataBase connection error ')
            raise

    def execute(self, query, args=None):
        self.cursor.execute(query, args)
        self.connection.commit()
        return self.cursor

    def fetchall(self):
        return self.cursor.fetchall()

    def fetchone(self):
        return self.cursor.fetchone()

    def close(self):
        self.connection.close()

    def commit(self):
        self.connection.commit()