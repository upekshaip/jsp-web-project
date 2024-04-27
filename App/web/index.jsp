<%@page import="java.util.HashMap"%>
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
<%  } %>

<section class="mb-4 container defalt-container-style"
         style="position:relative;background: url('./img/1.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover; padding: 0;">
    <div style="width:100%; height:100%; background-color: rgba(0, 0, 0, 0.4);">
        <div class="text-white rounded" style="padding: 100px 50px">
            <h1 style="color:white;">Hello,
                <%
                    if (role != null) {
                %>
                <%=((HashMap) session.getAttribute("user")).get("first_name")%>
                <%
                } else { %>
                Welcome...
                <% }%>
            </h1>
            <p>This is the best place to buy hand watches!</p>
            <a href="./products.jsp" class="btn btn-warning mt-5" style="width: 120px"><b>Products</b></a>
        </div>
    </div>
</section>


<section class=" text-white p-0 container defalt-container-style">
    <div class="title_info text-center mb-5 mt-5">
        <h1 class="m-0">We Consider,</h1>
        <p>Empowering Your Health Journey With QR Code technology</p>
    </div>
    <table class="table-sec">
        <tr class="tr-index">
            <td class="table-div image-container">
                <img class="brand-img" src="img/3.jpg" alt="" width="100%">
            </td>
            <td class="table-div text-table-div p-3">
                <h3>Quality</h3>
                <p>At WristWise, quality is our hallmark. Each hand watch featured on our platform undergoes meticulous inspection to meet our exacting standards. From exquisite craftsmanship to premium materials, we're dedicated to offering timepieces that epitomize luxury and precision, ensuring that every purchase is a testament to uncompromising quality.</p>
            </td>
        </tr>
        <tr class="tr-index tr-invert">
            <td class="table-div text-table-div p-3">
                <h3>Durability</h3>
                <p>When it comes to durability, WristWise stands the test of time. Our curated selection of watches is built to endure the demands of daily life, crafted with durability at the forefront. Designed to accompany you through every adventure, our watches promise resilience and reliability, ensuring that they remain steadfast companions for years to come.</p>
            </td>
            <td class="table-div image-container">
                <img class="brand-img" src="img/4.jpg" alt="" width="100%">
            </td>
        </tr>
        <tr class="tr-index">
            <td class="table-div image-container">
                <img class="brand-img" src="img/5.jpg" alt="" width="100%">
            </td>
            <td class="table-div text-table-div p-3">
                <h3>Reliability</h3>
                <p>WristWise is your trusted partner in time. We prioritize reliability in every aspect of our service, from secure transactions to dependable customer support. With us, you can shop with confidence, knowing that each purchase is backed by our unwavering commitment to your satisfaction. Experience peace of mind with WristWise, where reliability meets excellence.</p>
            </td>
        </tr>
    </table>

</section>

<section class="container mt-5 p-0">
    <div class="title_info text-center mb-5">
        <h1 class="m-0">Explore Our Services</h1>
    </div>
    <div class="service-contents">
        <div class="service-box text-center">
            <div class="service-img">
                <img src="img/service-1.jpg" class="img-fluid" alt="...">
            </div>


            <h4 class="mb-4 mt-5">Security & Privacy</h4>
            <p class="p-0">Security and privacy are paramount in everything we do. Our rigorous protocols and advanced encryption techniques ensure your data remains safe and confidential, allowing you to explore our services with peace of mind.</p>

        </div>
        <div class="service-box text-center">
            <div class="service-img">
                <img src="img/service-2.png" class="img-fluid" alt="...">
            </div>
            <h4 class="mb-4 mt-5">Probability & Accessibility</h4>
            <p>Discover the reliability and accessibility woven into every facet of our services. With a focus on probability and accessibility, we ensure that our solutions are available whenever you need them, empowering you to navigate with confidence.</p>
        </div>
        <div class="service-box text-center">
            <div class="service-img">
                <img src="img/service-3.jpg" class="img-fluid" alt="...">
            </div>
            <h4 class="mb-4 mt-5">
                Convenience In Access
            </h4>
            <p>Experience unparalleled convenience with our streamlined access options. Whether you're on-the-go or at home, our services are designed to be effortlessly accessible, providing you with the freedom to explore and engage at your convenience.</p>
        </div>
    </div>
</section>



<jsp:include page="./SiteParts/dash_footer.jsp" />   