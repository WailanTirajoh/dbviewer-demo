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
      // Fallback for mobile browsers that don't support clipboard API
      showFallbackCopyMessage(text);
    });
}

// Fallback copy method for some mobile browsers
function showFallbackCopyMessage(text) {
  // Create temporary textarea
  const textArea = document.createElement("textarea");
  textArea.value = text;
  textArea.style.position = "fixed";
  textArea.style.left = "0";
  textArea.style.top = "0";
  textArea.style.opacity = "0";
  document.body.appendChild(textArea);

  // Show instruction for mobile users
  const message = document.createElement("div");
  message.className = "copy-message";
  message.textContent = "Press and hold to copy";
  message.style.position = "fixed";
  message.style.left = "50%";
  message.style.bottom = "20px";
  message.style.transform = "translateX(-50%)";
  message.style.backgroundColor = "rgba(0,0,0,0.8)";
  message.style.color = "#fff";
  message.style.padding = "10px 20px";
  message.style.borderRadius = "4px";
  message.style.zIndex = "9999";

  document.body.appendChild(message);

  // Select the text
  textArea.focus();
  textArea.select();

  // Remove elements after delay
  setTimeout(() => {
    document.body.removeChild(textArea);
    document.body.removeChild(message);
  }, 3000);
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

    // Make code blocks horizontally scrollable on touch devices
    const preElement = codeBlock.querySelector("pre");
    if (preElement) {
      // Add touch events for better mobile scrolling experience
      let isScrolling = false;
      let startX;
      let scrollLeft;

      preElement.addEventListener(
        "touchstart",
        (e) => {
          isScrolling = true;
          startX = e.touches[0].pageX - preElement.offsetLeft;
          scrollLeft = preElement.scrollLeft;
          preElement.style.userSelect = "none";
        },
        { passive: true }
      );

      preElement.addEventListener(
        "touchmove",
        (e) => {
          if (!isScrolling) return;
          const x = e.touches[0].pageX - preElement.offsetLeft;
          const walk = (x - startX) * 1.5; // Scroll speed multiplier
          preElement.scrollLeft = scrollLeft - walk;
        },
        { passive: true }
      );

      preElement.addEventListener(
        "touchend",
        () => {
          isScrolling = false;
          preElement.style.userSelect = "text";
        },
        { passive: true }
      );

      // Double tap to zoom/fit content (mobile)
      let lastTap = 0;
      preElement.addEventListener("touchend", (e) => {
        const currentTime = new Date().getTime();
        const tapLength = currentTime - lastTap;
        if (tapLength < 300 && tapLength > 0) {
          e.preventDefault();
          // Toggle font size to zoom in/out
          if (preElement.style.fontSize === "120%") {
            preElement.style.fontSize = "";
          } else {
            preElement.style.fontSize = "120%";
          }
        }
        lastTap = currentTime;
      });
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
