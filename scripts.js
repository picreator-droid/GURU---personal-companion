// Form Validation and Submission
document.getElementById("questionForm").addEventListener("submit", function (event) {
    event.preventDefault();

    // Get form values
    let hindi = document.getElementById("contentHindi").value.trim();
    let english = document.getElementById("contentEnglish").value.trim();
    let category = document.getElementById("category").value;

    // Reset error states
    clearErrors();

    // Validate inputs
    let hasError = false;
    if (!hindi) {
        showError("contentHindi", "Please enter the question in Hindi.");
        hasError = true;
    }
    if (!english) {
        showError("contentEnglish", "Please enter the question in English.");
        hasError = true;
    }
    if (!category) {
        showError("category", "Please select a category.");
        hasError = true;
    }

    if (hasError) return;

    // Simulate a successful form submission
    alert("Question added successfully!");

    // Clear the form
    this.reset();
});

// Function to show error
function showError(elementId, message) {
    const element = document.getElementById(elementId);
    element.classList.add("is-invalid");
    const feedback = element.nextElementSibling;
    if (feedback) feedback.textContent = message;
}

// Function to clear all error states
function clearErrors() {
    document.querySelectorAll(".is-invalid").forEach((element) => {
        element.classList.remove("is-invalid");
    });
}

// Form Validation and Submission
document.getElementById("questionForm").addEventListener("submit", function (event) {
    event.preventDefault();

    // Get form values
    let hindi = document.getElementById("contentHindi").value.trim();
    let english = document.getElementById("contentEnglish").value.trim();
    let category = document.getElementById("category").value;

    // Reset error states
    clearErrors();

    // Validate inputs
    let hasError = false;
    if (!hindi) {
        showError("contentHindi", "Please enter the question in Hindi.");
        hasError = true;
    } else if (!/^[\u0900-\u097F\s]+$/.test(hindi)) {
        showError("contentHindi", "Hindi question must contain valid Hindi characters.");
        hasError = true;
    }

    if (!english) {
        showError("contentEnglish", "Please enter the question in English.");
        hasError = true;
    } else if (!/^[a-zA-Z\s]+$/.test(english)) {
        showError("contentEnglish", "English question must contain only letters.");
        hasError = true;
    }

    if (!category) {
        showError("category", "Please select a category.");
        hasError = true;
    }

    if (hasError) return;

    // Simulate a successful form submission
    alert("Question added successfully!");
    this.reset();
});

// Function to show error
function showError(elementId, message) {
    const element = document.getElementById(elementId);
    element.classList.add("is-invalid");
    const feedback = element.nextElementSibling;
    if (feedback) feedback.textContent = message;
}

// Function to clear all error states
function clearErrors() {
    document.querySelectorAll(".is-invalid").forEach((element) => {
        element.classList.remove("is-invalid");
    });
}

document.getElementById("contentHindi").addEventListener("input", function () {
    updateCharacterCount("contentHindi", "hindiCharCount");
});

document.getElementById("contentEnglish").addEventListener("input", function () {
    updateCharacterCount("contentEnglish", "englishCharCount");
});

function updateCharacterCount(fieldId, counterId) {
    const value = document.getElementById(fieldId).value.trim();
    document.getElementById(counterId).textContent = `${value.length} characters`;
}

