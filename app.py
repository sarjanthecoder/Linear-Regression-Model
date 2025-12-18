"""
Linear Regression Prediction API
================================
A Flask REST API that uses scikit-learn's LinearRegression model
to predict Y values based on input X values.

Training Data:
  X = [10, 20, 30, 40, 50]
  y = [100, 200, 300, 400, 500]
"""

from flask import Flask, request, jsonify
from flask_cors import CORS
from sklearn.linear_model import LinearRegression
import numpy as np

# ============================================================
# Initialize Flask Application
# ============================================================
app = Flask(__name__)

# Enable CORS for all routes (allows frontend to connect)
CORS(app)

# ============================================================
# Train the Linear Regression Model
# ============================================================
# Sample training data
X_train = np.array([10, 20, 30, 40, 50]).reshape(-1, 1)  # Features (must be 2D array)
y_train = np.array([100, 200, 300, 400, 500])            # Target values

# Create and train the model
model = LinearRegression()
model.fit(X_train, y_train)

print("=" * 50)
print("Linear Regression Model Trained Successfully!")
print(f"Coefficient (slope): {model.coef_[0]:.2f}")
print(f"Intercept: {model.intercept_:.2f}")
print("=" * 50)

# ============================================================
# API Routes
# ============================================================

@app.route('/')
def home():
    """
    Root endpoint - Returns API information
    """
    return jsonify({
        "message": "Linear Regression Prediction API",
        "endpoints": {
            "/predict": "POST - Make predictions with JSON body {'value': number}"
        },
        "model_info": {
            "coefficient": float(model.coef_[0]),
            "intercept": float(model.intercept_)
        }
    })


@app.route('/predict', methods=['POST'])
def predict():
    """
    Prediction endpoint
    Accepts JSON: {"value": number}
    Returns JSON: {"prediction": number, "input": number}
    """
    try:
        # Get JSON data from request
        data = request.get_json()
        
        # Validate input
        if data is None:
            return jsonify({"error": "No JSON data provided"}), 400
        
        if 'value' not in data:
            return jsonify({"error": "Missing 'value' field in request body"}), 400
        
        # Extract the input value
        input_value = data['value']
        
        # Validate that input is a number
        if not isinstance(input_value, (int, float)):
            return jsonify({"error": "'value' must be a number"}), 400
        
        # Prepare input for prediction (must be 2D array)
        X_input = np.array([[input_value]])
        
        # Make prediction
        prediction = model.predict(X_input)[0]
        
        # Return the prediction result
        return jsonify({
            "success": True,
            "input": input_value,
            "prediction": round(float(prediction), 2)
        })
    
    except Exception as e:
        # Handle any unexpected errors
        return jsonify({"error": f"Prediction failed: {str(e)}"}), 500


# ============================================================
# Run the Application
# ============================================================
if __name__ == '__main__':
    # Run Flask development server
    # Debug mode is ON for development (set to False in production)
    app.run(debug=True, host='127.0.0.1', port=5000)
