from flask import Flask
import requests

app = Flask(__name__)

@app.route('/')
def index():
    msg = "Welcome 2022"
    url = "https://www.google.com"
    response = requests.get(url)
    return msg + '\n' + str(response.headers)


app.run(host='0.0.0.0')