"""Linear Regression Prediction API - Flask Backend"""
from flask import Flask, request, jsonify
from flask_cors import CORS
from sklearn.linear_model import LinearRegression
import numpy as np

app = Flask(__name__)
CORS(app)

# Training data
X = np.array([10, 20, 30, 40, 50]).reshape(-1, 1)
y = np.array([100, 200, 300, 400, 500])

# Train model
model = LinearRegression()
model.fit(X,y)
print(f"Model trained: y = {model.coef_[0]:.2f}x + {model.intercept_:.2f}")

@app.route('/')
def home():
    return jsonify({
        "message": "Linear Regression Prediction API",
        "endpoints": {"/predict": "POST - Make predictions with JSON body {'value': number}"},
        "model_info": {"coefficient": float(model.coef_[0]), "intercept": float(model.intercept_)}
    })

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json()
        if data is None: return jsonify({"error": "No JSON data provided"}), 400
        if 'value' not in data: return jsonify({"error": "Missing 'value' field"}), 400
        input_value = data['value']
        if not isinstance(input_value, (int, float)): return jsonify({"error": "'value' must be a number"}), 400
        prediction = model.predict([[input_value]])[0]
        return jsonify({"success": True, "input": input_value, "prediction": round(float(prediction), 2)})
    except Exception as e:
        return jsonify({"error": f"Prediction failed: {str(e)}"}), 500

if __name__ == '__main__':
    app.run(debug=False, host='127.0.0.1', port=5000)
