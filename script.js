const API_URL = 'http://127.0.0.1:5000/predict';
const inputValue = document.getElementById('inputValue');
const predictBtn = document.getElementById('predictBtn');
const btnText = predictBtn.querySelector('.btn-text');
const spinner = predictBtn.querySelector('.spinner');
const resultSection = document.getElementById('resultSection');
const resultValue = document.getElementById('resultValue');
const errorSection = document.getElementById('errorSection');
const errorMessage = document.getElementById('errorMessage');
let isLoading = false;

function showLoading() {
    isLoading = true;
    predictBtn.disabled = true;
    btnText.textContent = 'Predicting...';
    spinner.classList.remove('hidden');
}

function hideLoading() {
    isLoading = false;
    predictBtn.disabled = false;
    btnText.textContent = 'Predict Now';
    spinner.classList.add('hidden');
}

function showResult(prediction) {
    errorSection.classList.add('hidden');
    resultValue.textContent = prediction;
    resultSection.classList.remove('hidden');
    resultSection.style.animation = 'none';
    resultSection.offsetHeight;
    resultSection.style.animation = 'slideIn 0.3s ease-out';
}

function showError(message) {
    resultSection.classList.add('hidden');
    errorMessage.textContent = message;
    errorSection.classList.remove('hidden');
    errorSection.style.animation = 'none';
    errorSection.offsetHeight;
    errorSection.style.animation = 'shake 0.5s ease-out';
}

async function fetchPrediction(value) {
    const response = await fetch(API_URL, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ value: value }),
    });
    const data = await response.json();
    if (!response.ok) throw new Error(data.error || `HTTP Error: ${response.status}`);
    return data;
}

async function handlePrediction() {
    if (isLoading) return;
    const value = inputValue.value.trim();
    if (value === '') { showError('Please enter a numeric value'); inputValue.focus(); return; }
    const numericValue = parseFloat(value);
    if (isNaN(numericValue)) { showError('Invalid input: Please enter a valid number'); inputValue.focus(); return; }
    showLoading();
    try {
        const result = await fetchPrediction(numericValue);
        if (result.success) showResult(result.prediction);
        else showError(result.error || 'Prediction failed');
    } catch (error) {
        console.error('Prediction error:', error);
        if (error.message.includes('Failed to fetch')) showError('Unable to connect to server. Make sure Flask is running.');
        else showError(error.message || 'An unexpected error occurred');
    } finally { hideLoading(); }
}

predictBtn.addEventListener('click', handlePrediction);
inputValue.addEventListener('keypress', (e) => { if (e.key === 'Enter') { e.preventDefault(); handlePrediction(); } });
inputValue.addEventListener('input', () => { if (!errorSection.classList.contains('hidden')) { resultSection.classList.add('hidden'); errorSection.classList.add('hidden'); } });
document.addEventListener('DOMContentLoaded', () => { inputValue.focus(); console.log('Linear Regression Predictor initialized'); });
