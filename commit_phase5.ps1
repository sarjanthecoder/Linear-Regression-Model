# Phase 5: Documentation & Final (Commits 86-100)
$projectDir = "C:\Users\sarja\Downloads\machine learning linear regression"
Set-Location $projectDir

function Make-Commit { param($msg); git add -A; git commit -m "$msg" }

# README commits 86-95
"# Linear Regression Model" | Out-File README.md -Encoding utf8; Make-Commit "docs: Reset README with title"
Add-Content README.md "`n`n[![Python](https://img.shields.io/badge/Python-3.8+-blue)](https://python.org)"; Make-Commit "docs: Add Python badge"
Add-Content README.md "`n[![Flask](https://img.shields.io/badge/Flask-2.0+-black)](https://flask.palletsprojects.com)"; Make-Commit "docs: Add Flask badge"
Add-Content README.md "`n[![Scikit-learn](https://img.shields.io/badge/Scikit--learn-1.0+-orange)](https://scikit-learn.org)"; Make-Commit "docs: Add Scikit-learn badge"
Add-Content README.md "`n`n## Features`n- Linear Regression predictions`n- Modern UI`n- REST API"; Make-Commit "docs: Add features section"
Add-Content README.md "`n`n## Installation`n``````bash`npip install flask flask-cors scikit-learn numpy`n``````"; Make-Commit "docs: Add installation section"
Add-Content README.md "`n`n## Usage`n``````bash`npython app.py`n``````"; Make-Commit "docs: Add usage section"
Add-Content README.md "`n`n## API`nPOST /predict - { value: number }"; Make-Commit "docs: Add API section"
Add-Content README.md "`n`n## Author`nSarjan The Coder - codecrafter2005@gmail.com"; Make-Commit "docs: Add author section"
Add-Content README.md "`n`n## License`nMIT License"; Make-Commit "docs: Add license section"

# Final polish commits 96-100
Copy-Item "$projectDir\index.html" "$projectDir\index_final.html" -Force
Get-Content "$projectDir\..\machine learning linear regression\index.html" -Raw | Out-File "$projectDir\index.html" -Encoding utf8
Make-Commit "feat: Update HTML with full enhanced version"

Copy-Item "$projectDir\style.css" "$projectDir\style_final.css" -Force  
Get-Content "$projectDir\..\machine learning linear regression\style.css" -Raw | Out-File "$projectDir\style.css" -Encoding utf8
Make-Commit "style: Update CSS with full enhanced version"

Copy-Item "$projectDir\script.js" "$projectDir\script_final.js" -Force
Get-Content "$projectDir\..\machine learning linear regression\script.js" -Raw | Out-File "$projectDir\script.js" -Encoding utf8
Make-Commit "feat: Update JS with full enhanced version"

Copy-Item "$projectDir\app.py" "$projectDir\app_final.py" -Force
Get-Content "$projectDir\..\machine learning linear regression\app.py" -Raw | Out-File "$projectDir\app.py" -Encoding utf8
Make-Commit "feat: Update Flask app with full version"

Get-Content "$projectDir\..\machine learning linear regression\README.md" -Raw | Out-File "$projectDir\README.md" -Encoding utf8
Make-Commit "docs: Update README with full documentation"

# Cleanup temp files
Remove-Item "$projectDir\index_final.html" -ErrorAction SilentlyContinue
Remove-Item "$projectDir\style_final.css" -ErrorAction SilentlyContinue
Remove-Item "$projectDir\script_final.js" -ErrorAction SilentlyContinue
Remove-Item "$projectDir\app_final.py" -ErrorAction SilentlyContinue
Remove-Item "$projectDir\commit_phase*.ps1" -ErrorAction SilentlyContinue
git add -A
git commit -m "chore: Clean up temporary files"

Write-Host "Phase 5 complete: Commits 86-100+"
