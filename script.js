/**
 * Linear Regression Predictor - Frontend JavaScript
 * =================================================
 * Handles user interactions and API communication
 * for the Linear Regression prediction web app.
 */

// ============================================================
// Configuration
// ============================================================
const API_URL = 'http://127.0.0.1:5000/predict';

// ============================================================
// DOM Element References
// ============================================================
const inputValue = document.getElementById('inputValue');
const predictBtn = document.getElementById('predictBtn');
const btnText = predictBtn.querySelector('.btn-text');
const spinner = predictBtn.querySelector('.spinner');
const resultSection = document.getElementById('resultSection');
const resultValue = document.getElementById('resultValue');
const errorSection = document.getElementById('errorSection');
const errorMessage = document.getElementById('errorMessage');

// ============================================================
// State Management
// ============================================================
let isLoading = false;

// ============================================================
// UI Helper Functions
// ============================================================

/**
 * Shows the loading state on the predict button
 */
function showLoading() {
    isLoading = true;
    predictBtn.disabled = true;
    btnText.textContent = 'Predicting...';
    spinner.classList.remove('hidden');
}

/**
 * Hides the loading state and restores button
 */
function hideLoading() {
    isLoading = false;
    predictBtn.disabled = false;
    btnText.textContent = 'Predict';
    spinner.classList.add('hidden');
}

/**
 * Displays the prediction result
 * @param {number} prediction - The predicted value
 */
function showResult(prediction) {
    // Hide any previous errors
    errorSection.classList.add('hidden');
    
    // Update and show result
    resultValue.textContent = prediction;
    resultSection.classList.remove('hidden');
    
    // Add animation by re-triggering it
    resultSection.style.animation = 'none';
    resultSection.offsetHeight; // Trigger reflow
    resultSection.style.animation = 'slideIn 0.3s ease-out';
}

/**
 * Displays an error message
 * @param {string} message - The error message to display
 */
function showError(message) {
    // Hide result section
    resultSection.classList.add('hidden');
    
    // Update and show error
    errorMessage.textContent = message;
    errorSection.classList.remove('hidden');
    
    // Add shake animation
    errorSection.style.animation = 'none';
    errorSection.offsetHeight; // Trigger reflow
    errorSection.style.animation = 'shake 0.5s ease-out';
}

/**
 * Hides all feedback sections (result and error)
 */
function hideFeedback() {
    resultSection.classList.add('hidden');
    errorSection.classList.add('hidden');
}

// ============================================================
// API Communication
// ============================================================

/**
 * Sends a prediction request to the Flask API
 * @param {number} value - The input value for prediction
 * @returns {Promise<Object>} - The API response
 */
async function fetchPrediction(value) {
    const response = await fetch(API_URL, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ value: value }),
    });

    // Parse JSON response
    const data = await response.json();

    // Check for HTTP errors
    if (!response.ok) {
        throw new Error(data.error || `HTTP Error: ${response.status}`);
    }

    return data;
}

// ============================================================
// Main Prediction Handler
// ============================================================

/**
 * Handles the prediction process
 * Validates input, calls API, and updates UI
 */
async function handlePrediction() {
    // Prevent multiple simultaneous requests
    if (isLoading) return;

    // Get and validate input
    const value = inputValue.value.trim();
    
    if (value === '') {
        showError('Please enter a numeric value');
        inputValue.focus();
        return;
    }

    const numericValue = parseFloat(value);
    
    if (isNaN(numericValue)) {
        showError('Invalid input: Please enter a valid number');
        inputValue.focus();
        return;
    }

    // Show loading state
    showLoading();
    hideFeedback();

    try {
        // Make API request
        const result = await fetchPrediction(numericValue);
        
        // Check for success response
        if (result.success) {
            showResult(result.prediction);
        } else {
            showError(result.error || 'Prediction failed');
        }
    } catch (error) {
        // Handle network or other errors
        console.error('Prediction error:', error);
        
        if (error.message.includes('Failed to fetch') || error.message.includes('NetworkError')) {
            showError('Unable to connect to server. Make sure the Flask backend is running on port 5000.');
        } else {
            showError(error.message || 'An unexpected error occurred');
        }
    } finally {
        // Always hide loading state
        hideLoading();
    }
}

// ============================================================
// Event Listeners
// ============================================================

// Handle button click
predictBtn.addEventListener('click', handlePrediction);

// Handle Enter key press in input field
inputValue.addEventListener('keypress', (event) => {
    if (event.key === 'Enter') {
        event.preventDefault();
        handlePrediction();
    }
});

// Clear error when user starts typing
inputValue.addEventListener('input', () => {
    if (!errorSection.classList.contains('hidden')) {
        hideFeedback();
    }
});

// ============================================================
// Initialization
// ============================================================

// Focus input field on page load
document.addEventListener('DOMContentLoaded', () => {
    inputValue.focus();
    console.log('Linear Regression Predictor initialized');
    console.log('API endpoint:', API_URL);
});
