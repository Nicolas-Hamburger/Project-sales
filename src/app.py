from flask import Flask, jsonify, request
import pymysql.cursors

app = Flask(__name__)

def connection_mysql():
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='junior1924',
        database='python',
        cursorclass=pymysql.cursors.DictCursor)
    return connection

@app.route("/usuarios", methods=["GET", "POST"])
def usuarios():
    if request.method == "POST":
        data = request.get_json()
        connection = connection_mysql()

        with connection:
            with connection.cursor() as cursor:
                sql = "INSERT INTO users (email, password) VALUES (%s, %s)"
                cursor.execute(sql, (data['email'], data['password']))

            connection.commit()

        return jsonify({'message': 'Creación exitosa'})
    elif request.method == "GET":
        connection = connection_mysql()

        with connection:
            with connection.cursor() as cursor:
                sql = "SELECT * FROM users"
                cursor.execute(sql)
                result = cursor.fetchall()

        return jsonify(result)

@app.route("/usuarios/<int:user_id>", methods=["PUT", "DELETE"])
def usuario(user_id):
    if request.method == "PUT":
        data = request.get_json()
        connection = connection_mysql()

        with connection:
            with connection.cursor() as cursor:
                sql = "UPDATE users SET email = %s, password = %s WHERE id = %s"
                cursor.execute(sql, (data['email'], data['password'], user_id))

            connection.commit()

        return jsonify({'message': 'Actualización exitosa'})
    elif request.method == "DELETE":
        connection = connection_mysql()

        with connection:
            with connection.cursor() as cursor:
                sql = "DELETE FROM users WHERE id = %s"
                cursor.execute(sql, (user_id,))

            connection.commit()

        return jsonify({'message': 'Eliminación exitosa'})

if __name__ == '__main__':
    app.run(debug=True)