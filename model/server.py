import numpy as np
from flask import Flask,request,jsonify

import pickle

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
    return jsonify(output)

@app.route('/api/lr',methods=['GET', 'POST'])
def predictWithLR():
    data = request.get_json(force=True)
    prediction = lrModel.predict(np.array(data['exp']))
    output = prediction[0]
    return jsonify(output)

if __name__ == '__main__':
    app.run(port=5000, debug=True)

