from flask import Flask, render_template
import socket
import os

# creates a Flask application, named app
app = Flask(__name__)

# a route where we will display a welcome message via an HTML template
@app.route("/")
def hello():
    message = "Environment variables visualizer"
    hostname = socket.gethostname()
    app.logger.info('Container ID: %s', hostname)
    return render_template('index.html', 
        message=message, 
        hostname=hostname,
        val1=os.getenv('ENV_KEY1', default=None),
        val2=os.getenv('ENV_KEY2', default=None),
        val3=os.getenv('ENV_KEY3', default=None),
        val4=os.getenv('ENV_KEY4', default=None))

# run the application
if __name__ == "__main__":
    app.run(debug=True, threaded=True)