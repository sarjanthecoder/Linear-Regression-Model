# Phase 4: Flask Backend (Commits 71-85)
$projectDir = "C:\Users\sarja\Downloads\machine learning linear regression"
Set-Location $projectDir

function Make-Commit { param($msg); git add -A; git commit -m "$msg" }

# Flask commits 71-85
"from flask import Flask" | Out-File app.py -Encoding utf8; Make-Commit "feat(api): Import Flask"
Add-Content app.py "`nfrom flask import request, jsonify"; Make-Commit "feat(api): Import request and jsonify"
Add-Content app.py "`nfrom flask_cors import CORS"; Make-Commit "feat(api): Import CORS"
Add-Content app.py "`nfrom sklearn.linear_model import LinearRegression"; Make-Commit "feat(api): Import LinearRegression"
Add-Content app.py "`nimport numpy as np"; Make-Commit "feat(api): Import numpy"
Add-Content app.py "`napp = Flask(__name__)"; Make-Commit "feat(api): Initialize Flask app"
Add-Content app.py "`nCORS(app)"; Make-Commit "feat(api): Enable CORS"
Add-Content app.py "`nX_train = np.array([10, 20, 30, 40, 50]).reshape(-1, 1)"; Make-Commit "feat(api): Define training data X"
Add-Content app.py "`ny_train = np.array([100, 200, 300, 400, 500])"; Make-Commit "feat(api): Define training data Y"
Add-Content app.py "`nmodel = LinearRegression()"; Make-Commit "feat(api): Create LinearRegression model"
Add-Content app.py "`nmodel.fit(X_train, y_train)"; Make-Commit "feat(api): Train the model"
Add-Content app.py "`n@app.route('/predict', methods=['POST'])`ndef predict():`n    data = request.get_json()`n    value = data.get('value')`n    prediction = model.predict([[value]])[0]`n    return jsonify({'success': True, 'input': value, 'prediction': round(prediction, 2)})"; Make-Commit "feat(api): Add /predict endpoint"
Add-Content app.py "`n@app.route('/')`ndef home():`n    return jsonify({'message': 'Linear Regression API', 'endpoints': {'/predict': 'POST'}})"; Make-Commit "feat(api): Add home endpoint"
Add-Content app.py "`nprint(f'Model trained: y = {model.coef_[0]:.2f}x + {model.intercept_:.2f}')"; Make-Commit "feat(api): Add model info print"
Add-Content app.py "`nif __name__ == '__main__':`n    app.run(debug=True, port=5000)"; Make-Commit "feat(api): Add main entry point"

Write-Host "Phase 4 complete: Commits 71-85"
