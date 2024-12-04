// Form Validation
document.getElementById("questionForm").addEventListener("submit", function (event) {
    event.preventDefault();

    let hindi = document.getElementById("contentHindi").value.trim();
    let english = document.getElementById("contentEnglish").value.trim();
    let category = document.getElementById("category").value;

    if (!hindi || !english || !category) {
        alert("All fields are required.");
        return;
    }

    // Simulate successful form submission
    alert("Question added successfully!");
    this.reset(); // Clear the form
});
