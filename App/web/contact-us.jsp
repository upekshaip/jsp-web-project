<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pageTitle = "Contact Us";
    request.setAttribute("title", pageTitle);

    request.setAttribute("url", "./img/ro.jpg");
    request.setAttribute("topic", "ALWAYS CONTACT US");
    request.setAttribute("description", "If you have any kind of problems feel free to ask anything...");
%>
<jsp:include page="./SiteParts/dash_header.jsp" />
<jsp:include page="./SiteParts/alerts.jsp" />   
<jsp:include page="./SiteParts/jambo.jsp" />   
<jsp:include page="./SiteParts/jambo.jsp" />


<section class="defalt-container-style container contact-section">
    <div class="contact-left">
        <h3 class="mb-4">Write Us</h3>
        <form class="row g-3" method="post" action="ContactUs">
            <div class="col-md-12">
                <label  class="form-label">Name</label>
                <input type="text" class="form-control form-control-sm defalt-input-style text-white" required name="name" >
            </div>
            <div class="col-md-12">
                <label  class="form-label">Email</label>
                <input type="email" class="form-control form-control-sm defalt-input-style text-white" required name="email">
            </div>
            <div class="col-md-12">
                <label  class="form-label">Subject</label>
                <input type="text" class="form-control form-control-sm defalt-input-style text-white" required name="subject">
            </div>
            <div class="col-md-12">
                <label  class="form-label">Message</label>
                <textarea class="form-control form-control-sm defalt-input-style text-white" id="exampleFormControlTextarea1" name="message" rows="3" required placeholder="Message"></textarea>
            </div>
            <button class="btn btn-warning col-12 mt-3" type="submit">Contact</button>
        </form>
    </div>
    <div class="contact-right">
        <h3 class="m-0">Write Us</h3>
        <p class="m-0 mb-5">We are open for any suggestions or just to have a chat.</p>
        <p class="m-0"><b>Address: </b>198 West 21 Street.</p>
        <p class="m-0"><b>Phone: </b>+123456789</p>
        <p class="m-0"><b>Email: </b>info@gmail.com</p>
        <p class="m-0"><b>Website: </b>yourwebsite.com</p>
    </div>
</section>


<jsp:include page="./SiteParts/dash_footer.jsp" />   