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

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()
    value = data.get('value')
    prediction = model.predict([[value]])[0]
    return jsonify({'success': True, 'input': value, 'prediction': round(prediction, 2)})

@app.route('/')
def home():
    return jsonify({'message': 'Linear Regression API', 'endpoints': {'/predict': 'POST'}})

print(f'Model trained: y = {model.coef_[0]:.2f}x + {model.intercept_:.2f}')

if __name__ == '__main__':
    app.run(debug=True, port=5000)
