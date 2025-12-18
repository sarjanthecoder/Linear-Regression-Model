import './About.css'

const features = [
    { icon: '🧮', title: 'Linear Regression', desc: 'Uses scikit-learn\'s powerful LinearRegression algorithm.' },
    { icon: '🐍', title: 'Python Backend', desc: 'Built with Flask for efficient API handling.' },
    { icon: '⚡', title: 'Real-time API', desc: 'RESTful design with JSON responses.' },
    { icon: '🎨', title: 'Modern UI', desc: 'Clean, responsive React interface with animations.' },
]

function About() {
    return (
        <section className="about-section" id="about">
            <div className="about-container">
                <h2 className="section-title">How It Works</h2>
                <div className="features-grid">
                    {features.map((feature, index) => (
                        <div className="feature-card" key={index}>
                            <div className="feature-icon">{feature.icon}</div>
                            <h3>{feature.title}</h3>
                            <p>{feature.desc}</p>
                        </div>
                    ))}
                </div>
            </div>
        </section>
    )
}

export default About
