from flask import Flask
from flask import request
import os

app = Flask(__name__)

@app.route("/")
def hello_world():
    if 'x-terminate' in request.headers:
        os._exit(0)
    return "<p>Hello, World!</p>"

@app.route("/test")
def test():
    return "passed"
