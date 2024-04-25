<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageTitle = "Home";
    request.setAttribute("title", pageTitle);
%>
<jsp:include page="./SiteParts/dash_header.jsp" />
<jsp:include page="./SiteParts/alerts.jsp" />   

<%
    String role = (String) session.getAttribute("role");
    if (role != null) { %>    
<jsp:include page="./SiteParts/submenubar.jsp" />
<%  }%>



<section class="container mt-3">
    <div class="title_info text-center mb-5">
        <h1>Explore Our Services</h1>
        <p>Empowering Your Health Journey With QR Code technology</p>
    </div>
    <div class="service-contents">
        <div class="service-box text-center">
            <div class="service-img">
                <img src="img/service-1.jpg" class="img-fluid" alt="...">
            </div>


            <h4 class="mb-4 mt-5">Security & Privacy</h4>
            <p class="p-0">Our QR code card uses a super-strong lock called encryption to make sure only the right people, like your
                healthcare providers, can open and read your medical info.</p>

        </div>
        <div class="service-box text-center">
            <div class="service-img">
                <img src="img/service-2.png" class="img-fluid" alt="...">
            </div>
            <h4 class="mb-4 mt-5">Probability & Accessibility</h4>
            <p>Our QR code card is designed to be small and light, just like your regular ID card. You can carry it in
                your wallet or even on your phone – it's that simple!</p>
        </div>
        <div class="service-box text-center">
            <div class="service-img">
                <img src="img/service-3.jpg" class="img-fluid" alt="...">
            </div>
            <h4 class="mb-4 mt-5">
                Convenience In Access
            </h4>
            <p>Your QR code card is not just a card , it's a handy tool. Use it at government hospital clinics or
                pharmacies to get quick access to your medical records.</p>
        </div>
    </div>
</section>

<section class="container">
    <div class="">

    </div>
</section>



<jsp:include page="./SiteParts/dash_footer.jsp" />   