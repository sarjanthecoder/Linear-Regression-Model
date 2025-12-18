import './Footer.css'

function Footer() {
    return (
        <footer className="footer">
            <div className="footer-container">
                <div className="footer-top">
                    <div className="footer-brand">
                        <div className="footer-logo">
                            <span className="logo-icon">🧠</span>
                            <span className="logo-text">ML<span className="logo-accent">Predict</span></span>
                        </div>
                        <p className="footer-tagline">Empowering predictions with Machine Learning</p>
                    </div>
                    <div className="footer-links">
                        <div className="footer-section">
                            <h4>Quick Links</h4>
                            <a href="#">Home</a>
                            <a href="#predictor">Predictor</a>
                            <a href="#about">About</a>
                        </div>
                        <div className="footer-section">
                            <h4>Resources</h4>
                            <a href="https://scikit-learn.org" target="_blank" rel="noopener noreferrer">Scikit-learn</a>
                            <a href="https://flask.palletsprojects.com" target="_blank" rel="noopener noreferrer">Flask Docs</a>
                            <a href="https://react.dev" target="_blank" rel="noopener noreferrer">React Docs</a>
                        </div>
                        <div className="footer-section">
                            <h4>Connect</h4>
                            <a href="https://github.com/sarjanthecoder" target="_blank" rel="noopener noreferrer">GitHub</a>
                            <a href="mailto:codecrafter2005@gmail.com">Email</a>
                        </div>
                    </div>
                </div>
                <div className="footer-divider"></div>
                <div className="footer-bottom">
                    <p className="copyright">
                        © 2024 MLPredict. Built with ❤️ by <a href="https://github.com/sarjanthecoder" target="_blank" rel="noopener noreferrer">Sarjan The Coder</a>
                    </p>
                    <div className="footer-tech">
                        <span>Made with</span>
                        <span className="tech-badge">React</span>
                        <span className="tech-badge">Flask</span>
                        <span className="tech-badge">Scikit-learn</span>
                    </div>
                </div>
            </div>
        </footer>
    )
}

export default Footer
