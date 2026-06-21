<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll('a').forEach(link => {
        link.addEventListener('click', function(e) {
            // Ignore links that don't trigger a new page load
            if (this.hasAttribute('data-bs-toggle') || this.getAttribute('href') === '#' || this.target === '_blank') return;
            if (this.href.startsWith('javascript:') || this.href.startsWith('mailto:')) return;
            
            // Ignore external links
            if (this.href && !this.href.includes(window.location.host)) return;

            e.preventDefault();
            const href = this.href;
            
            // Create and append the sweep-in overlay
            const overlay = document.createElement('div');
            overlay.className = 'page-transition-overlay-in';
            document.body.appendChild(overlay);
            
            // Navigate right before the animation fully ends
            setTimeout(() => {
                window.location.href = href;
            }, 450);
        });
    });
});

// Fix for browser back button (Bfcache)
// Unconditionally remove the overlay on pageshow to fix cache issues across all browsers
window.addEventListener('pageshow', function() {
    document.querySelectorAll('.page-transition-overlay-in').forEach(el => el.remove());
});
</script>
</body>
</html>
