<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String pageTitle = "LogIn";
    request.setAttribute("title", pageTitle);
%>

<jsp:include page="./SiteParts/header.jsp" />

<section class="signup-content d-felx justify-center align-items-center">
    <div class="signup-left">
        <img src="./img/2.jpg" alt="" style="height: 100%; width: auto; opacity: 1;">
    </div>

    <div class="signup-right">
        <div class="container">
            <h3 class="text-center my-5 light-container-style py-3" style="margin: 0 !important;">LogIn</h3>
            <jsp:include page="./SiteParts/alerts.jsp" />   
            <form class="row g-3 needs-validation light-container-style " method="post" action="LoginServlet">
                <div class="col-md-12">
                    <label  class="form-label">Username / Email</label>
                    <input type="text" class="form-control form-control-sm defalt-input-style text-white" name="username" placeholder="Username Or Email" required>
                </div>
                <div class="col-md-12">
                    <label  class="form-label">Password</label>
                    <input type="password" class="form-control defalt-input-style text-white form-control-sm" name="password" placeholder="Password" required>
                </div>

                <button class="btn btn-warning col-12 mt-5 mb-3" type="submit">Log In</button>
            </form>

            <div class="text-white light-container-style">
                <p style="text-align: center; margin: 0; font-size: 14px;">Don't have an account? <a href="./signup.jsp">Sign Up</a></p>
            </div>
        </div>
    </div>




    <jsp:include page="./SiteParts/footer.jsp" />   