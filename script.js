const API_URL = 'http://127.0.0.1:5000/predict';

const inputValue = document.getElementById('inputValue');

const predictBtn = document.getElementById('predictBtn');

const resultSection = document.getElementById('resultSection');

const resultValue = document.getElementById('resultValue');

const errorSection = document.getElementById('errorSection');

const errorMessage = document.getElementById('errorMessage');

let isLoading = false;

function showLoading() { predictBtn.disabled = true; isLoading = true; }

function hideLoading() { predictBtn.disabled = false; isLoading = false; }

function showResult(prediction) { resultValue.textContent = prediction; resultSection.classList.remove('hidden'); errorSection.classList.add('hidden'); }

function showError(msg) { errorMessage.textContent = msg; errorSection.classList.remove('hidden'); resultSection.classList.add('hidden'); }

async function fetchPrediction(value) { const response = await fetch(API_URL, { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ value }) }); return response.json(); }

async function handlePrediction() { if (isLoading) return; const value = parseFloat(inputValue.value); if (isNaN(value)) { showError('Please enter a valid number'); return; } showLoading(); try { const result = await fetchPrediction(value); if (result.success) showResult(result.prediction); else showError(result.error); } catch (e) { showError('Connection failed'); } finally { hideLoading(); } }

predictBtn.addEventListener('click', handlePrediction);

inputValue.addEventListener('keypress', (e) => { if (e.key === 'Enter') handlePrediction(); });

document.addEventListener('DOMContentLoaded', () => inputValue.focus());
