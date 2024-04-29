<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lazy Loading Example</title>
    <style>
        .lazy {
            display: block;
            width: 100%;
            height: auto;
            min-height: 200px; 
            background-color: #f0f0f0; 
        }
    </style>
</head>
<body>
    
    <!-- Placeholder image -->
    <img class="lazy" data-src="placeholder.jpg" alt="Placeholder Image">

    <!-- Actual image is loaded when scrolled into view -->
    <jsp:include page="lazyLoadImages.jsp"></jsp:include>

    <script>
        // Lazy load images when they come into view
        document.addEventListener("DOMContentLoaded", function() {
            var lazyImages = document.querySelectorAll('img.lazy');
            var options = {
                rootMargin: '0px 0px 51px 0px', // Adjust root margin as needed
                threshold: 0.1
            };
            var lazyLoad = function(entries, observer) {
                entries.forEach(function(entry) {
                    if (entry.isIntersecting) {
                        var lazyImage = entry.target;
                        lazyImage.src = lazyImage.getAttribute('data-src');
                        lazyImage.classList.remove('lazy');
                        observer.unobserve(lazyImage);
                    }
                });
            };

            });
        });
    </script>
</body>
</html>
