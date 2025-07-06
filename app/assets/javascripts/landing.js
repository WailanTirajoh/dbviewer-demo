// Enhanced landing page interactions

// Copy to clipboard functionality
function copyToClipboard(elementId) {
  const element = document.getElementById(elementId);
  const text = element.textContent;

  navigator.clipboard.writeText(text).then(
    function () {
      // Show success message
      const btn = event.target;
      const originalText = btn.textContent;
      btn.textContent = "Copied!";
      btn.classList.add("copy-success");

      // Reset button text after 2 seconds
      setTimeout(function () {
        btn.textContent = originalText;
        btn.classList.remove("copy-success");
      }, 2000);
    },
    function (err) {
      console.error("Could not copy text: ", err);
      // Show error message
      const btn = event.target;
      btn.textContent = "Error!";
      btn.classList.add("copy-error");

      // Reset button text after 2 seconds
      setTimeout(function () {
        btn.textContent = "Copy";
        btn.classList.remove("copy-error");
      }, 2000);
    }
  );
}

// Smooth scroll for anchor links
document.addEventListener("DOMContentLoaded", function () {
  // Get all anchor links
  const anchorLinks = document.querySelectorAll('a[href^="#"]');

  // Add click event listener to each anchor link
  anchorLinks.forEach((link) => {
    link.addEventListener("click", function (e) {
      e.preventDefault();

      // Get the target element
      const targetId = this.getAttribute("href");
      if (targetId === "#") return;

      const targetElement = document.querySelector(targetId);
      if (!targetElement) return;

      // Scroll to target element smoothly
      targetElement.scrollIntoView({
        behavior: "smooth",
        block: "start",
      });
    });
  });

  // Add intersection observer for elements to animate when they come into view
  if ("IntersectionObserver" in window) {
    const options = {
      root: null,
      rootMargin: "0px",
      threshold: 0.1,
    };

    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          observer.unobserve(entry.target);
        }
      });
    }, options);

    // Observe all feature cards, step cards, and advanced-config sections
    const elementsToObserve = document.querySelectorAll(
      ".feature-card, .step-card, .advanced-config, .demo-screenshot"
    );
    elementsToObserve.forEach((element) => {
      observer.observe(element);
    });
  }
});
