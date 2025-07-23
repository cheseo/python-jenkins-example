from flask import Flask
import sys

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/test")
def test():
	return "passed"

@app.route("/terminate")
def terminate():
	sys.exit("by request")
