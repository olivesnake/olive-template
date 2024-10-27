from app import create_app

app = create_app()
PORT = 5500
HOST = '0.0.0.0'

if __name__ == '__main__':
    app.run(
        debug=True,
        port=PORT,
        host=HOST
    )
