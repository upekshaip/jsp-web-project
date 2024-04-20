<%@page import="Config.Functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String pageTitle = "Sign Up";
    request.setAttribute("title", pageTitle);
%>

<jsp:include page="./SiteParts/header.jsp" />

 <section class="signup-content d-felx justify-center align-items-center">
    <div class="signup-left">
        <img src="./img/3.jpg" alt="" style="height: 100%; width: auto; opacity: 1;">
    </div>
     
    <div class="signup-right">
        <div class="container">
            <h3 class="text-center my-5 light-container-style py-3" style="margin: 0 !important;">Sign Up</h3>
             <jsp:include page="./SiteParts/alerts.jsp" />   
            <form class="row g-3 needs-validation light-container-style " method="post" action="SignupServlet">
                <div class="col-md-6">
                  <label  class="form-label">First Name</label>
                  <input type="text" class="form-control form-control-sm defalt-input-style text-white" required name="first_name" placeholder="First Name">
                </div>
                <div class="col-md-6">
                  <label  class="form-label">Last Name</label>
                  <input type="text" class="form-control form-control-sm defalt-input-style text-white" required name="last_name" placeholder="Last Name">
                </div>
                <div class="col-md-12">
                    <label class="form-label">Username</label>
                    <div class="input-group input-group-sm">
                      <span class="input-group-text defalt-input-style text-white">@</span>
                      <input type="text" class="form-control defalt-input-style text-white" required name="username" placeholder="Username">
                    </div>
                </div>
                <div class="col-md-6">
                  <label  class="form-label">Email</label>
                  <input type="email" class="form-control form-control-sm defalt-input-style text-white" required name="email" placeholder="Email">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Gender</label>
                    <select name="gender" class="form-control form-select-sm defalt-input-style text-white" required>
                        <%
                        Functions func = new Functions();
                        String options = func.setGender("");
                        %>
                        <%=options %>
                    </select>
                </div>
                <div class="col-md-6">
                  <label  class="form-label">Password</label>
                  <input type="password" class="form-control defalt-input-style text-white form-control-sm" name="password" placeholder="Password" required>
                </div>
                <div class="col-md-6">
                  <label  class="form-label">Repeat Password</label>
                  <input type="password" class="form-control defalt-input-style text-white form-control-sm" name="password_rep" placeholder="Password" required>
                </div>

              <button class="btn btn-warning col-12 mt-5" type="submit">Sign Up</button>
            </form>
            
            <div class="text-white light-container-style">
                <p style="text-align: center; margin: 0; font-size: 14px;">Already have an account? <a href="./login.jsp">Log In</a></p>
            </div>
        </div>
    </div>
 
 

 
 <jsp:include page="./SiteParts/footer.jsp" />   