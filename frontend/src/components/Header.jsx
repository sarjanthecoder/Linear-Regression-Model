import './Header.css'

function Header() {
    return (
        <header className="header">
            <div className="header-container">
                <div className="logo">
                    <span className="logo-icon">🧠</span>
                    <span className="logo-text">ML<span className="logo-accent">Predict</span></span>
                </div>
                <nav className="nav">
                    <a href="#" className="nav-link active">Home</a>
                    <a href="#predictor" className="nav-link">Predictor</a>
                    <a href="#about" className="nav-link">About</a>
                    <a href="https://github.com/sarjanthecoder/Linear-Regression-Model" className="nav-link github-link" target="_blank" rel="noopener noreferrer">GitHub</a>
                </nav>
            </div>
        </header>
    )
}

export default Header
