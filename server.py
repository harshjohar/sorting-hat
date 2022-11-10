import numpy as np
from flask import Flask,request,jsonify

import pickle
import random

app = Flask(__name__)

model = pickle.load(open('Rnd30Model.pkl', 'rb'))
lrModel = pickle.load(open('LogisticModel.pkl', 'rb'))

@app.route('/',methods=['GET'])
def hello():
    return jsonify("Hello world, use the /api route and read te README.md pls")

@app.route('/api',methods=['GET', 'POST'])
def predict():
    data = request.get_json(force=True)
    prediction = model.predict(np.array(data['exp']))
    output = prediction[0]

    # introduce some randomness
    if output == 'G':
        arr = model.predict_proba(np.array(data['exp']))[0]
        alpha = 0.4  # configurable parameter
        diff = random.uniform(0, alpha)  # randomRes
        if arr[0] - diff < 0:
            diff = arr[0]
        temp = (np.random.dirichlet(np.ones(3), size=1) * diff)[0]
        newAdd = np.array([-diff] + list(temp))
        arr = list(newAdd + arr)
        max_value = max(arr)
        new_index = arr.index(max_value)
        classMap = {0: 'G', 1: 'H', 2: 'R', 3: 'S'}
        output = classMap[new_index]
    response = jsonify(output)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

@app.route('/api/lr',methods=['GET', 'POST'])
def predictWithLR():
    data = request.get_json(force=True)
    prediction = lrModel.predict(np.array(data['exp']))
    output = prediction[0]
    response = jsonify(output)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

if __name__ == '__main__':
    app.run(port=5000, debug=True)
