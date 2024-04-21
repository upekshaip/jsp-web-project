<%@page import="Config.Functions"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("user")) {
        response.sendRedirect("index.jsp");
        return;
    }

    String pageTitle = "My Profile";
    request.setAttribute("title", pageTitle);
%>

<jsp:include page="./SiteParts/dash_header.jsp" />
<jsp:include page="./SiteParts/alerts.jsp" />   

<%
    HashMap user = (HashMap) session.getAttribute("user");
%>
<div class="container p-0">
    <h3 class="text-center my-5 light-container-style py-3" style="margin: 0 !important;">Your Details</h3>
    <form class="row g-3 needs-validation light-container-style " method="post" action="ProfileEditServlet">
        <div class="col-md-6">
            <label  class="form-label">First Name</label>
            <input value="<%=user.get("first_name")%>" type="text" class="form-control form-control-sm defalt-input-style text-white" required name="first_name" placeholder="First Name">
        </div>
        <div class="col-md-6">
            <label  class="form-label">Last Name</label>
            <input value="<%=user.get("last_name")%>" type="text" class="form-control form-control-sm defalt-input-style text-white" required name="last_name" placeholder="Last Name">
        </div>
        <div class="col-md-12">
            <label class="form-label">Username (Username cannot be changed)</label>
            <div class="input-group input-group-sm">
                <span class="input-group-text defalt-input-style text-white">@</span>
                <input value="<%=user.get("username")%>" type="text" class="form-control defalt-input-style text-white" required disabled placeholder="Username">
                <input value="<%=user.get("username")%>" type="text" required hidden name="username" placeholder="Username">
            </div>
        </div>
        <div class="col-md-6">
            <label  class="form-label">Email</label>
            <input value="<%=user.get("email")%>" type="email" class="form-control form-control-sm defalt-input-style text-white" required name="email" placeholder="Email">
        </div>
        <div class="col-md-6">
            <label class="form-label">Gender</label>
            <select name="gender" class="form-control form-select-sm defalt-input-style text-white" required>
                <%
                    Functions func = new Functions();
                    String options = func.setGender((String) user.get("gender"));
                %>
                <%=options%>
            </select>
        </div>

        <button class="btn btn-warning col-12 mt-5" type="submit">Save</button>
    </form>
</div>

<jsp:include page="./SiteParts/dash_footer.jsp" />   