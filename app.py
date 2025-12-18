from flask import Flask

from flask import request, jsonify

from flask_cors import CORS

from sklearn.linear_model import LinearRegression

import numpy as np

app = Flask(__name__)

CORS(app)

X_train = np.array([10, 20, 30, 40, 50]).reshape(-1, 1)

y_train = np.array([100, 200, 300, 400, 500])

model = LinearRegression()

model.fit(X_train, y_train)
