import './Particles.css'

function Particles() {
    return (
        <div className="particles">
            {[...Array(10)].map((_, i) => (
                <div className="particle" key={i}></div>
            ))}
        </div>
    )
}

export default Particles
