from crypt import methods
import re
import numpy as np
import sklearn 
from flask import Flask,request,jsonify

import pickle

app = Flask(__name__)

model = pickle.load(open('Rnd30Model.pkl', 'rb'))

@app.route('/api',methods=['GET', 'POST'])
def predict():
    data = request.get_json(force=True)
    prediction = model.predict(np.array(data['exp']))
    output = prediction[0]
    return jsonify(output)


if __name__ == '__main__':
    app.run(port=5000, debug=True)

