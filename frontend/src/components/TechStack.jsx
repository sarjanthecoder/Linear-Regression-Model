import './TechStack.css'

const techItems = [
    { icon: '🐍', name: 'Python' },
    { icon: '🌶️', name: 'Flask' },
    { icon: '🤖', name: 'Scikit-learn' },
    { icon: '📊', name: 'NumPy' },
    { icon: '⚛️', name: 'React' },
    { icon: '⚡', name: 'Vite' },
    { icon: '🎨', name: 'CSS3' },
    { icon: '🔗', name: 'REST API' },
]

function TechStack() {
    return (
        <section className="tech-section">
            <div className="tech-container">
                <h2 className="section-title">Tech Stack</h2>
                <div className="tech-grid">
                    {techItems.map((item, index) => (
                        <div className="tech-item" key={index}>
                            <span className="tech-icon">{item.icon}</span>
                            <span className="tech-name">{item.name}</span>
                        </div>
                    ))}
                </div>
            </div>
        </section>
    )
}

export default TechStack
