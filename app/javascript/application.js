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

// Initialize syntax highlighting and smooth scrolling
document.addEventListener("DOMContentLoaded", function () {
  // Add language classes to code elements
  document.querySelectorAll(".code-block").forEach((codeBlock) => {
    const language = codeBlock
      .querySelector(".code-language")
      ?.textContent?.trim()
      .toLowerCase();
    const codeElement = codeBlock.querySelector("pre code");

    if (codeElement && language) {
      codeElement.classList.add(`language-${language}`);
    }
  });

  // Initialize highlight.js (globally available from CDN)
  if (window.hljs) {
    window.hljs.highlightAll();
  }

  // Handle smooth scrolling for anchor links
  document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener("click", function (e) {
      e.preventDefault();
      const targetId = this.getAttribute("href");
      const targetElement = document.querySelector(targetId);

      if (targetElement) {
        window.scrollTo({
          top: targetElement.offsetTop,
          behavior: "smooth",
        });

        // Update URL hash without jumping
        history.pushState(null, null, targetId);
      }
    });
  });
});
