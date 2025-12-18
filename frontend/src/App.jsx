import Header from './components/Header'
import Hero from './components/Hero'
import Predictor from './components/Predictor'
import About from './components/About'
import TechStack from './components/TechStack'
import Footer from './components/Footer'
import Particles from './components/Particles'

// Import all component CSS
import './components/Header.css'
import './components/Hero.css'
import './components/Predictor.css'
import './components/About.css'
import './components/TechStack.css'
import './components/Footer.css'
import './components/Particles.css'

function App() {
  return (
    <div className="app">
      <Particles />
      <Header />
      <Hero />
      <Predictor />
      <About />
      <TechStack />
      <Footer />
    </div>
  )
}

export default App
