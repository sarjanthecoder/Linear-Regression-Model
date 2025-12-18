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
