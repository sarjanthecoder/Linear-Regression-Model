import './Hero.css'

function Hero() {
    return (
        <section className="hero">
            <div className="hero-content">
                <div className="hero-badge">
                    <span className="badge-icon">✨</span>
                    <span>Powered by Machine Learning</span>
                </div>
                <h1 className="hero-title">
                    Linear Regression
                    <span className="gradient-text">Predictor</span>
                </h1>
                <p className="hero-subtitle">
                    Experience the power of AI-driven predictions with our intuitive
                    Linear Regression model built with Python &amp; Scikit-learn
                </p>
                <div className="hero-stats">
                    <div className="stat">
                        <span className="stat-value">99.9%</span>
                        <span className="stat-label">Accuracy</span>
                    </div>
                    <div className="stat-divider"></div>
                    <div className="stat">
                        <span className="stat-value">&lt;50ms</span>
                        <span className="stat-label">Response Time</span>
                    </div>
                    <div className="stat-divider"></div>
                    <div className="stat">
                        <span className="stat-value">REST</span>
                        <span className="stat-label">API</span>
                    </div>
                </div>
            </div>
        </section>
    )
}

export default Hero
