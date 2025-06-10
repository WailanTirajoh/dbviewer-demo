// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

// Copy to clipboard functionality for code blocks
function copyToClipboard(elementId) {
  const codeElement = document.getElementById(elementId);
  const text = codeElement.textContent;

  navigator.clipboard
    .writeText(text)
    .then(function () {
      // Find the copy button and show feedback
      const button = codeElement
        .closest(".code-block")
        .querySelector(".copy-btn");
      const originalText = button.textContent;
      button.textContent = "Copied!";
      button.style.backgroundColor = "#28a745";

      setTimeout(() => {
        button.textContent = originalText;
        button.style.backgroundColor = "";
      }, 2000);
    })
    .catch(function (err) {
      console.error("Failed to copy: ", err);
    });
}

// Make function globally available
window.copyToClipboard = copyToClipboard;
