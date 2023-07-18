# -*- coding: utf-8 -*-
# @Time    : 2023/7/18 23:03
# @Author  : 楚楚
# @File    : flask.py
# @Software: PyCharm
from flask import Flask, jsonify,request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


@app.route("/ajax")
def ajax_test():
    print(request.form.get("name"))
    message = {
        "content": "hello world"
    }

    return jsonify(message)


if __name__ == "__main__":
    app.run(port=1252)
