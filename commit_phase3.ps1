# Phase 3: JavaScript (Commits 51-70)
$projectDir = "C:\Users\sarja\Downloads\machine learning linear regression"
Set-Location $projectDir

function Make-Commit { param($msg); git add -A; git commit -m "$msg" }

# JS commits 51-70
"const API_URL = 'http://127.0.0.1:5000/predict';" | Out-File script.js -Encoding utf8; Make-Commit "feat(js): Add API URL constant"
Add-Content script.js "`nconst inputValue = document.getElementById('inputValue');"; Make-Commit "feat(js): Add input element reference"
Add-Content script.js "`nconst predictBtn = document.getElementById('predictBtn');"; Make-Commit "feat(js): Add button element reference"
Add-Content script.js "`nconst resultSection = document.getElementById('resultSection');"; Make-Commit "feat(js): Add result section reference"
Add-Content script.js "`nconst resultValue = document.getElementById('resultValue');"; Make-Commit "feat(js): Add result value reference"
Add-Content script.js "`nconst errorSection = document.getElementById('errorSection');"; Make-Commit "feat(js): Add error section reference"
Add-Content script.js "`nconst errorMessage = document.getElementById('errorMessage');"; Make-Commit "feat(js): Add error message reference"
Add-Content script.js "`nlet isLoading = false;"; Make-Commit "feat(js): Add loading state variable"
Add-Content script.js "`nfunction showLoading() { predictBtn.disabled = true; isLoading = true; }"; Make-Commit "feat(js): Add showLoading function"
Add-Content script.js "`nfunction hideLoading() { predictBtn.disabled = false; isLoading = false; }"; Make-Commit "feat(js): Add hideLoading function"
Add-Content script.js "`nfunction showResult(prediction) { resultValue.textContent = prediction; resultSection.classList.remove('hidden'); errorSection.classList.add('hidden'); }"; Make-Commit "feat(js): Add showResult function"
Add-Content script.js "`nfunction showError(msg) { errorMessage.textContent = msg; errorSection.classList.remove('hidden'); resultSection.classList.add('hidden'); }"; Make-Commit "feat(js): Add showError function"
Add-Content script.js "`nasync function fetchPrediction(value) { const response = await fetch(API_URL, { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ value }) }); return response.json(); }"; Make-Commit "feat(js): Add fetchPrediction async function"
Add-Content script.js "`nasync function handlePrediction() { if (isLoading) return; const value = parseFloat(inputValue.value); if (isNaN(value)) { showError('Please enter a valid number'); return; } showLoading(); try { const result = await fetchPrediction(value); if (result.success) showResult(result.prediction); else showError(result.error); } catch (e) { showError('Connection failed'); } finally { hideLoading(); } }"; Make-Commit "feat(js): Add handlePrediction main function"
Add-Content script.js "`npredictBtn.addEventListener('click', handlePrediction);"; Make-Commit "feat(js): Add click event listener"
Add-Content script.js "`ninputValue.addEventListener('keypress', (e) => { if (e.key === 'Enter') handlePrediction(); });"; Make-Commit "feat(js): Add Enter key support"
Add-Content script.js "`ndocument.addEventListener('DOMContentLoaded', () => inputValue.focus());"; Make-Commit "feat(js): Add auto-focus on load"
Add-Content script.js "`nconsole.log('Linear Regression Predictor initialized');"; Make-Commit "feat(js): Add init log message"
Add-Content script.js "`n// API endpoint: POST /predict with { value: number }"; Make-Commit "docs(js): Add API documentation comment"
Add-Content script.js "`n// Returns: { success: true, prediction: number }"; Make-Commit "docs(js): Add response documentation"

Write-Host "Phase 3 complete: Commits 51-70"
