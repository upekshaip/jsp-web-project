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
    
    
    <img class="lazy" data-src="placeholder.jpg" alt="Placeholder Image">

   
    <jsp:include page="lazyLoadImages.jsp"></jsp:include>

    <script>
        
        document.addEventListener("DOMContentLoaded", function() {
            var lazyImg = document.querySelectorAll('img.lazy');
            var options = {
                rootMargin: '0px 0px 51px 0px',
                threshold: 0.1
            };
            var lazyLoad = function(entries, observer) {
                entries.forEach(function(entry) {
                    if (entry.isIntersecting) {
                        var lazyImg = entry.target;
                        lazyImg.src = lazyImage.getAttribute('data-src');
                        lazyImg.classList.remove('lazy');
                        observer.unobserve(lazyImg);
                    }
                });
            };

            });
        });
    </script>
</body>
</html>
