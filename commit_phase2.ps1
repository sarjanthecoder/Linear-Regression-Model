# Phase 2: CSS Styling (Commits 26-50)
$projectDir = "C:\Users\sarja\Downloads\machine learning linear regression"
Set-Location $projectDir

function Make-Commit { param($msg); git add -A; git commit -m "$msg" }

# CSS commits 26-50
"* { margin: 0; padding: 0; box-sizing: border-box; }" | Out-File style.css -Encoding utf8; Make-Commit "style: Add CSS reset"
Add-Content style.css "`nbody { font-family: 'Inter', sans-serif; }"; Make-Commit "style: Add body font family"
Add-Content style.css "`nhtml { font-size: 16px; }"; Make-Commit "style: Add base font size"
Add-Content style.css "`n:root { --primary: #667eea; }"; Make-Commit "style: Add CSS variables - primary color"
Add-Content style.css "`n:root { --bg-gradient: linear-gradient(135deg, #1a1a2e 0%, #302b63 100%); }"; Make-Commit "style: Add background gradient variable"
Add-Content style.css "`nbody { background: var(--bg-gradient); min-height: 100vh; }"; Make-Commit "style: Apply gradient background"
Add-Content style.css "`n.container { max-width: 520px; margin: 0 auto; padding: 2rem; }"; Make-Commit "style: Add container styles"
Add-Content style.css "`n.card { background: white; border-radius: 20px; padding: 2rem; }"; Make-Commit "style: Add card base styles"
Add-Content style.css "`n.card { box-shadow: 0 25px 50px rgba(0,0,0,0.25); }"; Make-Commit "style: Add card shadow"
Add-Content style.css "`n.card-header { text-align: center; margin-bottom: 1.5rem; }"; Make-Commit "style: Add card header styles"
Add-Content style.css "`n.icon { font-size: 3rem; margin-bottom: 1rem; }"; Make-Commit "style: Add icon styles"
Add-Content style.css "`nh1 { font-size: 1.75rem; color: #1a202c; }"; Make-Commit "style: Add h1 styles"
Add-Content style.css "`n.subtitle { color: #718096; font-size: 0.95rem; }"; Make-Commit "style: Add subtitle styles"
Add-Content style.css "`nlabel { display: block; font-weight: 600; margin-bottom: 0.5rem; }"; Make-Commit "style: Add label styles"
Add-Content style.css "`ninput { width: 100%; padding: 1rem; border: 2px solid #e2e8f0; border-radius: 12px; }"; Make-Commit "style: Add input base styles"
Add-Content style.css "`ninput:focus { border-color: var(--primary); outline: none; }"; Make-Commit "style: Add input focus styles"
Add-Content style.css "`n.predict-btn { width: 100%; padding: 1rem; background: var(--primary); color: white; border: none; border-radius: 12px; cursor: pointer; }"; Make-Commit "style: Add button styles"
Add-Content style.css "`n.predict-btn:hover { transform: translateY(-2px); }"; Make-Commit "style: Add button hover effect"
Add-Content style.css "`n.result-section { margin-top: 1.5rem; padding: 1rem; background: linear-gradient(135deg, #48bb78, #38a169); border-radius: 12px; text-align: center; }"; Make-Commit "style: Add result section styles"
Add-Content style.css "`n.result-value { font-size: 2.5rem; color: white; font-weight: 700; }"; Make-Commit "style: Add result value styles"
Add-Content style.css "`n.error-section { margin-top: 1rem; padding: 1rem; background: rgba(254,178,178,0.1); border: 1px solid #fc8181; border-radius: 12px; }"; Make-Commit "style: Add error section styles"
Add-Content style.css "`n.hidden { display: none !important; }"; Make-Commit "style: Add hidden utility class"
Add-Content style.css "`n@keyframes spin { to { transform: rotate(360deg); } }"; Make-Commit "style: Add spinner animation"
Add-Content style.css "`n.spinner { width: 20px; height: 20px; border: 2px solid rgba(255,255,255,0.3); border-top-color: white; border-radius: 50%; animation: spin 0.8s linear infinite; }"; Make-Commit "style: Add spinner styles"
Add-Content style.css "`n.model-info { margin-top: 1.5rem; padding-top: 1rem; border-top: 1px solid #e2e8f0; text-align: center; color: #718096; }"; Make-Commit "style: Add model info styles"

Write-Host "Phase 2 complete: Commits 26-50"
