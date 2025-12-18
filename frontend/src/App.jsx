import { useState } from 'react'
import Header from './components/Header'
import Hero from './components/Hero'
import Predictor from './components/Predictor'
import About from './components/About'
import TechStack from './components/TechStack'
import Footer from './components/Footer'
import Particles from './components/Particles'
import './App.css'

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
