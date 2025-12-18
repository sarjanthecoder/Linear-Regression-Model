# PowerShell script to create 100 commits progressively building the Linear Regression project
# Each commit adds incremental changes to simulate a real development workflow

$projectDir = "C:\Users\sarja\Downloads\machine learning linear regression"
Set-Location $projectDir

# Function to create a commit
function Make-Commit {
    param($message)
    git add -A
    git commit -m "$message" --allow-empty-message
}

# ============================================================
# PHASE 1: Initial Setup (Commits 1-10)
# ============================================================

# Commit 1: Initialize repository
"# Linear Regression Model" | Out-File -FilePath "README.md" -Encoding utf8
Make-Commit "Initial commit - Create README"

# Commit 2: Add project description
@"
# Linear Regression Model

A machine learning prediction web app.
"@ | Out-File -FilePath "README.md" -Encoding utf8
Make-Commit "docs: Add project description to README"

# Commit 3: Add license placeholder
"MIT License" | Out-File -FilePath "LICENSE" -Encoding utf8
Make-Commit "docs: Add MIT License"

# Commit 4: Create gitignore
@"
__pycache__/
*.pyc
.env
venv/
"@ | Out-File -FilePath ".gitignore" -Encoding utf8
Make-Commit "chore: Add .gitignore for Python"

# Commit 5: Add node modules to gitignore
@"
__pycache__/
*.pyc
.env
venv/
node_modules/
.DS_Store
"@ | Out-File -FilePath ".gitignore" -Encoding utf8
Make-Commit "chore: Update .gitignore with node_modules"

# Commit 6: Create requirements placeholder
"flask" | Out-File -FilePath "requirements.txt" -Encoding utf8
Make-Commit "chore: Create requirements.txt"

# Commit 7: Add flask-cors to requirements
@"
flask
flask-cors
"@ | Out-File -FilePath "requirements.txt" -Encoding utf8
Make-Commit "chore: Add flask-cors to requirements"

# Commit 8: Add scikit-learn to requirements
@"
flask
flask-cors
scikit-learn
"@ | Out-File -FilePath "requirements.txt" -Encoding utf8
Make-Commit "chore: Add scikit-learn to requirements"

# Commit 9: Add numpy to requirements
@"
flask
flask-cors
scikit-learn
numpy
"@ | Out-File -FilePath "requirements.txt" -Encoding utf8
Make-Commit "chore: Add numpy to requirements"

# Commit 10: Finalize requirements
@"
flask>=2.0.0
flask-cors>=3.0.0
scikit-learn>=1.0.0
numpy>=1.21.0
"@ | Out-File -FilePath "requirements.txt" -Encoding utf8
Make-Commit "chore: Add version constraints to requirements"

# ============================================================
# PHASE 2: HTML Structure (Commits 11-25)
# ============================================================

# Commit 11: Create basic HTML
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Linear Regression</title>
</head>
<body>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Create basic HTML structure"

# Commit 12: Add viewport meta
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linear Regression</title>
</head>
<body>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Add viewport meta tag for responsiveness"

# Commit 13: Add description meta
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
</head>
<body>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Add meta description and update title"

# Commit 14: Link CSS file
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Link external stylesheet"

# Commit 15: Add Google Fonts
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Add Google Fonts - Inter"

# Commit 16: Add container div
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
    </div>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Add main container div"

# Commit 17: Add card component
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
        </div>
    </div>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Add card component structure"

# Commit 18: Add card header
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1>Linear Regression Predictor</h1>
            </div>
        </div>
    </div>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Add card header with title"

# Commit 19: Add subtitle
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <div class="icon">📈</div>
                <h1>Linear Regression Predictor</h1>
                <p class="subtitle">Enter a numeric value to predict the output</p>
            </div>
        </div>
    </div>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Add icon and subtitle to header"

# Commit 20: Add input section
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <div class="icon">📈</div>
                <h1>Linear Regression Predictor</h1>
                <p class="subtitle">Enter a numeric value to predict the output</p>
            </div>
            <div class="input-section">
                <label for="inputValue">Input Value (X)</label>
                <input type="number" id="inputValue" placeholder="Enter a number">
            </div>
        </div>
    </div>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Add input section with label"

# Commit 21: Add predict button
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <div class="icon">📈</div>
                <h1>Linear Regression Predictor</h1>
                <p class="subtitle">Enter a numeric value to predict the output</p>
            </div>
            <div class="input-section">
                <label for="inputValue">Input Value (X)</label>
                <input type="number" id="inputValue" placeholder="Enter a number">
            </div>
            <button id="predictBtn" class="predict-btn">Predict</button>
        </div>
    </div>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Add predict button"

# Commit 22: Add result section
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <div class="icon">📈</div>
                <h1>Linear Regression Predictor</h1>
                <p class="subtitle">Enter a numeric value to predict the output</p>
            </div>
            <div class="input-section">
                <label for="inputValue">Input Value (X)</label>
                <input type="number" id="inputValue" placeholder="Enter a number">
            </div>
            <button id="predictBtn" class="predict-btn">Predict</button>
            <div id="resultSection" class="result-section hidden">
                <div class="result-label">Predicted Value (Y)</div>
                <div id="resultValue" class="result-value">--</div>
            </div>
        </div>
    </div>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Add result section for predictions"

# Commit 23: Add error section
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <div class="icon">📈</div>
                <h1>Linear Regression Predictor</h1>
                <p class="subtitle">Enter a numeric value to predict the output</p>
            </div>
            <div class="input-section">
                <label for="inputValue">Input Value (X)</label>
                <input type="number" id="inputValue" placeholder="Enter a number">
            </div>
            <button id="predictBtn" class="predict-btn">Predict</button>
            <div id="resultSection" class="result-section hidden">
                <div class="result-label">Predicted Value (Y)</div>
                <div id="resultValue" class="result-value">--</div>
            </div>
            <div id="errorSection" class="error-section hidden">
                <span id="errorMessage">An error occurred</span>
            </div>
        </div>
    </div>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Add error section for error handling"

# Commit 24: Add model info footer
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <div class="icon">📈</div>
                <h1>Linear Regression Predictor</h1>
                <p class="subtitle">Enter a numeric value to predict the output</p>
            </div>
            <div class="input-section">
                <label for="inputValue">Input Value (X)</label>
                <input type="number" id="inputValue" placeholder="Enter a number">
            </div>
            <button id="predictBtn" class="predict-btn">Predict</button>
            <div id="resultSection" class="result-section hidden">
                <div class="result-label">Predicted Value (Y)</div>
                <div id="resultValue" class="result-value">--</div>
            </div>
            <div id="errorSection" class="error-section hidden">
                <span id="errorMessage">An error occurred</span>
            </div>
            <div class="model-info">
                <p>Model: <strong>y = 10x + 0</strong></p>
            </div>
        </div>
    </div>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Add model info footer"

# Commit 25: Link JavaScript file
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Linear Regression Prediction Web App">
    <title>Linear Regression Predictor</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <div class="icon">📈</div>
                <h1>Linear Regression Predictor</h1>
                <p class="subtitle">Enter a numeric value to predict the output</p>
            </div>
            <div class="input-section">
                <label for="inputValue">Input Value (X)</label>
                <input type="number" id="inputValue" placeholder="Enter a number">
            </div>
            <button id="predictBtn" class="predict-btn">Predict</button>
            <div id="resultSection" class="result-section hidden">
                <div class="result-label">Predicted Value (Y)</div>
                <div id="resultValue" class="result-value">--</div>
            </div>
            <div id="errorSection" class="error-section hidden">
                <span id="errorMessage">An error occurred</span>
            </div>
            <div class="model-info">
                <p>Model: <strong>y = 10x + 0</strong></p>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding utf8
Make-Commit "feat: Link external JavaScript file"

Write-Host "Phase 1-2 complete: 25 commits created"
