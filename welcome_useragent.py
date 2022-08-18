from flask import Flask
from user_agents import parse
import requests

app = Flask(__name__)

@app.route('/')
def index():
    msg = "Welcome 2022"
    
    url = "https://www.google.com"
    response = requests.get(url)
    
    ua_string = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36'
    user_agent = parse(ua_string)
    user_agent_info = str(user_agent.browser) + '<br/> <br/>' + str(user_agent.os)
    
    return msg + '<br/> <br/>' + user_agent_info + '<br/> <br/>' + str(response.headers)

app.run(host='0.0.0.0')
