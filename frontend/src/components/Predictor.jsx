import { useState } from 'react'
import './Predictor.css'

// Use environment variable for API URL, fallback to localhost for development
const API_URL = import.meta.env.VITE_API_URL || 'http://127.0.0.1:5000/predict'

function Predictor() {
    const [inputValue, setInputValue] = useState('')
    const [prediction, setPrediction] = useState(null)
    const [error, setError] = useState(null)
    const [isLoading, setIsLoading] = useState(false)

    const handlePredict = async () => {
        if (isLoading) return

        if (!inputValue.trim()) {
            setError('Please enter a numeric value')
            setPrediction(null)
            return
        }

        const numericValue = parseFloat(inputValue)
        if (isNaN(numericValue)) {
            setError('Invalid input: Please enter a valid number')
            setPrediction(null)
            return
        }

        setIsLoading(true)
        setError(null)

        try {
            const response = await fetch(API_URL, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ value: numericValue }),
            })
            const data = await response.json()

            if (data.success) {
                setPrediction(data.prediction)
                setError(null)
            } else {
                setError(data.error || 'Prediction failed')
                setPrediction(null)
            }
        } catch (err) {
            setError('Unable to connect to server. Make sure Flask is running on port 5000.')
            setPrediction(null)
        } finally {
            setIsLoading(false)
        }
    }

    const handleKeyPress = (e) => {
        if (e.key === 'Enter') handlePredict()
    }

    return (
        <main className="container" id="predictor">
            <div className="card">
                <div className="card-header">
                    <div className="icon">📈</div>
                    <h2>Make a Prediction</h2>
                    <p className="subtitle">Enter a numeric value to predict the output using our trained model</p>
                </div>

                <div className="input-section">
                    <label htmlFor="inputValue">Input Value (X)</label>
                    <div className="input-wrapper">
                        <input
                            type="number"
                            id="inputValue"
                            placeholder="Enter a number (e.g., 25)"
                            value={inputValue}
                            onChange={(e) => setInputValue(e.target.value)}
                            onKeyPress={handleKeyPress}
                        />
                        <span className="input-icon">🔢</span>
                    </div>
                </div>

                <button className="predict-btn" onClick={handlePredict} disabled={isLoading}>
                    <span className="btn-text">{isLoading ? 'Predicting...' : 'Predict Now'}</span>
                    {!isLoading && <span className="btn-icon">🚀</span>}
                    {isLoading && <span className="spinner"></span>}
                </button>

                {prediction !== null && (
                    <div className="result-section">
                        <div className="result-label">Predicted Value (Y)</div>
                        <div className="result-value">{prediction}</div>
                        <div className="result-formula">y = 10x + 0</div>
                    </div>
                )}

                {error && (
                    <div className="error-section">
                        <span className="error-icon">⚠️</span>
                        <span className="error-message">{error}</span>
                    </div>
                )}

                <div className="model-info">
                    <div className="info-item"><span className="info-icon">📊</span><span>Model: <strong>Linear Regression</strong></span></div>
                    <div className="info-item"><span className="info-icon">🎯</span><span>Formula: <strong>y = 10x + 0</strong></span></div>
                </div>
            </div>
        </main>
    )
}

export default Predictor
